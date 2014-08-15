using System;
using System.IO;
using UnityEngine;


public enum EditorMessage
{
	Invalid = 0,

	Hello = 1,
	GyroSettings = 2,
	ScreenOrientation = 3,

	ScreenStream = 10,

	WebCamStartStream = 20,
	WebCamStopStream = 21,

	Reserved = 255,
};


public class DataReceiver
{
	MemoryStream data = new MemoryStream();
	byte[] buffer = new byte[4096];
	ScreenStream screen;
	WebCamStreamer webCamStreamer;


	public DataReceiver(ScreenStream screen, WebCamStreamer webCamStreamer)
	{
		this.screen = screen;
		this.webCamStreamer = webCamStreamer;
	}


	public void AppendData(Stream stream, int available)
	{
		Profiler.BeginSample("AppendData");

		data.Position = data.Length;
		Utils.CopyToStream(stream, data, buffer, available);

		Profiler.EndSample();
	}


	public void ProcessMessages()
	{
		Profiler.BeginSample("ProcessMessages");

		data.Position = 0;

		while (HasFullMessage(data))
			ProcessMessage(data);

		// Copy leftover bytes
		long left = data.Length - data.Position;
		byte[] buffer = data.GetBuffer();
		Array.Copy(buffer, data.Position, buffer, 0, left);
		data.Position = 0;
		data.SetLength(left);

		Profiler.EndSample();
	}


	private static bool HasFullMessage(Stream stream)
	{
		BinaryReader reader = new BinaryReader(stream);
		long oldPosition = stream.Position;
		bool result = true;

		if (stream.Length - stream.Position < 5)
			result = false;

		if (result)
		{
			reader.ReadByte();
			uint size = reader.ReadUInt32();
			if (stream.Length - stream.Position < size)
				result = false;
		}

		stream.Position = oldPosition;
		return result;
	}


	public void ProcessMessage(Stream stream)
	{
		Profiler.BeginSample("ProcessMessage");

		BinaryReader reader = new BinaryReader(data);
		byte msg = reader.ReadByte();
		uint size = reader.ReadUInt32();
		if (Enum.IsDefined(typeof(EditorMessage), (EditorMessage)msg))
		{
			switch ((EditorMessage)msg)
			{
				case EditorMessage.Hello:             HandleHello(reader); break;
				case EditorMessage.ScreenStream:      HandleScreenStream(reader); break;
				case EditorMessage.GyroSettings:      HandleGyroSettings(reader); break;
				case EditorMessage.ScreenOrientation: HandleScreenOrientation(reader); break;
				case EditorMessage.WebCamStartStream: HandleWebCamStartStream(reader); break;
				case EditorMessage.WebCamStopStream:  HandleWebCamStopStream(reader); break;
			}
		}
		else
		{
			//Console.WriteLine("Unknown message: " + msg);
			reader.ReadBytes((int)size);
		}

		Profiler.EndSample();
	}


	public void HandleHello(BinaryReader reader)
	{
		string magic = reader.ReadCustomString();
		if (magic != "UnityRemote")
			throw new ApplicationException("Handshake failed");

		uint version = reader.ReadUInt32();
		if (version != 0)
			throw new ApplicationException("Unsupported protocol version: " + version);
	}


	public void HandleScreenStream(BinaryReader reader)
	{
		int width = reader.ReadInt32();
		int height = reader.ReadInt32();
		int size = reader.ReadInt32();

		byte[] image = new byte[size];
		reader.Read(image, 0, size);
		screen.UpdateScreen(image, width, height);
	}


	public void HandleGyroSettings(BinaryReader reader)
	{
		Input.gyro.enabled = (reader.ReadInt32() != 0);
		float updateInterval = reader.ReadSingle();
		if (updateInterval != 0.0f && updateInterval != Input.gyro.updateInterval)
			Input.gyro.updateInterval = updateInterval;
	}


	public void HandleScreenOrientation(BinaryReader reader)
	{
		Screen.orientation = (ScreenOrientation)reader.ReadInt32();
		Screen.autorotateToPortrait = reader.ReadInt32() != 0;
		Screen.autorotateToPortraitUpsideDown = reader.ReadInt32() != 0;
		Screen.autorotateToLandscapeLeft = reader.ReadInt32() != 0;
		Screen.autorotateToLandscapeRight = reader.ReadInt32() != 0;
	}


	public void HandleWebCamStartStream(BinaryReader reader)
	{
		string device = reader.ReadCustomString();
		int width = reader.ReadInt32();
		int height = reader.ReadInt32();
		int fps = reader.ReadInt32();
		webCamStreamer.StartStream(device, width, height, fps);
	}


	public void HandleWebCamStopStream(BinaryReader reader)
	{
		string device = reader.ReadCustomString();
		webCamStreamer.StopStream(device);
	}
}

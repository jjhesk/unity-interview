using System.Collections.Generic;
using UnityEngine;


public class RemoteWebCamDevice
{
	public string name;
	public string internalName;
	public WebCamDevice device;
	public WebCamTexture texture;
	public Color32[] imageBuffer;
	public Texture2D image;

	public void StartStream(int width, int height, int fps)
	{
		if (texture != null)
			return;

		texture = new WebCamTexture(internalName, width, height, fps);
		texture.Play();
		Debug.Log("Starting WebCam: " + name + " ("+ texture.width + ", " + texture.height + ")");
	}


	public void StopStream()
	{
		if (texture == null)
			return;

		texture.Stop();
		GameObject.Destroy(texture);
		texture = null;

		if (image != null)
			GameObject.Destroy(image);
		imageBuffer = null;
		image = null;

		Debug.Log("Stopping WebCam: " + name);
	}


	void CheckTextureChange()
	{
		if (image == null)
			image = new Texture2D(texture.width, texture.height, TextureFormat.RGBA32, false);

		if ((image.width != texture.width) || (image.height != texture.height))
			image.Resize(texture.width, texture.height);

		if ((imageBuffer == null) || (imageBuffer.Length != image.width * image.height))
			imageBuffer = new Color32[image.width * image.height];
	}


	public Texture2D GetImage()
	{
		Profiler.BeginSample("GetImage");

		CheckTextureChange();
		Profiler.BeginSample("GetPixels32");
		texture.GetPixels32(imageBuffer);
		Profiler.EndSample();
		Profiler.BeginSample("SetPixels32");
		image.SetPixels32(imageBuffer);
		Profiler.EndSample();

		Profiler.EndSample();
		return image;
	}


	public RemoteWebCamDevice(WebCamDevice device)
	{
		this.name = "Remote " + device.name;
		this.internalName = device.name;
		this.device = device;
	}
}


public class WebCamStreamer
{
	List<RemoteWebCamDevice> devices = new List<RemoteWebCamDevice>();


	public RemoteWebCamDevice[] Devices { get { return devices.ToArray(); } }


	public WebCamStreamer()
	{
		foreach (var device in WebCamTexture.devices)
			devices.Add(new RemoteWebCamDevice(device));
	}


	RemoteWebCamDevice GetDevice(string deviceName)
	{
		foreach (var device in devices)
			if (device.name == deviceName)
				return device;

		return null;
	}


	public bool StartStream(string deviceName, int width, int height, int fps)
	{
		var device = GetDevice(deviceName);
		if (device == null)
			return false;

		device.StartStream(width, height, fps);
		return true;
	}


	public void StopStream(string deviceName)
	{
		var device = GetDevice(deviceName);
		if (device == null)
			return;

		device.StopStream();
	}


	public void OnDisconnect()
	{
		foreach (var device in devices)
			device.StopStream();
	}
}

using UnityEngine;
using System.Collections;

using System;
using System.IO;
using System.Net;
using System.Net.Sockets;


[RequireComponent(typeof(ScreenStream))]
public class RemoteConnection : MonoBehaviour
{
	const int		AndroidRemotePort	= 7201;
	const int		StreamBufferSize	= 10 * 768 * 1024;

	Socket			m_listenSocket;
	TcpClient		m_tcpClient;

	byte[]			m_copyBuffer;

	byte[]			m_readBuffer;
	MemoryStream	m_readStream;

	MemoryStream	m_writeStream;

	DataSender      m_dataSender;
	DataReceiver    m_dataReceiver;
	WebCamStreamer  m_webCamStreamer;

	private int screenWidth;
	private int screenHeight;


	void Start()
	{
		Screen.sleepTimeout = SleepTimeout.NeverSleep;

		m_listenSocket = SetupListening(AndroidRemotePort);
		m_tcpClient = null;

		m_copyBuffer = new byte[128 * 1024];

		m_readBuffer = new byte[StreamBufferSize];
		m_readStream = new MemoryStream(m_readBuffer);
		m_readStream.Position = 0;
		m_readStream.SetLength(0);

		m_writeStream = new MemoryStream(StreamBufferSize);

		m_webCamStreamer = new WebCamStreamer();
	}


	void Update()
	{
		if (m_tcpClient == null)
		{
			if ((m_tcpClient = AcceptIncoming(m_listenSocket)) == null)
				return;
			else
				OnConnected();
		}

		try
		{
			ProcessIncomingData();
			ProcessOutgoingData();
		}
		catch(Exception ex)
		{
			Debug.Log("Exception : " + ex);
			OnDisconnected();
		}
	}


	void OnApplicationQuit()
	{
		if (m_tcpClient != null)
		{
			m_tcpClient.GetStream().Close();
			m_tcpClient.Client.Close();
			m_tcpClient.Close();
		}
		OnDisconnected();
	}


	static Socket SetupListening(int listeningPort)
	{
		var socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
		var endPoint = new IPEndPoint(IPAddress.Any, listeningPort);
		socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.ReuseAddress, true);
		socket.Blocking = false;
		socket.Bind (endPoint);
		socket.Listen (32);
		return socket;
	}


	static TcpClient AcceptIncoming(Socket listeningSocket)
	{
		try
		{
			var tcpSocket = listeningSocket.Accept();
			tcpSocket.Blocking = true;
			Debug.Log("accepted incoming socket");
			return new TcpClient {Client = tcpSocket};
		}
		catch (SocketException ex)
		{
			if (ex.ErrorCode == (int)SocketError.WouldBlock)
				return null;

			Debug.Log("SocketException in AcceptIncoming: " + ex);
			throw (ex);
		}
	}


	void OnConnected()
	{
		m_dataSender = new DataSender(m_writeStream);
		m_dataReceiver = new DataReceiver(GetComponent<ScreenStream>(), m_webCamStreamer);

		m_dataSender.SendHello();
		m_dataSender.SendWebCamDeviceList(m_webCamStreamer.Devices);
	}


	void OnDisconnected()
	{
		m_readStream.Position = 0;
		m_readStream.SetLength(0);
		if (m_tcpClient != null)
			m_tcpClient.Close();
		m_tcpClient = null;
		m_dataSender = null;
		m_dataReceiver = null;

		GetComponent<ScreenStream>().OnDisconnect();
		m_webCamStreamer.OnDisconnect();
	}


	void ProcessIncomingData()
	{
		Profiler.BeginSample("ProcessIncomingData");

		if (m_tcpClient.Client.Available == 0)
			return;

		NetworkStream stream = m_tcpClient.GetStream();
		m_dataReceiver.AppendData(stream, m_tcpClient.Available);
		m_dataReceiver.ProcessMessages();

		Profiler.EndSample();
	}


	void SendWebCamStreams()
	{
		foreach (var device in m_webCamStreamer.Devices)
		{
			if (device.texture != null)
			{
				Texture2D image = device.GetImage();

				Profiler.BeginSample("EncodeToJPG");
				byte[] encoded = image.EncodeToJPG();
				Profiler.EndSample();

				int angle = device.texture.videoRotationAngle;
				bool mirrored = device.texture.videoVerticallyMirrored;
				m_dataSender.SendWebCamStream(device.name, image.width, image.height, encoded, angle, mirrored);
			}
		}
	}


	void ProcessOutgoingData()
	{
		Profiler.BeginSample("ProcessOutgoingData");

		m_dataSender.SendOptions();
		m_dataSender.SendDeviceOrientation();

		// Add accelerometer data
		if (SystemInfo.supportsAccelerometer)
			m_dataSender.SendAccelerometerInput();

		// Add gyroscope data
		if (SystemInfo.supportsGyroscope)
			m_dataSender.SendGyroscopeSettings();
		if (Input.gyro.enabled)
			m_dataSender.SendGyroscopeInput();

		// Add location data
		// TODO: Send Location data
		//if (SystemInfo.supportsLocationService)

		// Add touch data
		if (Input.touchCount > 0)
			m_dataSender.SendTouchInput();

		SendWebCamStreams();

		m_writeStream.Position = 0;
		NetworkStream stream = m_tcpClient.GetStream();
		Utils.CopyToStream(m_writeStream, stream, m_copyBuffer, (int)m_writeStream.Length);
		m_writeStream.Position = 0;
		m_writeStream.SetLength(0);

		Profiler.EndSample();
	}
}



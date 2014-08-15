using UnityEngine;

public class ScreenStream: MonoBehaviour
{
	public Texture logo = null;
	public GUIStyle logoCenter;
	public GUIStyle title;
	public GUIStyle blueBox;
	public GUIStyle deviceInfo;
	public GUIStyle warningBox;

	Texture2D screen = null;
	bool synced = false;

	byte[] image;
	int width;
	int height;


	void Start()
	{
		// Retina
		if(Screen.dpi >= 260)
		{
			title.fontSize = 42;
			blueBox.fontSize = 36;
			deviceInfo.fontSize = 34;
		}
		// Standard
		else 
		{
			title.fontSize = 32;
			blueBox.fontSize = 22;
			deviceInfo.fontSize = 20;
		}
	}


	void OnGUI()
	{
		if (!synced)
		{
			if (SystemInfo.supportsGyroscope)
				Input.gyro.enabled = false;

			ShowInfoScreen();
		}

		if (synced && (screen != null))
			GUI.DrawTexture(new Rect(0,0, Screen.width, Screen.height), screen);
	}


	void ShowInfoScreen()
	{
		GUILayout.BeginArea(new Rect(0,0,Screen.width, Screen.height));

		GUILayout.Space(20);
		GUILayout.Label(logo, logoCenter);
		GUILayout.Space(8);
		GUILayout.Label ("UNITY REMOTE 4", title);
		GUILayout.Space(8);

		GUILayout.Label("Connect this device with a USB Cable to your computer. Press PLAY in the Unity Editor to test.", blueBox);
		GUILayout.Space(10);
		GUILayout.Label("Select a device to use in:\nEdit > Project Settings > Editor", deviceInfo);

		GUILayout.EndArea();

		GUILayout.BeginArea(new Rect(0,0,Screen.width, Screen.height));
		#if UNITY_EDITOR 
		GUILayout.Label("Warning: This project should not be run in the editor, please deploy to a device to use.", warningBox);
		#endif
		GUILayout.EndArea();
	}


	void LateUpdate()
	{
		Profiler.BeginSample("ScreenStream.LateUpdate");

		if (screen == null || screen.width != width || screen.height != height)
			screen = new Texture2D(width, height, TextureFormat.RGB24, false);

		Profiler.BeginSample("LoadImage");
		if ((image != null) && screen.LoadImage(image))
			synced = true;
		image = null;
		Profiler.EndSample();

		Profiler.EndSample();
	}


	public void OnDisconnect()
	{
		synced = false;
		image = null;
	}


	public void UpdateScreen(byte[] data, int width, int height)
	{
		// Loading texture takes a lot of time, so we postpone it and do it in
		// LateUpdate(), in case we receive several images during single frame.
		this.image = data;
		this.width = width;
		this.height = height;
	}
}

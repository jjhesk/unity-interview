using UnityEngine;
using System.Collections;

public class minimapCamera : MonoBehaviour
{
		public	GameObject target;
		private int height = 30;
		static bool mapOpen = false;
		private 	int scrollSensitivity = 3;
		private 	int maxHeight = 80;
		private 	int minHeight = 5;
		private 	bool rotateWithTarget = true;
		// Use this for initialization
		void Start ()
		{
				Screen.lockCursor = true;
				height = PlayerPrefs.GetInt ("MinimapCameraHeight");
		}
	
		// Update is called once per frame
		void Update ()
		{
				// If the minimap button is pressed then toggle the map state.
				if (Input.GetButtonDown ("MinimapToggle")) {
						toggleMinimap ();
				}
		
				// Update the transformation of the camera as per the target's position.

				float x = target.transform.position.x;
				float z = target.transform.position.z;
				// For this, we add the predefined (but variable, see below) height var.
				float y = target.transform.position.y + height;        
				transform.position = new Vector3 (x, y, z);
				// If the minimap should rotate as the target does, the rotateWithTarget var should be true.
				// An extra catch because rotation with the fullscreen map is a bit weird.
				if (rotateWithTarget && !mapOpen) {
						Vector3 eulerAngles = transform.eulerAngles;
						eulerAngles.y = target.transform.eulerAngles.y;
						transform.eulerAngles = eulerAngles;
				}
				// Get the movement of the mouse wheel as an axis. 
				// Needs configuring in your project's input setup.
				float mw = Input.GetAxis ("Mouse ScrollWheel");
				// If the value is positive, add the height as defined by the sensitivity.
				// Also, save the height to RichChar prefs in both cases with the call to saveHeight().
				if (mw > 0 && height < maxHeight) {
						height += scrollSensitivity;
						saveHeight ();
				} 
		// Opposite for negative, just sub the value instead.
		else if (mw < 0 && height > minHeight) {
						height -= scrollSensitivity;
						saveHeight ();
				}
		}

	
		// Function to open/close the minimap.
		private void toggleMinimap ()
		{
				if (!mapOpen) {
						// Set the camera to use the entire screen.
						camera.rect = new Rect (0f, 0f, 1f, 1f);
						// Update the global so other scripts can know.
						mapOpen = true;
						// Unlock the cursor for proper point/click navigation.
						Screen.lockCursor = false;
						// Update the relevant PlayerPref key, could be useful for persistence.
						PlayerPrefs.SetInt ("mapOpen", 1);
				} else {
						// Set the camera to use a small portion of the screen.
						camera.rect = new Rect (0.8f, 0.8f, 1f, 1f);
						// Update the global so other scripts can know.
						mapOpen = false;
						// Lock the cursor for TPS control.
						Screen.lockCursor = true;
						// Update the relevant PlayerPref key, could be useful for persistence.
						PlayerPrefs.SetInt ("mapOpen", 0);
				}
		
				// Debug print the current state of the map.
				Debug.Log ("mapOpen = " + mapOpen);
		
		}
		// Method to store the height of the camera as a PlayerPref.
		private void saveHeight ()
		{
				PlayerPrefs.SetInt ("MinimapCameraHeight", height);
		}
}
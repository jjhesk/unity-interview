/*/
* Script by Devin Curry
	* www.Devination.com
		* www.youtube.com/user/curryboy001
		* Please like and subscribe if you found my tutorials helpful :D
			* Google+ Community: https://plus.google.com/communities/108584850180626452949
				* Twitter: https://twitter.com/Devination3D
				* Facebook Page: https://www.facebook.com/unity3Dtutorialsbydevin
				/*/
using UnityEngine;
using System.Collections;

public class TouchLogic3D : MonoBehaviour
{
		public static int currTouch = 0;//so other scripts can know what touch is currently on screen
		private int touch2Watch = 64;
		private Ray ray;//this will be the ray that we cast from our touch into the scene
		private RaycastHit rayHitInfo = new RaycastHit ();//return the info of the object that was hit by the ray
		private ITouchable3DBase touchedObject = null;
		public Camera fromCam;
		public bool useInterfaceITouchable3DBase = false;

		protected virtual void onSelected (GameObject f, TouchPhase TouchPhaseInt)
		{

		}

		void Update ()
		{

				Debug.DrawRay (fromCam.transform.position, fromCam.transform.forward, Color.white);
				for (int i = 0; i < Input.touchCount; i++) {
						currTouch = i;
						ray = fromCam.ScreenPointToRay (Input.GetTouch (i).position);//creates ray from screen point position
						//Debug.DrawLine(fromCam.transform.position, );
						
						//Debug.Log (ray);
						//if the ray hit something, only if it hit something
						if (Physics.Raycast (ray, out rayHitInfo)) {
								//rayHitInfo.collider.name = 
								//Debug.Log (rayHitInfo);
								//if the thing that was hit implements ITouchable3D
								if (useInterfaceITouchable3DBase) {
										touchedObject = rayHitInfo.transform.GetComponent (typeof(ITouchable3DBase)) as ITouchable3DBase;
										//Debug.Log (rayHitInfo.gameobject.name);
										//If the ray hit something and it implements ITouchable3D
										if (touchedObject != null) {	
												
												switch (Input.GetTouch (i).phase) {
												case TouchPhase.Began:
														touchedObject.OnTouchBegan ();
														touch2Watch = currTouch;
														break;
												case TouchPhase.Ended:
														touchedObject.OnTouchEnded ();
														break;
												case TouchPhase.Moved:
														touchedObject.OnTouchMoved ();
														break;
												case TouchPhase.Stationary:
														touchedObject.OnTouchStayed ();
														break;
												}
										}
								} else {
										TouchableOB touch_ob_start = rayHitInfo.collider.gameObject.GetComponent<TouchableOB> ();
										//touch_ob_start.onSelected (rayHitInfo.collider.gameObject);
										if (touch_ob_start != null) {
												onSelected (rayHitInfo.collider.gameObject, Input.GetTouch (i).phase);
												Debug.Log ("onSelected");
										}
								}
						}
			//On Anywhere
			else if (touchedObject != null && touch2Watch == currTouch) {
								switch (Input.GetTouch (i).phase) {
								case TouchPhase.Ended:
										touchedObject.OnTouchEndedAnywhere ();
										touchedObject = null;
										break;
								case TouchPhase.Moved:
										touchedObject.OnTouchMovedAnywhere ();
										break;
								case TouchPhase.Stationary:
										touchedObject.OnTouchStayedAnywhere ();
										break;
								}
						}
				}
		}
}
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

public class TouchLogicV2 : MonoBehaviour
{
		public static int currTouch = 0;//so other scripts can know what touch is currently on screen
		[HideInInspector]
		public int
				touch2Watch = 64;
		private bool touchLogic = true;

		protected void setTouch (bool b)
		{
				touchLogic = b;
		}

		public virtual void Update ()//If your child class uses Update, you must call base.Update(); to get this functionality
		{
				if (!touchLogic)
						return;
				//Debug.Log ("touch in L:: " + Input.touches.Length);
				//is there a touch on screen?
				if (Input.touches.Length <= 0) {
						OnNoTouches ();

						//Debug.Log ("touch in here");
				} else { //if there is a touch
						//loop through all the the touches on screen
						for (int i = 0; i < Input.touchCount; i++) {
								currTouch = i;
								//executes this code for current touch (i) on screen
								if (this.guiTexture != null && (this.guiTexture.HitTest (Input.GetTouch (i).position))) {
										//if current touch hits our guitexture, run this code
										if (Input.GetTouch (i).phase == TouchPhase.Began) {
												OnTouchBegan ();
												touch2Watch = currTouch;
										}
										if (Input.GetTouch (i).phase == TouchPhase.Ended) {
												OnTouchEnded ();
										}
										if (Input.GetTouch (i).phase == TouchPhase.Moved) {
												OnTouchMoved ();
										}
										if (Input.GetTouch (i).phase == TouchPhase.Stationary) {
												OnTouchStayed ();
										}
								}
				
								//outside so it doesn't require the touch to be over the guitexture
								switch (Input.GetTouch (i).phase) {
								case TouchPhase.Began:
										OnTouchBeganAnywhere ();
										break;
								case TouchPhase.Ended:
										OnTouchEndedAnywhere ();
										break;
								case TouchPhase.Moved:
										OnTouchMovedAnywhere ();
										break;
								case TouchPhase.Stationary:
										OnTouchStayedAnywhere ();
										break;
								}
						}
				}
		}
	
		//the default functions, define what will happen if the child doesn't override these functions
		public virtual void OnNoTouches ()
		{
		}

		public virtual void OnTouchBegan ()
		{
				print (name + " is not using OnTouchBegan");
		}

		public virtual void OnTouchEnded ()
		{
		}

		public virtual void OnTouchMoved ()
		{
		}

		public virtual void OnTouchStayed ()
		{
		}

		public virtual void OnTouchBeganAnywhere ()
		{
		}

		public virtual void OnTouchEndedAnywhere ()
		{
		}

		public virtual void OnTouchMovedAnywhere ()
		{
		}

		public virtual void OnTouchStayedAnywhere ()
		{
		}
}
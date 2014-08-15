using UnityEngine;
using System.Collections;

public class cammovetouch : TouchLogicV2
{
		public enum CamStates
		{
				Browse,
				Front,
				Zoomed,
				AutoSurround,
				Free
		}

		public float rotateSpeed = 100.0f, moveSpeed = 1f, minZoomCameraHeight = 2f, customview_angle = 45f;
		public Vector2 start_angle, porportion;
		public int invertPitch = 1;
		public Transform camera, rigcam, startToFocusPosition;
		private Transform tempRigCam;
		private float pitch = 0.0f,
				yaw = 0.0f, camz = 0f, camx = 0f;
		//[NEW]//cache initial rotation of player so pitch and yaw don't reset to 0 before rotating
		private Vector3 look_dir, oRotation, oPos, curPos, translation;
		// Use this for initialization
		[SerializeField]
		private CamStates
				camState;
		public float zoomSpeed = 5.0f;
	
		//buckets for caching our touch positions
		private Vector2 currTouch1 = Vector2.zero,
				lastTouch1 = Vector2.zero,
				currTouch2 = Vector2.zero,
				lastTouch2 = Vector2.zero;
	
		//used for holding our distances and calculating our zoomFactor
		private float currDist = 0.0f,
				lastDist = 0.0f,
				zoomFactor = 0.0f;

		//settings for animating the camera
		private float leftX = 0f, leftY = 0f, lookWeight = 0f, firstPersonLookSpeed = 0.3f;
		private Vector3 target_cam_pos, characterOffset, characterLookOffset, targetPos;
		private Vector3 velocityCamSmooth = Vector3.zero;

		void Start ()
		{
				camera.rotation = Quaternion.Euler (new Vector3 (start_angle.x, start_angle.y, 0f));
				oRotation = camera.eulerAngles;
				oPos = startToFocusPosition.position;
				camz = startToFocusPosition.position.z;
				camx = startToFocusPosition.position.x;
				look_dir = camera.transform.forward;
				//pitch = camera.rotation.x;
				//yaw = camera.y;
				//Debug.Log ("Start in here");
				BrowseMode ();
		}

		public void ViewAngle (float e)
		{
				//start_angle = new Vector2 (start_angle.x, start_angle.y + e);
				customview_angle += e;
		}

		public override void OnTouchStayedAnywhere ()
		{
				if (isZoom) {
						Zoom ();
				} else {
						moveCam ();
				}
		}
  
		public override void OnTouchBeganAnywhere ()
		{
				//Debug.Log ("touch in here");
				touch2Watch = TouchLogicV2.currTouch;
		}

		public override void OnTouchMovedAnywhere ()
		{
				Zoom ();
				if (!isZoom) {
						moveCam ();
				}
				
		}

		public override void OnTouchEndedAnywhere ()
		{
				//SpecialEffectsScript.MakeExplosion ((position));
		}

		private void moveCam ()
		{
				
				//oPos = curPos;
				//pitch -= Input.GetTouch (touch2Watch).deltaPosition.y * rotateSpeed * invertPitch * Time.deltaTime;
				//yaw += Input.GetTouch (touch2Watch).deltaPosition.x * rotateSpeed * invertPitch * Time.deltaTime;
				//limit so we dont do backflips
				//pitch = Mathf.Clamp (pitch, -80, 80);
				//do the rotations of our camera 
				//player.eulerAngles = new Vector3 (pitch, yaw, 0.0f);
				//Debug.Log ("touch in here");
				try {
						camz = Input.GetTouch (touch2Watch).deltaPosition.y * moveSpeed * invertPitch * Time.deltaTime;
						camx = Input.GetTouch (touch2Watch).deltaPosition.x * moveSpeed * invertPitch * Time.deltaTime;
						//look_dir.Normalize ();
						//curPos = oPos + moveDirection * moveSpeed * Time.fixedDeltaTime;
						//rigcam.position = Quaternion.Euler (look_dir) * new Vector3 (camx, oPos.y, camz);
						//rigcam.position = new Vector3 (camx, 0f, camz) * look_dir;
						//camera.transform.position = Vector3.Lerp (camera.transform.position, target.position, Time.deltaTime * moveRate);
						//rigcam.position = new Vector3 (camx, oPos.y, camz);
						//Vector3 move = new Vector3 (camx, 0, camz);
						//rigcam.position = move *  QuaternionUtilities.QuaternionUtils.
						//rigcam.Translate (move, rigcam);
						//Vector3 camDir = Camera.main.transform.forward;
						//Vector3 camLeft = Vector3.Cross (look_dir, Vector3.down);
						//Vector3 camDown = Vector3.Cross (look_dir, camLeft);
						//Vector3 camPos = curPos;
						//camPos += -camLeft * camx;
						//camPos += -camDown * camz;
						//rigcam.transform.position = camPos;
						//oPos = Vector3.Cross (look_dir, new Vector3 (camx, 0, camz)) + oPos;
						//rigcam.transform.position = oPos; 
						//rigcam.Translate (look_dir.normalized * camz);
						//rigcam.position += new Vector3 (camx, oPos.y, camz);
						//rigcam.position += Quaternion.Euler (look_dir.normalized * camz) * Vector3.up;
						//rigcam.position = Vector3.Lerp (camera.transform.position, target.position, Time.deltaTime * moveRate);
						//Vector3 rotateOffset = Quaternion.Euler (0f, start_angle.y, 0f) * Vector3.forward * 2f;
						//Quaternion.LookRotation(forward).eulerAngles.y
						target_cam_pos += Quaternion.Euler (0f, start_angle.y, 0f) * new Vector3 (camx, 0f, camz);
						oPos = target_cam_pos;
						Debug.DrawLine (target_cam_pos, target_cam_pos + Quaternion.Euler (0f, start_angle.y, 0f) * Vector3.forward * 2f, Color.green);
				} catch (UnityException e) {

				}
					
				
		}
  
		private bool isZoom = false;
		//find distance between the 2 touches 1 frame before & current frame
		//if the delta distance increased, zoom in, if delta distance decreased, zoom out
		private void Zoom ()
		{
				//Caches touch positions for each finger
				switch (TouchLogicV2.currTouch) {
				case 0://first touch
						currTouch1 = Input.GetTouch (0).position;
						lastTouch1 = currTouch1 - Input.GetTouch (0).deltaPosition;
						break;
				case 1://second touch
						currTouch2 = Input.GetTouch (1).position;
						lastTouch2 = currTouch2 - Input.GetTouch (1).deltaPosition;
						break;
				}
				//finds the distance between your moved touches
				//we dont want to find the distance between 1 finger and nothing
				if (TouchLogicV2.currTouch >= 1) {
						currDist = Vector2.Distance (currTouch1, currTouch2);
						lastDist = Vector2.Distance (lastTouch1, lastTouch2);
						isZoom = true;
				} else {
						currDist = 0.0f;
						lastDist = 0.0f;
						isZoom = false;
				}
				if (isZoom) {
						//Calculate the zoom magnitude
						zoomFactor = Mathf.Clamp (lastDist - currDist, -2.0f, 2.0f);
						//if (zoomFactor < 0f) {
						//		zoomFactor = 0f;
						//}
						//apply zoom to our camera
						tempRigCam = rigcam;
						tempRigCam.Translate (look_dir * zoomFactor * zoomSpeed * Time.deltaTime * invertPitch);
						if (tempRigCam.position.y <= minZoomCameraHeight) {
								rigcam.position = rigcam.position;
						} else {
								oPos = target_cam_pos;
								rigcam.position = target_cam_pos = tempRigCam.position;
								//porportion = new Vector2 (porportion.x, rigcam.position.y);
						}
				}
		}
		//start to trigger this
		public void PanTo (GameObject target)
		{
				targetPos = target.transform.position;
				characterOffset = target.transform.position + Vector3.up * porportion.y;
				characterLookOffset = target.transform.position + Vector3.up * porportion.y * 0.4f;

				//groundPos + Quaternion.Euler (0, Y, 0) * Vector3.forward * 1.5f;
				//curLookDir = Vector3.Normalize (characterOffset - camera.position);
				camState = CamStates.Front;
				setTouch (false);
		}
		//start to trigger this
		public void BrowseMode ()
		{
				camState = CamStates.Browse; 
				camera.rotation = Quaternion.Euler (new Vector3 (start_angle.x, start_angle.y, 0f));
				target_cam_pos = oPos;
				setTouch (true);
		}

		void LateUpdate ()
		{
				switch (camState) {
				case CamStates.Front:
						ResetCamera ();

						Vector3 rotateOffset = Quaternion.Euler (0f, customview_angle, 0f) * Vector3.forward * porportion.x;
						target_cam_pos = characterOffset + rotateOffset;
						Debug.DrawLine (targetPos, targetPos + rotateOffset, Color.green);
						Debug.DrawLine (targetPos + rotateOffset, camera.position, Color.green);
      					// Only update camera look direction if moving
						Debug.DrawLine (rigcam.position, target_cam_pos, Color.cyan);
						//lookAt = (Vector3.Lerp (this.transform.position + this.transform.forward, lookAt, Vector3.Distance (this.transform.position, firstPersonCamPos.XForm.position)));
						camera.LookAt (characterLookOffset);
						break;
				case CamStates.Browse:
						break;
				}
				SmoothPosition (rigcam.position, target_cam_pos);
		}

		/// <summary>
		/// Reset local position of camera inside of parentRig and resets character's look IK.
		/// </summary>
		private void ResetCamera ()
		{
				lookWeight = Mathf.Lerp (lookWeight, 0.0f, Time.deltaTime * firstPersonLookSpeed);
				camera.localRotation = Quaternion.Lerp (transform.localRotation, Quaternion.identity, Time.deltaTime);
		}

		private void SmoothPosition (Vector3 fromPos, Vector3 toPos)
		{
				// Making a smooth transition between camera's current position and the position it wants to be in
				rigcam.position = Vector3.SmoothDamp (fromPos, toPos, ref velocityCamSmooth, firstPersonLookSpeed);
		}

}

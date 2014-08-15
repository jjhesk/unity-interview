using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
public class FollowTrackingCamera : MonoBehaviour
{
		// Camera target to look at.
		public Transform target;
		private Transform check_target;
		// Exposed vars for the camera position from the target.
		public float height = 20f;
		public float distance = 20f;
		// Camera limits.
		public float min = 10f;
		public float max = 60;
	
		// Rotation.
		public float rotateSpeed = 1f;
	
		// Options.
		public bool doRotate = false;
		public bool doZoom = true;
	
		// The movement amount when zooming.
		public float zoomStep = 30f;
		public float zoomSpeed = 5f;
		private float heightWanted;
		private float distanceWanted;
		private LTDescr desc;
		// Result vectors.
		private Vector3 zoomResult;
		private Quaternion rotationResult;
		private Vector3 targetAdjustedPosition;
		public GameObject tweenObject;
		private bool rotationcam = false;
		private float dynamciangle = 0f, appliedangle;
		private bool trigger_next_cb;

		void Start ()
		{
				// Initialise default zoom vals.
				heightWanted = height;
				distanceWanted = distance;
				// Setup our default camera.  We set the zoom result to be our default position.
				zoomResult = new Vector3 (0f, height, -distance);
		}

		void Update ()
		{
				if (target != null && check_target != target && (doZoom || doRotate)) {
						doZoom = false;
						doRotate = false;
						transit ();
						Debug.Log ("check_target != target start transition");
				}
		}

		void LateUpdate ()
		{
				// Check target.
				if (target == null) {
						Debug.Log ("This camera has no target, you need to assign a target in the inspector.");
						return;
				} else if (check_target == target) {
						if (doZoom)
								forZoom ();
			
						if (doRotate)
								forRotate ();
			
						// Set the camera position reference.
						targetAdjustedPosition = rotationResult * zoomResult;
						tweenObject.transform.position = target.position + targetAdjustedPosition;
						// Face the desired position.
						tweenObject.transform.LookAt (target);
				}
				
		}

		private void transit ()
		{
				forZoom ();
				forRotate ();
				targetAdjustedPosition = rotationResult * zoomResult;
				Vector3 gp = target.position + targetAdjustedPosition;
				Debug.Log ("LeanTween is target=tweenObject");
				desc = LeanTween
				.move (tweenObject, gp, 2.1f)
				.setEase (LeanTweenType.easeOutExpo)
				.setOnComplete (this.transitDone)
				//	.setOnUpdate (this.updatetransit)
				.setDelay (1f);
			
				
		}

		public void startNextTurnPlayer (Transform t)
		{
				rotationcam = false;
				target = t;
				trigger_next_cb = true;
		}

		public void ToFocus (Transform focus)
		{
				Debug.Log ("there is target=focus");
				this.target = focus;
			
		}

		public void ToFocusDice (Transform focus)
		{
				rotationcam = true;
				this.target = focus;
				this.check_target = focus;
		}

		public void SnapFocus (Transform focus)
		{
				rotationcam = false;
				this.target = focus;
				this.check_target = focus;
		}

		private void updatetransit (Vector3 v)
		{

		}

		private void transitDone ()
		{
				Debug.Log ("there is check_target=target");
				check_target = target;
				//LeanTween.Destroy (this);
				doZoom = true;
				doRotate = true;
				desc.cancel ();
				desc = null;
				//Debug.LogError ("done check_target = target");

				if (trigger_next_cb) {
						gameEngine.Instance.cb_nexturn_trigger ();
						trigger_next_cb = false;
				}

		}

		private void OnTouchDown (Vector2 r)
		{

		}

		private void forZoom ()
		{
				// Record our mouse input.  If we zoom add this to our height and distance.
				//float mouseInput = Input.GetAxis ("Mouse ScrollWheel");
				float mouseInput = 0f;
				heightWanted -= zoomStep * mouseInput;
				distanceWanted -= zoomStep * mouseInput;

				// Make sure they meet our min/max values.
				heightWanted = Mathf.Clamp (heightWanted, min, max);
				distanceWanted = Mathf.Clamp (distanceWanted, min, max);

				height = Mathf.Lerp (height, heightWanted, Time.deltaTime * zoomSpeed);
				distance = Mathf.Lerp (distance, distanceWanted, Time.deltaTime * zoomSpeed);

				// Post our result.
				zoomResult = new Vector3 (0f, height, -distance);
		}

		public FollowTrackingCamera autoRotate (bool b)
		{
				rotationcam = b;
				return this;
		}

		public float kDelta;

		private void forRotate ()
		{
				if (!rotationcam) {
						// Work out the current and wanted rots.
						float currentRotationAngle = tweenObject.transform.eulerAngles.y;
						float wantedRotationAngle = target.eulerAngles.y;
						kDelta = Mathf.Abs (wantedRotationAngle) - Mathf.Abs (currentRotationAngle);
						// Smooth the rotation.
						if (kDelta > 1f) {
								appliedangle = Mathf.LerpAngle (currentRotationAngle, wantedRotationAngle, rotateSpeed * Time.deltaTime);
						} else {
								appliedangle = wantedRotationAngle;
						}

						//appliedangle = wantedRotationAngle;
						//Debug.Log("errr " + appliedangle);
				} else {
						dynamciangle = appliedangle;
						dynamciangle += rotateSpeed / 10.5f;
						appliedangle = dynamciangle;
				}
				// Convert the angle into a rotation.
				rotationResult = Quaternion.Euler (0f, appliedangle, 0f);
		}

		static public GameObject PickObject (Vector2 screenPos, LayerMask ignoreLayers)
		{
				Ray ray = Camera.main.ScreenPointToRay (screenPos);
				RaycastHit hit;
		
				if (Physics.Raycast (ray, out hit, float.MaxValue, ~ignoreLayers))
						return hit.collider.gameObject;
		
				return null;
		}
	
		//search up a hierarchy until we find the Component we're looking for
		static public T FindInParents<T> (GameObject go) where T : Component
		{
				if (go == null)
						return null;
				object comp = go.GetComponent<T> ();
		
				if (comp == null) {
						Transform t = go.transform.parent;
			
						while (t != null && comp == null) {
								comp = t.gameObject.GetComponent<T> ();
								t = t.parent;
						}
				}
				return (T)comp;
		}

		static public bool IsTopDown ()
		{
				float angle = Mathf.Abs (Camera.main.transform.forward.y);
				if (angle > 0.2f) {
						return true;
				}
				return false;		
		}
}
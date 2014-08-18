using UnityEngine;
using System.Collections;

public class rollballcontroller : MonoBehaviour
{
		//public Joystick controller;
		// Use this for initialization
		private Vector3 tilt;
		public UIJoyStick controller;
		public float speed = 2f;
//		[SerializeField]
//		private cubebase
//				basedata;

		//public cubebase setCube{ set { basedata = value; } get { return basedata; } }

		void Start ()
		{
				tilt = Vector3.zero;
		}
	
		// Update is called once per frame
		void Update ()
		{
				if (controller != null) {
						tilt.x = -controller.joyStickPosY;
						tilt.z = -controller.joyStickPosX;
						transform.GetComponent<Rigidbody> ().AddForce (tilt * speed * Time.deltaTime);
				}
		}

		public void resetposition ()
		{
				transform.position = Vector3.zero;
		}

		void OnCollisionEnter (Collision collision)
		{
				foreach (ContactPoint contact in collision.contacts) {
						Debug.DrawRay (contact.point, contact.normal, Color.white);
						if (contact.otherCollider.CompareTag ("cube")) {
								cubedata component = contact.otherCollider.gameObject.GetComponent<cubedata> ();
								int color = component.type;
								int id = component.cubeID;
								mainengine.Instance.hitCube (color, id);
								//Debug.Log (c);
						}
				}
				if (collision.relativeVelocity.magnitude > 2) {
						//audio.Play ();
				}
		
		}
}

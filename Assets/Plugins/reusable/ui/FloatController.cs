using UnityEngine;
using System.Collections;

[RequireComponent (typeof(Rigidbody))]
public class FloatController : MonoBehaviour
{
		public Vector2 waterLevelRange, floatHeightRange, OmegaHeightRange, OmegaWaveRange;
		public float waterLevel, floatHeight;
		public Vector3 buoyancyCentreOffset, roation_offset;
		public float bounceDamp;
		//public float amplitudeX = 0f;
		//public float amplitudeY = 1.0f;
		//public float omegaX = 0f;
		[SerializeField]
		private float
				omegaHeight = 0.50f, omegaWave = 1.1f, amplitudeRotationMultipler = 1f;
		[SerializeField]
		private bool
				bounce = false;
		[SerializeField]
		private Vector3
				floatDirection = Vector3.up;
		[SerializeField]
		private Vector3
				locationRotationDirection = Vector3.up;
		[SerializeField]
		private float
				MaxRotationAngle = 0.3f;
		private float
				index;
		private Vector3 currentpos;
		[SerializeField]
		private FLOATCALCULATION
				cal;
		public Transform target_transform;

		public enum FLOATCALCULATION
		{
				PHYSIC= 0,
				ANIMATION = 1,
				NONE = 2
		}

		public enum SSAOSamples
		{
				Low = 0,
				Medium = 1,
				High = 2,
		}

		void Awake ()
		{

				if (target_transform == null) {
						target_transform = gameObject.transform;
				}
				if (cal == FLOATCALCULATION.PHYSIC) {
						gameObject.rigidbody.useGravity = true;
						gameObject.rigidbody.isKinematic = false;
//						foreach (Transform t in transform) {
//								if (t.gameObject.name == "body")
//										t.gameObject.transform.localRotation = Quaternion.Euler (roation_offset);
//						}
						target_transform.localRotation = Quaternion.Euler (roation_offset);
				}

				if (cal == FLOATCALCULATION.ANIMATION) {
						gameObject.rigidbody.useGravity = false;
						gameObject.rigidbody.isKinematic = false;
				}
				if (cal == FLOATCALCULATION.NONE) {

				}
		}

		void Start ()
		{
		}

		void FixedUpdate ()
		{
				if (cal == FLOATCALCULATION.ANIMATION) {
						index += Time.deltaTime;
						//float x = amplitudeX * Mathf.Cos (omegaX * index);
						float mu = floatHeight * Mathf.Sin (omegaHeight * index);
						float maxR = MaxRotationAngle * Mathf.Sin (omegaWave * index);
						float wavePos = bounce ? Mathf.Abs (mu) : mu;
						target_transform.localPosition = floatDirection * wavePos + currentpos + new Vector3 (0f, waterLevel, 0f);
						//new Vector3 (currentpos.x + x, currentpos.y + y, currentpos.z);
						target_transform.localRotation = Quaternion.Euler (locationRotationDirection * maxR * amplitudeRotationMultipler);
				}
				if (cal == FLOATCALCULATION.NONE) {
			
				}
				if (cal == FLOATCALCULATION.PHYSIC) {
						Vector3 actionPoint = target_transform.position + target_transform.TransformDirection (buoyancyCentreOffset);
						float forceFactor = 1f - ((actionPoint.y - waterLevel) / floatHeight);
						if (forceFactor > 0f) {
								Vector3 uplift = -Physics.gravity * (forceFactor - rigidbody.velocity.y * bounceDamp);
								rigidbody.AddForceAtPosition (uplift, actionPoint);
						}
				}
		}
}

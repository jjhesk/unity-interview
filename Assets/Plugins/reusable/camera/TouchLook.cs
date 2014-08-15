using UnityEngine;
using System.Collections;

[AddComponentMenu("Camera-Control/Touch Look")]
public class TouchLook : MonoBehaviour {
	
	public float sensitivityX = 5.0f;
	public float sensitivityY = 5.0f;
	
	public bool invertX = false;
	public bool invertY = false;
	
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		if (Input.touches.Length > 0)
		{
			if (Input.touches[0].phase == TouchPhase.Moved)
			{
				Vector2 delta = Input.touches[0].deltaPosition;
				float rotationZ = delta.x * sensitivityX * Time.deltaTime;
				rotationZ = invertX ? rotationZ : rotationZ * -1;
				float rotationX = delta.y * sensitivityY * Time.deltaTime;
				rotationX = invertY ? rotationX : rotationX * -1;
				
				transform.localEulerAngles += new Vector3(rotationX, rotationZ, 0);
			}
		}
	}
}
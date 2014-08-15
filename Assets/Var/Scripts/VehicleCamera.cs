using UnityEngine;
using System.Collections;

public class VehicleCamera : MonoBehaviour
{

    public Transform target;
    public float smooth = 0.3f;
    public float distance = 5.0f;
    public float haight = 5.0f;
    public Transform[] cameraSwitchView;
    public GUISkin GUISkin;

    private float yVelocity = 0.0f;
    private float xVelocity = 0.0f;
    private int Switch;




    void Update()
    {



        var carScript = (VehicleControl)target.GetComponent<VehicleControl>();
        camera.fieldOfView = Mathf.Clamp(carScript.speed / 20.0f + 60.0f, 60, 70);



        if (Input.GetKeyDown(KeyCode.C))
        {
            Switch++;
            if (Switch > cameraSwitchView.Length) { Switch = 0; }
        }



        if (Switch == 0)
        {
            // Damp angle from current y-angle towards target y-angle







            float yAngle = Mathf.SmoothDampAngle(transform.eulerAngles.y,
            target.eulerAngles.y, ref yVelocity, smooth);


            float xAngle = Mathf.SmoothDampAngle(transform.eulerAngles.x,
            target.eulerAngles.x, ref xVelocity, smooth);

            // Position at the target
            Vector3 position = target.position;
            // Then offset by distance behind the new angle
            position += Quaternion.Euler(xAngle, yAngle, 0) * new Vector3(0, 0, -distance);
            // Apply the position
          //  transform.position = position;

            // Look at the target
            transform.eulerAngles = new Vector3(xAngle, yAngle, 0);

            var direction = transform.rotation * -Vector3.forward;
            var targetDistance = AdjustLineOfSight(target.position + new Vector3(0, haight, 0), direction);


            transform.position = target.position + new Vector3(0, haight, 0) + direction * targetDistance;


        }
        else
        {

            transform.position = cameraSwitchView[Switch - 1].position;
            transform.rotation = Quaternion.Lerp(transform.rotation, cameraSwitchView[Switch - 1].rotation, Time.deltaTime * 10.0f);

        }







    }






    public LayerMask lineOfSightMask = 0;

         
float AdjustLineOfSight (Vector3 target , Vector3 direction)
{


	RaycastHit hit;
	
	if (Physics.Raycast (target, direction,out hit, distance, lineOfSightMask.value))
		return hit.distance;
    else
		return distance;
	
}









    public void OnGUI()
    {


        GUI.skin = GUISkin;




        if (GUI.Button(new Rect(20, 206, 100, 20), "Vehicle 1"))
        {
            Application.LoadLevel(0);
        }

        if (GUI.Button(new Rect(120, 206, 100, 20), "Vehicle 2"))
        {
            Application.LoadLevel(1);
        }


        GUI.Box(new Rect(5, 5, 250, 200), "");

        GUI.Label(new Rect(10, 10, 200, 50), "VCAR (keys to control the car)");

        GUI.Label(new Rect(10, 50, 200, 50), "C key to change camera");

        GUI.Label(new Rect(10, 80, 200, 50), "SPACE key to handbrake");

        GUI.Label(new Rect(10, 100, 250, 50), "ARROWS keys or WASD keys to drive the car");


        GUI.Label(new Rect(10, 150, 200, 50), "R key to Rest Scene");



        if (Input.GetKeyDown(KeyCode.R))
        {
            Application.LoadLevel(Application.loadedLevel);
        }



    }




}

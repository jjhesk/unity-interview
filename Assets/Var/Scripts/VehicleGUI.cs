using UnityEngine;
using System.Collections;

public class VehicleGUI : MonoBehaviour
{


    public Texture2D arrow;
    public Transform arrowObject;
    public Texture2D tachoMeter;
    public GUISkin GUISkin;

    private int gearst = 0;
    private float thisAngle = -150;

    void OnGUI()
    {


        GUI.skin = GUISkin;


        var carScript = transform.GetComponent<VehicleControl>();

        gearst = carScript.currentGear;

       
        thisAngle = (carScript.motorRPM / 20) - 175;
        thisAngle = Mathf.Clamp(thisAngle, -180, 90);


        GUI.BeginGroup(new Rect(Screen.width - 260, Screen.height - 260, 800, 600));


        GUI.Label(new Rect(16, 16, 250, 250), tachoMeter);	// x position, y position, size x, size y

        Matrix4x4 matrixBackup = GUI.matrix; //Here comes the tachoneedle rotation

        Vector2 pos = new Vector2(141, 141); // rotatepoint in texture plus x/y coordinates. our needle is at 16/16. Texture is 128/128. Makes middle 64 plus 16 = 80

        GUIUtility.RotateAroundPivot(thisAngle, pos);

        if (arrowObject)
        arrowObject.localEulerAngles = new Vector3(20, 0, 185 - thisAngle);

        Rect thisRect = new Rect(16, 16, 250, 250); //x position, y position, size x, size y

        GUI.DrawTexture(thisRect, arrow);
        GUI.matrix = matrixBackup;




        if (gearst > 0 && carScript.speed > 1)
        {
            GUI.color = Color.green;
            GUI.Label(new Rect(175, 175, 250, 250), "" + gearst);
        }
        else if (carScript.speed > 1)
        {
            GUI.color = Color.red;
            GUI.Label(new Rect(175, 175, 250, 250), "R");
        }
        else
        {

            GUI.Label(new Rect(175, 175, 250, 250), "N");
        }

        GUI.color = Color.yellow;
        GUI.Label(new Rect(110, 120, 100, 30), (int)carScript.speed + " KM/H");








        GUI.EndGroup();







    }
}

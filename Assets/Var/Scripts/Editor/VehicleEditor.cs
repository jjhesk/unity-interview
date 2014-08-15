using UnityEngine;
using UnityEditor; 
using System;
using System.Collections.Generic; 
using System.IO;


[CustomEditor(typeof(VehicleControl))]


public class VehicleEditor : Editor
{

    public void OnInspectorGUI() { VehicleControl myPlayer = (VehicleControl)target; }

}

	
	
	
	
	
	

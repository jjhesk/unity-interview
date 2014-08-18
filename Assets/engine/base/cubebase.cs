using UnityEngine;
using System.Collections;
using System.Collections.Generic;

[System.Serializable]
public class cubebase
{
		public Color color;
		public int hitpoint;

		public cubebase ()
		{
		}
}

[System.Serializable]
public class gameLevelD
{
		public List<cubebase> listdata = new List<cubebase> ();
		public int total;
		public int gameseconds;
}

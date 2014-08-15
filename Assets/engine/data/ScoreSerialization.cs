using UnityEngine;
using System.Collections;
using LitJson;

public class ScoreSerialization: MonoBehaviour
{

		public static void CubeSerialization (cubebase[] list)
		{
				string datamap = JsonMapper.ToJson (list);
				Debug.Log (datamap);
		}
	
		public static void CubeDeserialization ()
		{
				string json = @"
	            {
	                ""Name""     : ""Thomas More"",
	                ""Age""      : 57,
	                ""Birthday"" : ""02/07/1478 00:00:00""
	            }";
				//Person thomas = JsonMapper.ToObject<Person> (json);
				Debug.Log (json);
		}

}
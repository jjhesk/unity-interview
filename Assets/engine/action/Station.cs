using UnityEngine;
using System.Collections;

[System.Serializable]
public class Station : Property
{
		public int position_step;
		public GameObject prefab;

		public Station ()
		{
				owned_by_id = -2;
				level = 0;
		}
}

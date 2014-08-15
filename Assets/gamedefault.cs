using UnityEngine;
using System.Collections;

public class gamedefault : MonoBehaviour
{
		public static gamedefault Instance;
		public GameObject stage;
		public GameObject prefab_cube;
		public Vector2 _area_for_rez;
		// Use this for initialization
		void Start ()
		{
				Instance = this;
				generate_cube (10);
		}

		public void generate_cube (int total_cubes)
		{
				
				if (stage != null) {
						if (prefab_cube != null) {
								for (int i=0; i<total_cubes; i++) {
										GameObject cube = Instantiate (prefab_cube) as GameObject;
										float x = Random.Range (-_area_for_rez.x / 2, _area_for_rez.x / 2);
										float z = Random.Range (-_area_for_rez.y / 2, _area_for_rez.y / 2);
										cube.transform.position = new Vector3 (x, 1f, z);
								}
							
						}
				}
		}
}

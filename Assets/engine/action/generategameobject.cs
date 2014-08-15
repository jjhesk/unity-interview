using UnityEngine;
using System.Collections;

public class generategameobject : MonoBehaviour
{
		public static generategameobject Instance;
		public GameObject stage;
		public GameObject prefab_cube;
		public Vector2 _area_for_rez;
		public int totalcubes = 10;
		public cubebase[] colorReference;
		// Use this for initialization
		//private int current_objects = 0 ;

		void Start ()
		{
				Instance = this;
				//InvokeRepeating ("rez_game_object", 2, 0.3f);
		}
//	public Rigidbody projectile;
//		public void rez_game_object ()
//		{
//				Rigidbody instance = Instantiate (projectile);
//				instance.velocity = Random.insideUnitSphere * 5;
//		}
		public void generate_cube ()
		{
				
				//if (stage == null)
				//return false;
				//if (prefab_cube == null)
				//return false;
				remove_all_cubes ();
				int total_color = colorReference.Length;
				Debug.Log (total_color);
				float incre = (float)_area_for_rez.x / (float)totalcubes;
				for (int i=0; i<totalcubes; i++) {
						GameObject cube = Instantiate (prefab_cube) as GameObject;
						float x = -_area_for_rez.x / 2f + (float)incre * i;
						float z = Random.Range (-_area_for_rez.y / 2, _area_for_rez.y / 2);
						cube.transform.position = new Vector3 (x, 1f, z);
						cube.transform.parent = stage.transform;
						//color configurations
						
						if (total_color > 0) {
								int color_selected = Random.Range (0, total_color);
								Debug.Log (color_selected);
								cubebase mcolor = colorReference [color_selected];
								cube.renderer.materials [0].color = mcolor.color;
						}
				}
							
			
		}

		private void remove_all_cubes ()
		{
				GameObject[] g = GameObject.FindGameObjectsWithTag ("cube") as GameObject[];
				foreach (GameObject t in g) {
						Destroy (t);
				}
		}
}

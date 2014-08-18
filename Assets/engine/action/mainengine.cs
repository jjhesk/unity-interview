using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class mainengine : MonoBehaviour
{
		public static mainengine Instance;
		// Use this for initialization
		void Start ()
		{
				Instance = this;
		}

		public void OnStartPressed ()
		{
				loaddata ();
				gameevent.Instance.timer_start ();
				generategameobject.Instance.generate_cube ();
		}

		private void loaddata ()
		{
				if (Application.platform != RuntimePlatform.Android) {
						if (LoadGameData.gamedata != null) {
								gameLevelD data = LoadGameData.gamedata.getLevelSetup;
								generategameobject.Instance.colorReference = data.listdata.ToArray ();
								generategameobject.Instance.totalcubes = data.total;
								gameevent.Instance.endTimeSecond = data.gameseconds;
								//totalcubes = LoadGameData.gamedata.
						}
				}
		}

		private int current_hit_type = -1;
		//Streak
		private int hit_level = 1;
		private List<int> history = new List<int> ();
		private HashSet<int> uniqID = new HashSet<int> ();

		private void historyCal (int ID)
		{
				history.Add (ID);
				uniqID.Add (ID);
				if (uniqID.Count == generategameobject.Instance.totalcubes) {
						gameevent.Instance.addBonus (generategameobject.Instance.totalcubes);
				}
		}

		public void hitCube (int typecube, int ID)
		{
				if (current_hit_type == typecube) {
						hit_level++;
				} else {
						current_hit_type = typecube;
						hit_level = 1;
				}
				historyCal (ID);
				int score = generategameobject.Instance.colorReference [typecube].hitpoint * hit_level;
				Debug.Log ("hit type:" + typecube + ", score calculated added:" + score);
				gameevent.Instance.addScore (score);
		}
		
}

using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

public class PlayersScores : MonoBehaviour
{
		public UILabel scoreboard;
		public static PlayersScores Instance;
		private static GameObject keeper;
		[SerializeField]
		private List<int>
				scores = new List<int> ();
		// Use this for initialization
		void Start ()
		{
				if (Instance == null) {
						//DontDestroyOnLoad (this);
						if (keeper == null) {
								keeper = new GameObject ();
								keeper.name = "_scorekeeper";
								keeper.AddComponent (typeof(PlayersScores));
								keeper.isStatic = true;
								#if !UNITY_EDITOR
								keeper.hideFlags = HideFlags.HideAndDontSave;
								#endif
								DontDestroyOnLoad (keeper);
								Instance = keeper.GetComponent<PlayersScores> ();
						}

				}
		}
	
		public void PostScore (int score)
		{
				scores.Add (score);
		}

		public void theScoreList ()
		{
				scores.Sort ();
				scores.Reverse ();
				string display = "";
				int k = 0;
				foreach (int score in scores) {
						Debug.Log (score);
						//Console.WriteLine(item.ToString() + "\n");
						if (k < 3) {
								if (k == 0) {
										display += "top score -> " + score + "\n";
								} else {
										display += score + "\n";
								}
								
						}
						k++;
				}
				//LoadData
				Debug.Log (display);
				scoreboard.text = display;
		}
}

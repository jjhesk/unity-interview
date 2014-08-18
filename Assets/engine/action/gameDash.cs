using UnityEngine;
using System.Collections;

public class gameDash : MonoBehaviour
{
		public UILabel messageboard;
		// Use this for initialization
		void Start ()
		{
				StartCoroutine (steup ());
			
		}
	
		// Update is called once per frame
		void Update ()
		{
	
		}

		private IEnumerator steup ()
		{
				yield return new WaitForEndOfFrame ();
//				GameObject scorekeep = GameObject.Find ("scorekeeper");
//				PlayersScores pl = scorekeep.GetComponent<PlayersScores> () as PlayersScores;
				PlayersScores.Instance.scoreboard = messageboard;
				PlayersScores.Instance.theScoreList ();
				LoadGameData.gamedata.LoadData ();
		}

		public void LoadGame ()
		{
				Application.LoadLevelAsync (1);
		}
}

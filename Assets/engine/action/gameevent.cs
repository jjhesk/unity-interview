using UnityEngine;
using System.Collections;

public class gameevent : eventbase
{
		private int playerScore = 0;
		private int bonus_score = 0;
		public int endTimeSecond = 60;
		private int runningSec = 0;
		public static gameevent Instance;
		[SerializeField]
		private UILabel
				mlabel, score, gameoverMessage;
		[SerializeField]
		private GameObject
				joystick;

		public UILabel ScoreDisplay {
				set {
						this.score = value;
				}
		}
		// Use this for initialization
		void Start ()
		{
				Instance = this;
				game_start_ui ();
		}
		#region
		public void timer_start ()
		{
				//StartCoroutine (timecal ());
				
				CancelInvoke ("timecal");
				InvokeRepeating ("timecal", 2f, 1f);
				runningSec = 0;
				hide_start_button ();
				ui_score_update ();
				ui_update ();
				joystick.SetActive (true);
				//if (LoadGameData.gamedata != null)
				//		LoadGameData.gamedata.export (generategameobject.Instance.colorReference);
		}

		public void addScore (int z)
		{
				playerScore += z;
				ui_score_update ();
		}
	
		public void addBonus (int totalAdd)
		{
				if (bonus_score == 0) {
						bonus_score = endTimeSecond - runningSec;
						Debug.Log ("bonus score was added " + bonus_score);
				}
		}
		#endregion
		private void timecal ()
		{
				runningSec ++;
				check_time ();
				ui_update ();
				//yield return new WaitForSeconds (1f);
		}

		protected override void game_start_ui ()
		{
				base.game_start_ui ();
				joystick.SetActive (false);
		}

		protected override void check_time ()
		{
				if (runningSec == endTimeSecond) {
						game_time_over ();
						if (joystick != null) {
								joystick.SetActive (false);
						}
						string tmp = "Congratulations you gained {0} scores";
						if (bonus_score > 0) {
								tmp += "\n and Bonus point {1}";
								gameoverMessage.text = string.Format (tmp, playerScore, bonus_score);
						} else {
								gameoverMessage.text = string.Format (tmp, playerScore);
						}
						PlayersScores.Instance.PostScore (playerScore + bonus_score);
						GameObject h = GameObject.FindWithTag ("Player") as GameObject;
						h.GetComponent<rollballcontroller> ().resetposition ();
						CancelInvoke ("timecal");
				}
		}

		public void goBack ()
		{
				Application.LoadLevel (0);
		}
		//code block

		private void ui_update ()
		{
				if (mlabel != null) {
						int L = endTimeSecond - runningSec;
						mlabel.text = L + "s";
				}
		}

		private void ui_score_update ()
		{
				if (score != null) {
						score.text = playerScore + "";
				}
		}

}

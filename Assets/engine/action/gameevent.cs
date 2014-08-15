using UnityEngine;
using System.Collections;

public class gameevent : eventbase
{
		private int playerScore = 0;
		public int endTimeSecond = 60;
		private int runningSec = 0;
		public static gameevent Instance;
		[SerializeField]
		private UILabel
				mlabel, score;

		public UILabel TimeDisplayField {
				set {
						this.mlabel = value;
				}
		}

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

		public void timer_start ()
		{
				//StartCoroutine (timecal ());
				CancelInvoke ("timecal");
				InvokeRepeating ("timecal", 2f, 1f);
				runningSec = 0;
				hide_start_button ();
				ui_score_update ();
				ui_update ();
				
		}

		private void timecal ()
		{
				runningSec ++;
				check_time ();
				ui_update ();
				//yield return new WaitForSeconds (1f);
		}

		public void addScore (int z)
		{
				playerScore += z;

		}

		protected override void check_time ()
		{
				if (runningSec == endTimeSecond) {
						game_time_over ();
				}
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

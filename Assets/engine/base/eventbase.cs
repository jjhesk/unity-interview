using UnityEngine;
using System.Collections;

public class eventbase : MonoBehaviour
{

		[SerializeField]
		protected UIPanel
				gamePlay, gameOver;
	
		public UIPanel setGamePlayPanel {
				set {
						this.gamePlay = value;
				}
		}
	
		public UIPanel setGameOverPanel {
				set {
						this.gameOver = value;
				}
		}

		[SerializeField]
		protected GameObject
				button_start_game;

		protected virtual void check_time ()
		{

		}

		protected virtual void game_start_ui ()
		{
				if (gameOver != null) {
						gameOver.enabled = false;
				}
				if (gamePlay != null) {
						gamePlay.enabled = true;
				}
			
		}

		protected virtual void hide_start_button ()
		{
				if (button_start_game != null) {
						button_start_game.SetActive (false);
				}
		}

		protected virtual void game_time_over ()
		{
				if (gameOver != null) {
						gameOver.enabled = true;
				}
				if (gamePlay != null) {
						gamePlay.enabled = false;
				}
		}

}

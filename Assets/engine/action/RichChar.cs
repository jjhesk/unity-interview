using UnityEngine;
using System.Collections.Generic;
using System.Collections;

[System.Serializable]
public class RichChar:PlayerPys
{
		public void move (int steps_to_move, direction direction)
		{
				//old code
				//scanner = gameEngine.Instance.getScanner();


//
//		if (player_status == status.PENDING)
//		{
//			coming_steps = steps_to_move;
//			player_status = status.MOVING;
//			start_move();
//		}
				if (player_status == status.PENDING) {
						RichmanAnimator rplayer = character_stage.GetComponent<RichmanAnimator> () as RichmanAnimator;
						rplayer.move (steps_to_move);
						player_status = status.MOVING;
				}
		}

		public void move (direction direction)
		{
				//scanner = gameEngine.Instance.getScanner ();
				//start_move ();
				RichmanAnimator rplayer = character_stage.GetComponent<RichmanAnimator> () as RichmanAnimator;
				coming_steps = Random.Range (1, 6);
				rplayer.move (coming_steps);
				player_status = status.MOVING;
		}
}

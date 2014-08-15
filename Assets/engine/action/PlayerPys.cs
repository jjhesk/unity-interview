using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Net;

public class PlayerPys : PlayerData
{
		private float dist = 100f;
		protected void start_move ()
		{
				try {
						if (coming_steps > 0) {
								if (currentstep > 0) {
										int previous_step = currentstep - 1;
										if (scanner.isCurrentStepTheLastIndex (previous_step)) {
												currentstep = 0;
												Debug.Log ("start from origin:");
										}
								}
								landing_property = scanner.getPropertyByIndex (currentstep);
								Debug.Log ("next step ID:" + landing_property.id);
								if (landing_property == null)
										throw new UnityException ("property object not found");
								//	LTDescr e = 
								//	Debug.Log (landing_property.ToString ());
								//	Debug.Log (landing_property.id);
								//	Debug.Log (landing_property.l);
								Vector3 to = landing_property.getStepLocation ();
								Debug.Log ("track to position:" + to.ToString ());
								character_stage.transform.LookAt (new Vector3 (to.x, character_stage.transform.position.y, to.z));
								LeanTween.move (character_stage, to, gameEngine.Instance.movementSpeed).setOnComplete (move_end).setOnUpdate (movepos);
								simple_ship_drive drive = character_stage.GetComponent<simple_ship_drive> ();
								if (drive != null) {
										drive.WaterAnimation (true);
								}
						} else {
								move_end ();
						}
				} catch (MissingReferenceException e1) {
						Debug.Log ("error - missing something... " + e1.ToString ());
				} catch (UnityException e) {
						Debug.Log ("error is found" + e.ToString ());
				}
		}
 
		private void movepos (Vector3 v)
		{
				RaycastHit hit;
				Vector3 dir = -Vector3.up;
				Vector3 from = new Vector3 (v.x, 100f, v.z);
				Debug.DrawRay (from, dir * dist, Color.green);
				Vector3 h = new Vector3 ();
				if (Physics.Raycast (from, dir, out hit, dist, ground_only_mask)) {
						h = hit.collider.gameObject.transform.position;
				}
				position = new Vector3 (v.x, h.y, v.z);
				character_stage.transform.position = new Vector3 (v.x, h.y, v.z);
				//moveWave ();
		}

		private void moveWave ()
		{
				if (movingWithWave) {
						wave_index += Time.deltaTime;
						//		float y = Mathf.Abs (amplitudeY * Mathf.Sin (omegaY * wave_index));
						float y = Mathf.Abs (amplitudeY) * Mathf.Sin (omegaY * wave_index);
						Vector3 p = position;
						character_stage.transform.localPosition = new Vector3 (p.x, p.y + y, p.z);
				}
		}

		public void runStatusPosition ()
		{
				if (player_status == status.PENDING) {
						moveWave ();
				}
		}

		private void move_end ()
		{
				nowStep = new StepStat ();
				nowStep.withLocation (landing_property);
				nowStep.withPlayer (gameEngine.Instance.CurrentPlayer ());
				if (coming_steps > 0) {
						if (nowStep.station_event_trigger) {
								station_event ();
						} else {
								trigger_next_move ();
						}
				} else {
						if (_brain == Brain.HUMAN) {
								endEventHuman ();
						} else if (_brain == Brain.AI) {
								endEventAi ();
						}

						simple_ship_drive drive = character_stage.GetComponent<simple_ship_drive> ();
						if (drive != null) {
								drive.WaterAnimation (false);
						}
				}

				
		}
		//the moving is not done but the person is passing this location and make a call
		private void station_event ()
		{
				trigger_next_move ();
		}

		private void endEventAi ()
		{
				//gameEngine.Instance.next_turn ();
				
				if (nowStep.is_others_land_only ()) {
						gameEngine.Instance.next_turn ();
				} else if (nowStep.qualified_to_rent ()) {
						nowStep.cost = landing_property.getRental ();
						gameEngine.Instance.collection_money_for_landlord (nowStep.cost, gameEngine.Instance.next_turn);
				} else if (nowStep.can_invest ()) {
						nowStep.cost = landing_property.getInvestmentCost ();
						gameEngine.Instance.trade_success (nowStep.cost, gameEngine.Instance.next_turn);
				} else if (nowStep.from_unclaim_to_buy_action ()) {
						nowStep.cost = landing_property.getInvestmentCost ();
						gameEngine.Instance.trade_success (nowStep.cost, gameEngine.Instance.next_turn);
				} else if (nowStep.dialog_for_bank) {
						Debug.Log ("dialog_for_bank AI");
						gameEngine.Instance.ai_bank ();
						gameEngine.Instance.next_turn ();
				} else if (nowStep.functional_property ()) {
						Debug.Log ("functional_property AI");
						gameEngine.Instance.next_turn ();
				} else {
						gameEngine.Instance.next_turn ();
				}
		}
		//this is the final location of the event
		private void endEventHuman ()
		{
				panel_helper_dialog ui = gameEngine.Instance.getUIdialog ();
				RichChar aboutHim = gameEngine.Instance.CurrentPlayer ();
				if (nowStep.dialog_for_bank) {
						Debug.Log ("talk to the bank");
						ui.setBankServiceFlow (new BankDialogDescriptor (aboutHim), gameEngine.Instance.next_turn);
				} else if (nowStep.dialog_related_to_land) {
						if (nowStep.is_others_land_only ()) {
								gameEngine.Instance.next_turn ();
						} else if (nowStep.qualified_to_rent ()) {
								nowStep.cost = landing_property.getRental ();
								DialogDescriptor descriptor = new DialogDescriptor (DialogDescriptor.lvType.PAYRENT, nowStep.cost);
								ui.setMoneyLogicFlow (descriptor, aboutHim, gameEngine.Instance.next_turn);
								startCamProp ();
						} else if (nowStep.can_invest ()) {
								nowStep.cost = landing_property.getInvestmentCost ();
								//Debug.Log ("ask:" + formated);
								DialogDescriptor descriptor = new DialogDescriptor (DialogDescriptor.lvType.UPGRADE, nowStep.cost);
								ui.setMoneyLogicFlow (descriptor, aboutHim, gameEngine.Instance.next_turn);
								startCamProp ();
						} else if (nowStep.from_unclaim_to_buy_action ()) {
								nowStep.cost = landing_property.getInvestmentCost ();
								//Debug.Log ("ask:" + formated);
								DialogDescriptor descriptor = new DialogDescriptor (DialogDescriptor.lvType.BUYLAND, nowStep.cost);
								ui.setMoneyLogicFlow (descriptor, aboutHim, gameEngine.Instance.next_turn);
								startCamProp ();
						} else {
								Debug.Log ("nothing is happening.. this maybe a bug.. please check nowStep action flow with the considering logic. ");
								gameEngine.Instance.next_turn ();
						}
				} else {
						Debug.Log ("there is nothing to for the human RichChar.. next turn");
						gameEngine.Instance.next_turn ();
				}
				gameEngine.Instance.getPlayPanel ().closeWaiting ();
		}
	
		//pay the rent
//		private void collection_money_for_landlord ()
//		{
//				RichChar aboutHim = gameEngine.Instance.CurrentPlayer ();
//				if (aboutHim.moneyinhand < nowStep.cost)
//						aboutHim.bankmoney -= nowStep.cost;
//				else
//						aboutHim.moneyinhand -= nowStep.cost;
//				gameEngine.Instance.getSD ().playFXMoney ();
//				RichChar landlord = gameEngine.Instance.accessPlayer (landing_property.owned_by_id);
//				landlord.moneyinhand += nowStep.cost;
//		}
		//buy the land
//		public void trade_success (System.Action cbafterbuild)
//		{
//				RichChar PLA = gameEngine.Instance.CurrentPlayer ();
//				landing_property.owned_by_id = PLA.owner_id;
//				PLA.moneyinhand -= nowStep.cost;
//				if (nowStep.from_unclaim_to_buy_action ()) {
//						Debug.Log ("trade action - change land owner");
//						gameEngine.Instance.getSD ().playFXbuyland ();
//						landing_property.applyUserStyle (PLA);
//						cbafterbuild ();
//				} else {
//						Debug.Log ("trade action - making new building");
//						gameEngine.Instance.getSD ().playFXBuilding ();
//						gameEngine.Instance.getScanner ().RezBuilding (landing_property, landing_property.shiftNextLevel (), Random.Range (2.1f, 4.2f), cbafterbuild);
//				}
//				//gameEngine.Instance.next_turn ();
//		}

//		public void trade_success ()
//		{
//				RichChar aboutHim = gameEngine.Instance.CurrentPlayer ();
//				landing_property.owned_by_id = aboutHim.owner_id;
//				aboutHim.moneyinhand -= nowStep.cost;
//				if (nowStep.from_unclaim_to_buy_action ()) {
//						gameEngine.Instance.getSD ().playFXbuyland ();
//						landing_property.applyUserStyle (aboutHim);
//						gameEngine.Instance.next_turn ();
//				} else {
//						gameEngine.Instance.getSD ().playFXBuilding ();
//						gameEngine.Instance.getScanner ().RezBuilding (landing_property, landing_property.shiftNextLevel (), Random.Range (2.1f, 4.2f), gameEngine.Instance.next_turn);
//				}
//				//gameEngine.Instance.next_turn ();
//		}

		private void trigger_next_move ()
		{
				
				coming_steps--;
				currentstep++;
				start_move ();
		}
		//there will be a bug

		private void startCamProp ()
		{
				FollowTrackingCamera cam = gameEngine.Instance.getCam ();
				cam.target = landing_property.getHolderPropertyTargetTransform ();
				cam.autoRotate (true);
		}
}
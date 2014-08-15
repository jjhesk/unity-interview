using UnityEngine;
using System.Collections;

[RequireComponent (typeof(gameEngine))]
public class GameEvents : MonoBehaviour
{
		public static GameEvents Instance;
		// Use this for initialization
		void Start ()
		{
				Instance = this;
		}
	
		public void forHuman (StepStat nowStep)
		{
				panel_helper_dialog UI = gameEngine.Instance.getUIdialog ();
				RichChar person = gameEngine.Instance.CurrentPlayer ();
				Property location = nowStep.property;
				if (nowStep.dialog_for_bank) {
						Debug.Log ("talk to the bank");
						UI.setBankServiceFlow (new BankDialogDescriptor (person), gameEngine.Instance.next_turn);
				} else if (nowStep.dialog_related_to_land) {


						if (nowStep.is_others_land_only ()) {
								gameEngine.Instance.next_turn ();


						} else if (nowStep.qualified_to_rent ()) {
								nowStep.cost = location.getRental ();
								DialogDescriptor descriptor = new DialogDescriptor (DialogDescriptor.lvType.PAYRENT, nowStep.cost);
								UI.setMoneyLogicFlow (descriptor, person, gameEngine.Instance.next_turn);
								
						} else if (nowStep.can_invest ()) {
								nowStep.cost = location.getInvestmentCost ();
								//Debug.Log ("ask:" + formated);
								DialogDescriptor descriptor = new DialogDescriptor (DialogDescriptor.lvType.UPGRADE, nowStep.cost);
								UI.setMoneyLogicFlow (descriptor, person, gameEngine.Instance.next_turn);
							
						} else if (nowStep.from_unclaim_to_buy_action ()) {
								nowStep.cost = location.getInvestmentCost ();
								//Debug.Log ("ask:" + formated);
								DialogDescriptor descriptor = new DialogDescriptor (DialogDescriptor.lvType.BUYLAND, nowStep.cost);
								UI.setMoneyLogicFlow (descriptor, person, gameEngine.Instance.next_turn);
								
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

		public void forAI (StepStat nowStep)
		{
				//gameEngine.Instance.next_turn ();
				Property location = nowStep.property;
				if (nowStep.is_others_land_only ()) {
						gameEngine.Instance.next_turn ();
				} else if (nowStep.qualified_to_rent ()) {
						nowStep.cost = location.getRental ();
						gameEngine.Instance.collection_money_for_landlord (nowStep.cost, gameEngine.Instance.next_turn);
				} else if (nowStep.can_invest ()) {
						nowStep.cost = location.getInvestmentCost ();
						gameEngine.Instance.trade_success (nowStep.cost, gameEngine.Instance.next_turn);
				} else if (nowStep.from_unclaim_to_buy_action ()) {
						nowStep.cost = location.getInvestmentCost ();
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
}

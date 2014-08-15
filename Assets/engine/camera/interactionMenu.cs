using UnityEngine;
using System.Collections;

public class interactionMenu : TouchLogic3D
{

		//public static interactionMenu Instance; 
		//private IList<GameObject> PlayersGame = new IList<GameObject>();
		// Use this for initialization
		public Transform UICamera;
		private cammovetouch panel_move;
		private int viewlayer = 0;

		void Start ()
		{
				//Instance = this;
				GameObject[] PlayersGame = GameObject.FindGameObjectsWithTag ("Player");
				foreach (GameObject c in  PlayersGame) {
						BoxCollider v = c.GetComponent<BoxCollider> ();
						if (v == null) {
								c.AddComponent<BoxCollider> ();
								c.AddComponent<TouchableOB> ();
						}
				}

				panel_move = transform.GetComponent<cammovetouch> () as cammovetouch;
		}
		
		public void OnShip (int hash)
		{
				Debug.Log (hash);
		}

		public void OnBack ()
		{
				//	foreach (Transform t in UICamera) {
				//		TweenPosition[] tweens  = t.GetComponentInChildren<TweenPosition>();
				//	}
				tweenUI (false);
				panel_move.BrowseMode ();
				viewlayer = 0;
		}

		public void OnRotate ()
		{
				panel_move.ViewAngle (90f);
		}
		//view from the top to the ground
		private void tweenUI (bool b)
		{
				TweenPosition[] tweens = UICamera.GetComponentsInChildren<TweenPosition> () as TweenPosition[];
				foreach (TweenPosition t in tweens) {
						t.enabled = true;
						if (!b) {
								t.PlayForward ();
						} else {
								t.PlayReverse ();
						}
				}

		}

		public void OnDisplayEditInfo ()
		{
		
		}

		protected override void onSelected (GameObject f, TouchPhase phase)
		{
				if (viewlayer == 0) {
						if (phase == TouchPhase.Ended) {
								cammovetouch touch = GetComponent<cammovetouch> ();
								touch.PanTo (f);
								tweenUI (true);
								viewlayer = 1;
						}
						
				}
		}

}

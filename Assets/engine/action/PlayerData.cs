using UnityEngine;
using System.Collections.Generic;
using System.Collections;

[System.Serializable]
public class PlayerData
{
		// Use this for initialization
		public	string playername ;
		public int owner_id, bankmoney, moneyinhand, power_kill, stand_at_prop_id = 0, currentstep;
		protected int coming_steps;
		public	GameObject	prefab;
		public status player_status = status.PENDING;
		public Color32 favoritColor;
		public float moveTiltUpDegree = 10f;
		public float amplitudeY = 0.5f;
		public float omegaY = 0.50f;
		public bool movingWithWave = true;
		public	GameObject character_stage;
		[SerializeField]
		protected	List<Property>
				asset_cards = new List<Property> ();
		[SerializeField]
		protected	List<MagicCard>
				asental = new List<MagicCard> ();
		protected PathScanner scanner ;
		protected float wave_index;
		public Vector3 position;
		//these are the internal move configurations
		//protected gameEngine interface_engine;
		protected Property landing_property;
		protected LayerMask ground_only_mask;
		[SerializeField]
		protected Brain
				_brain;

		public void addPropertyAsset (Property p)
		{
				asset_cards.Add (p);
		}

		public void addItem (MagicCard p)
		{
				asental.Add (p);
		}

		public Brain controlBy {
				get {
						return _brain;
				}
				set {
						this._brain = value;
				}
		}

		public Property landing {
				get {
						return landing_property;
				}
				set {
						this.landing_property = value;
				}
		}

		protected StepStat nowStep;

		public StepStat stepdata {
				get {
						return nowStep;
				}
				set {
						this.nowStep = value;
				}
		}

		public PlayerData setGroundMask (LayerMask lm)
		{
				ground_only_mask = lm;
				return this;
		}

		public PlayerData setPlayerStatus (RichChar.status e)
		{
				this.player_status = e;
				return this;
		}

		public  enum  status
		{
				PENDING,
				MOVING
		}
	
		public  enum  direction
		{
				FORWARD,
				BACKWARD,
				FORWARD1,
				BACKWARD1,
				FORWARD2,
				BACKWARD2,
				FORWARD3,
				BACKWARD3
		}

		public enum camera_angle
		{
				TOP,
				CLOSE,
				WALKING,
				OVERVIEW,
				ANGLE45
		}

		public enum Brain
		{
				HUMAN,
				AI
		}

}
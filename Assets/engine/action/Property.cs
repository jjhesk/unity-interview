using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;

[System.Serializable]
public class Property
{		
		private Vector3 propertRezTargetPos, footStepPos;
		private float transition_time;
		private System.Action continue_action_after_rez_new_building;
		public string name = "";
		public int owned_by_id = -1, level = 0, id = -1;
		protected GameObject locate_object, buildingProperty, land;
		protected Transform transform;
		public passing_event event_pass;
		public locType blocktype = locType.LAND;
		public float fix_price_inflation_factor; // 1.0 - 2.0
		public float revenue_factor;   // 0.9 - 1.5
		private Material loadMat (string name)
		{
				return Resources.Load ("mat/" + name, typeof(Material)) as Material;
		}

		public Property setHolderSpline (bool debug, GameObject parent, GameObject prefebLand, Vector3 groundPos)
		{
				land = GameObject.Instantiate (prefebLand) as GameObject;
				float Y = UnityEngine.Random.Range (0f, 340f);
				//land.transform.position 
				//footStepPos = groundPos + Quaternion.Euler (0, Y, 0) * Vector3.forward * 1.5f;
				land.transform.position = groundPos;
				land.transform.parent = parent.transform;
				land.name = "property_child_land";
				propertRezTargetPos = land.transform.position;
				locate_object = parent;
				transform = parent.transform;
				return this;
		}

		public Property setHolder (bool debug, GameObject parent, Vector3 groundPos, GameObject prefebLand)
		{
				if (!debug) {
						parent.renderer.enabled = false;
				}
				//footStepPos = groundPos;
				//holder.transform.position;
				land = GameObject.Instantiate (prefebLand) as GameObject;
				float Y = UnityEngine.Random.Range (0f, 340f);
				//land.transform.position 
				footStepPos = groundPos + Quaternion.Euler (0, Y, 0) * Vector3.forward * 1.5f;
				land.transform.position = groundPos;
				land.transform.parent = parent.transform;
				land.name = "property_child_land";
				propertRezTargetPos = land.transform.position;
				locate_object = parent;
				transform = parent.transform;
				//Material newMat = Resources.Load("DEV_Orange", typeof(Material)) as Material;
				//land.renderer.material = new Material (Shader.Find ("sphere"));
				//string path = "Assets/Resources/sphere.mat";
				//Material mat = Resources.LoadAssetAtPath (path, typeof(Material)) as Material;
				//land.renderer.material = mat;
				//land.renderer.material = loadMat ("sphere");
				return this;
		}

		public Property setSpecialBuilding (Station building_settings, Vector3 offset_building)
		{
				GameObject c = GameObject.Instantiate (building_settings.prefab) as GameObject;
				c.transform.position = propertRezTargetPos + offset_building;
				c.transform.rotation = Quaternion.identity;
				c.transform.parent = locate_object.transform;
				c.name = building_settings.name;
				return this;
		}

		public Property applyUserStyle (RichChar user)
		{
				if (land.renderer == null) {
						Renderer r = land.GetComponentInChildren<Renderer> ();
						r.material.color = user.favoritColor;
				} else {
						land.renderer.material.color = user.favoritColor;
				}
				return this;
		}

		public Transform getHolderPropertyTargetTransform ()
		{
				return land.transform;
		}

		public Vector3 getHolderPropertyTargetPosition ()
		{
				return land.transform.position;
		}

		public GameObject getHolder ()
		{
				return this.locate_object;
		}

		public Vector3 getStepLocation ()
		{
				Vector3 ground_y = Vector3.one;
				if (GameObject.Find ("ground") != null) {
						ground_y = GameObject.Find ("ground").transform.position;
				}
				float y = ground_y.y + 0.05f;
				Vector3 f = new Vector3 (footStepPos.x, y, footStepPos.z);
				return f;
		}

		public Property updateNewProperty (GameObject newPreFebObject, float time_to_rez, Action continue_action)
		{
				transition_time = time_to_rez;
				continue_action_after_rez_new_building = continue_action;
				newPreFebObject.SetActive (false);
				if (this.buildingProperty != null) {
						Vector3 targetpos = this.buildingProperty.transform.position - Vector3.up * 5.0f;
						LeanTween.move (buildingProperty, targetpos, time_to_rez).setDestroyOnComplete (true).setOnComplete (buildRise, newPreFebObject);
				} else {
						buildRise (newPreFebObject);
				}
				return this;
		}

		private void buildRise (object v)
		{
				GameObject.Destroy (this.buildingProperty);
				GameObject new_build = v as GameObject;
				new_build.SetActive (true);
				Vector3 new_build_targetpos = new_build.transform.position + Vector3.up * 3.50f;
				Debug.Log ("at position: " + new_build_targetpos.ToString ());
				this.buildingProperty = new_build;
				LeanTween.move (buildingProperty, new_build_targetpos, transition_time)
				.setOnComplete (this.continue_action_after_rez_new_building);
		}
	
		public enum locType
		{
				LAND , // TRADABLE NOT DEVELOPED
				BUILDING ,// TRADABLE - VALUE IS UNDECIDED 0
				HOUSE , // VALUE ON THE TABLE 1
				MOTEL , // VALUE ON THE TABLE 2
				HOTEL , // VALUE ON THE TABLE 3
				HOTELCASINO , // VALUE ON THE TABLE 4
				GRANDHOTELRESORT , //  VALUE ON THE TABLE 5

				BANK, //CANT OWN - STATION
				CASINO,//CANT OWN
				HOSPITAL,//CANT OWN
				BATLLEFIELD,//CANT OWN
				BAR,//CANT OWN
				IFC,//CANT OWN
				SHOP,//CANT OWN
				STARTPOINT, // CANT OWNED - STATION,
				EMPTY //NOTHING HAPPEN AND IT WILL PASS TO THE NEXT STEP
		}
		public int getRental ()
		{
				return Mathf.FloorToInt (Property.rent_scedule [Property.posInt (blocktype)] * fix_price_inflation_factor);
		}

		public int getInvestmentCost ()
		{
				return Mathf.FloorToInt (Property.price_list [Property.posInt (blocktype)] * fix_price_inflation_factor);
		}

		public static readonly int[] price_list = new int[] {
				100,
				150,
				200,
				400,
				800,
				1600,
				3200,
				6400
		};
		public static readonly int[] rent_scedule = new int[] {
				0,
				50,
				100,
				200,
				400,
				800,
				1500,
				2500
		};
		public static readonly string[] iconstring = new string[]{
			"Landlogo", "Home","Traditional-Home","smallcompany","bigcompany","companies"
		};
		public  enum  passing_event
		{
				BLOCKED,
				WITHCARD,
				CHANGDIRECTION,
				NOTHING,
				//THE RichChar WILL STOP FOR THE EVENT ALL TIME
				STATION 
		}
		public locType shiftNextLevel ()
		{

				switch (blocktype) {
				case locType.LAND:
						return locType.BUILDING;
				case locType.BUILDING:
						return locType.HOUSE;
				case locType.HOUSE:
						return locType.MOTEL;
				case locType.MOTEL:
						return locType.HOTEL;
				case locType.HOTEL:
						return locType.HOTELCASINO;
				case locType.HOTELCASINO:
						return locType.GRANDHOTELRESORT;
				default:
						return locType.LAND;
				}
					
		}

		public static int posInt (Property.locType h)
		{
				int L = 0;
				switch (h) {
				case Property.locType.GRANDHOTELRESORT:
						L = 6;
						break;
				case Property.locType.BUILDING:
						L = 1;
						break;
				case Property.locType.LAND:
						L = 0;
						break;
				case Property.locType.HOUSE:
						L = 2;
						break;
				case Property.locType.MOTEL:
						L = 3;
						break;
				case Property.locType.HOTEL:
						L = 4;
						break;
				case Property.locType.HOTELCASINO:
						L = 5;
						break;
				}
				return L;
		}

		public string getIconName ()
		{
				int n = posInt (blocktype);
				return n > iconstring.Length ? "unknown" : iconstring [n];
		}
}

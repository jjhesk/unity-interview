using UnityEngine;
using System.Collections;

public class mainengine : MonoBehaviour
{
		public static mainengine Instance;
		// Use this for initialization
		void Start ()
		{
				Instance = this;
			
		}

		public void OnStartPressed ()
		{
				generategameobject.Instance.generate_cube ();
				gameevent.Instance.timer_start ();
		}
		
		
}

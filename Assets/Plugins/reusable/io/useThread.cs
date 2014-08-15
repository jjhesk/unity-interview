using UnityEngine;
using System.Collections;

public class useThread : MonoBehaviour
{
		threadexample myJob;
		// Use this for initialization
		void Start ()
		{
				myJob = new threadexample ();
				myJob.InData = new Vector3[10];

		
				myJob.Start (); // Don't touch any data in the job class after you called Start until IsDone is true.

		}
	
		void Update ()
		{
				if (myJob != null) {
						if (myJob.Update ()) {
								// Alternative to the OnFinished callback
								myJob = null;
						}
				}
		}
}



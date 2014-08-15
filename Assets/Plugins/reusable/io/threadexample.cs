using UnityEngine;
using System.Collections;

public class threadexample  : ThreadedJob
{
		public Vector3[] InData; // arbitary job data
		public Vector3[] OutData; // arbitary job data
	
		protected override void ThreadFunction ()
		{
				// Do your threaded task. DON'T use the Unity API here
				for (int i = 0; i < 100000000; i++) {
						InData [i % InData.Length] += InData [(i + 1) % InData.Length];
				}
		}

		protected override void OnFinished ()
		{
				// This is executed by the Unity main thread when the job is finished
				for (int i = 0; i < InData.Length; i++) {
						Debug.Log ("Results(" + i + "): " + InData [i]);
				}
		}
}
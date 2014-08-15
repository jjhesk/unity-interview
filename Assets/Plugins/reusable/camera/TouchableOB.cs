using UnityEngine;
using System.Collections;

public class TouchableOB : MonoBehaviour, ITouchable3DBase
{

		void Start ()
		{
		}

		public void doitnow ()
		{


		}

		void Update ()
		{
		}
	#region ITouchable3D implementation

		void ITouchable3DBase.OnTouchBegan ()
		{
				throw new System.NotImplementedException ();
		}

		void ITouchable3DBase.OnTouchEnded ()
		{
				throw new System.NotImplementedException ();
		}

		void ITouchable3DBase.OnTouchMoved ()
		{
				throw new System.NotImplementedException ();
		}

		void ITouchable3DBase.OnTouchStayed ()
		{
				throw new System.NotImplementedException ();
		}

		void ITouchable3DBase.OnTouchEndedAnywhere ()
		{
				throw new System.NotImplementedException ();
		}

		void ITouchable3DBase.OnTouchMovedAnywhere ()
		{
				throw new System.NotImplementedException ();
		}

		void ITouchable3DBase.OnTouchStayedAnywhere ()
		{
				throw new System.NotImplementedException ();
		}

	#endregion


//		public void OnTouchBegan ()
//		{
//				Debug.Log ("1");
//		}
//	
//		public 	void OnTouchEnded ()
//		{
//				Debug.Log ("2");
//		}
//	
//		public 	void OnTouchMoved ()
//		{
//				Debug.Log ("3");
//		}
//	
//		public 	void OnTouchStayed ()
//		{
//				Debug.Log ("4");
//		}
//		// void OnTouchBeganAnywhere();
//		public 	void OnTouchEndedAnywhere ()
//		{
//				Debug.Log ("5");
//				interactionMenu.Instance.OnShip (GetHashCode ());
//		}
//	
//		public 	void OnTouchMovedAnywhere ()
//		{
//				Debug.Log ("6");
//		}
//	
//		public 	void OnTouchStayedAnywhere ()
//		{
//				Debug.Log ("7");
//		}
}

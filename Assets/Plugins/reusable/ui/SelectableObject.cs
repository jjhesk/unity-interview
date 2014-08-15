using UnityEngine;
using System.Collections;

public class SelectableObject : MonoBehaviour
{
		public Rect m_SelectionWindowRect = new Rect (10.0f, 10.0f, 300.0f, 100.0f);
	
		public void OnMouseDown ()
		{
				SelectionManager.Select (gameObject, !SelectionManager.IsSelected (gameObject));
		}
	
		public void OnDisable ()
		{
				SelectionManager.Deselect (gameObject);
		}
	
		public void Update ()
		{
				renderer.material.color = SelectionManager.IsSelected (gameObject) ? Color.green : Color.white;
		}
	
		public void OnGUI ()
		{
				if (SelectionManager.IsSelected (gameObject)) {
						m_SelectionWindowRect = GUI.Window (GetInstanceID (), m_SelectionWindowRect, SelectionWindow, gameObject.name);
				}
		}
	
		void SelectionWindow (int id)
		{
				GUILayout.Box ("I am the selection and my name is " + gameObject.name);
				GUI.DragWindow ();
		}
}

public class SelectionManager
{
		private static GameObject s_ActiveSelection;
	
		public static GameObject ActiveSelection {
				get {
						return s_ActiveSelection;
				}
				set {
						s_ActiveSelection = value;
				}
		}
	
		public static void Select (GameObject gameObject, bool selectionValue)
		{
				if (selectionValue) {
						Select (gameObject);
				} else {
						Deselect (gameObject);
				}
		}
	
		public static void Select (GameObject gameObject)
		{
				ActiveSelection = gameObject;
		}
	
		public static void Deselect (GameObject gameObject)
		{
				if (ActiveSelection == gameObject) {
						ActiveSelection = null;
				}
		}
	
		public static bool IsSelected (GameObject gameObject)
		{
				return ActiveSelection == gameObject;
		}
}

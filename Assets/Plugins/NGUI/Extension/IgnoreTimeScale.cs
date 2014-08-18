//----------------------------------------------
//            NGUI: Next-Gen UI kit
// Copyright © 2011-2012 Tasharen Entertainment
//----------------------------------------------

using UnityEngine;

/// <summary>
/// Implements common functionality for monobehaviours that wish to have a timeScale-independent deltaTime.
/// </summary>

[AddComponentMenu("NGUI/Internal/Ignore TimeScale Behaviour")]
public class IgnoreTimeScale : MonoBehaviour
{
	float mTime = 0f;
	float mActual = 0f;
	float mDelta = 0f;
	
	/// <summary>
	/// Equivalent of Time.deltaTime not affected by timeScale, provided that UpdateRealTimeDelta() was called in the Update().
	/// </summary>
	
	public float realTimeDelta { get { return mDelta; } }
	
	/// <summary>
	/// Record the current time.
	/// </summary>
	
	void OnEnable () { mTime = Time.realtimeSinceStartup; }
	
	/// <summary>
	/// Record the time on start.
	/// </summary>
	
	void Start () { mTime = Time.realtimeSinceStartup; }
	
	/// <summary>
	/// Update the 'realTimeDelta' parameter. Should be called once per frame.
	/// </summary>
	
	protected float UpdateRealTimeDelta ()
	{
		float time = Time.realtimeSinceStartup;
		float delta = time - mTime;
		mActual += Mathf.Max(0f, delta);
		mDelta = 0.001f * Mathf.Round(mActual * 1000f);
		mActual -= mDelta;
		mTime = time;
		return mDelta;
	}
}
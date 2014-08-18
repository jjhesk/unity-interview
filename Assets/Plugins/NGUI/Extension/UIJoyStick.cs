//----------------------------------------------
//            NGUI: Next-Gen UI kit
// Copyright © 2011-2013 Tasharen Entertainment
//----------------------------------------------

using UnityEngine;
using System.Collections;

/// <summary>
/// Allows dragging of the specified target object by mouse or touch, optionally limiting it to be within the UIPanel's clipped rectangle.
/// </summary>

[AddComponentMenu("NGUI/Interaction/JoyStick")]
public class UIJoyStick : IgnoreTimeScale
{
	public enum DragEffect
	{
		None,
		Momentum,
		MomentumAndSpring,
	}
	
	public float joyStickPosX; 
	public float joyStickPosY; 
	private float posDivision;
	
	/// <summary>
	/// Target object that will be dragged.
	/// </summary>
	
	public Transform target;
	
	/// <summary>
	/// Scale value applied to the drag delta. Set X or Y to 0 to disallow dragging in that direction.
	/// </summary>
	
	private Vector3 scale = Vector3.one;
	
	/// <summary>
	/// Effect the scroll wheel will have on the momentum.
	/// </summary>
	
	public float scrollWheelFactor = 0f;
	
	/// <summary>
	/// Whether the dragging will be restricted to be within the parent panel's bounds.
	/// </summary>
	
	public bool restrictWithinPanel = false;
	
	/// <summary>
	/// 限制按鈕移動半徑範圍
	/// The clamp radius.
	/// </summary>
	public float ClampRadius = 100.0f;
	
	/// <summary>
	/// How much momentum gets applied when the press is released after dragging.
	/// </summary>
	
	Plane mPlane;
	Vector3 mLastPos;
	UIPanel mPanel;
	bool mPressed = false;
	Vector3 mMomentum = Vector3.zero;
	float mScroll = 0f;
	Bounds mBounds;
	
	void Awake ()
	{
		posDivision = 1 / ClampRadius;
	}
	
	/// <summary>
	/// Find the panel responsible for this object.
	/// </summary>
	
	void FindPanel ()
	{
		mPanel = (target != null) ? UIPanel.Find(target.transform, false) : null;
		if (mPanel == null) restrictWithinPanel = false;
	}
	
	/// <summary>
	/// Create a plane on which we will be performing the dragging.
	/// </summary>
	void OnHover (bool Hover)
	{
		//print ("!!");
	}
	void OnPress (bool pressed)
	{
		if (enabled && NGUITools.GetActive(gameObject) && target != null)
		{
			mPressed = pressed;
			
			if (pressed)
			{
				if (restrictWithinPanel && mPanel == null) FindPanel();
				
				// Calculate the bounds
				if (restrictWithinPanel) mBounds = NGUIMath.CalculateRelativeWidgetBounds(mPanel.cachedTransform, target);
				
				// Remove all momentum on press
				mMomentum = Vector3.zero;
				mScroll = 0f;
				
				// Disable the spring movement
				SpringPosition sp = target.GetComponent<SpringPosition>();
				if (sp != null) sp.enabled = false;
				
				// Remember the hit position
				mLastPos = UICamera.lastHit.point;
				
				// Create the plane to drag along
				Transform trans = UICamera.currentCamera.transform;
				mPlane = new Plane((mPanel != null ? mPanel.cachedTransform.rotation : trans.rotation) * Vector3.back, mLastPos);
			}
			else if (restrictWithinPanel && mPanel.clipping != UIDrawCall.Clipping.None)
			{
				mPanel.ConstrainTargetToBounds(target, ref mBounds, false);
			}
			if (!pressed)
			{
				StartCoroutine("SpringPositionUpdate");
				
			}
		}
	}
	
	/// <summary>
	/// Drag the object along the plane.
	/// </summary>
	
	void OnDrag (Vector2 delta)
	{
		//print ("haha");
		if (enabled && NGUITools.GetActive(gameObject) && target != null)
		{
			UICamera.currentTouch.clickNotification = UICamera.ClickNotification.BasedOnDelta;
			
			Ray ray = UICamera.currentCamera.ScreenPointToRay(UICamera.currentTouch.pos);
			float dist = 0f;
			
			if (mPlane.Raycast(ray, out dist))
			{
				//print (ray.GetPoint(dist).x+","+ray.GetPoint(dist).y);
				Vector3 currentPos = ray.GetPoint(dist);
				mLastPos = currentPos;
				
				// We want to constrain the UI to be within bounds
				target.position = currentPos;			
				// 限制虛擬搖桿目標移動半徑
				target.transform.localPosition = new Vector3(Vector3.ClampMagnitude(target.transform.localPosition, ClampRadius).x, Vector3.ClampMagnitude(target.transform.localPosition, ClampRadius).y, 0);
				// 獲取目標
				joyStickPosX = target.transform.localPosition.x * posDivision;
				joyStickPosY = target.transform.localPosition.y * posDivision;
			}
		}
	}
	
	/// <summary>
	/// Apply the dragging momentum.
	/// </summary>
	
	void LateUpdate ()
	{
		float delta = UpdateRealTimeDelta();
		if (target == null) return;
		
		if (mPressed)
		{
			// Disable the spring movement
			SpringPosition sp = target.GetComponent<SpringPosition>();
			if (sp != null) sp.enabled = false;
			mScroll = 0f;
		}
		else
		{
			mMomentum += scale * (-mScroll * 0.05f);
			mScroll = NGUIMath.SpringLerp(mScroll, 0f, 20f, delta);
			
			if (mMomentum.magnitude > 0.0001f)
			{
				// Apply the momentum
				if (mPanel == null) FindPanel();
				
				if (mPanel != null)
				{
					target.position += NGUIMath.SpringDampen(ref mMomentum, 9f, delta);
					
					if (restrictWithinPanel && mPanel.clipping != UIDrawCall.Clipping.None)
					{
						mBounds = NGUIMath.CalculateRelativeWidgetBounds(mPanel.cachedTransform, target);
						
						
					}
					return;
				}
			}
			else mScroll = 0f;
		}
		
		// Dampen the momentum
		NGUIMath.SpringDampen(ref mMomentum, 9f, delta);
	}
	
	/// <summary>
	/// If the object should support the scroll wheel, do it.
	/// </summary>
	
	void OnScroll (float delta)
	{
		if (enabled && NGUITools.GetActive(gameObject))
		{
			if (Mathf.Sign(mScroll) != Mathf.Sign(delta)) mScroll = 0f;
			mScroll += delta * scrollWheelFactor;
		}
	}	
	
	//public delegate void OnFinished (UIJoyStick);
	/// <summary>
	/// Target position to tween to.
	/// </summary>
	
	private Vector3 targetPosition = Vector3.zero;
	
	/// <summary>
	/// How strong is the pull of the spring. Higher value means it gets to the target faster.
	/// </summary>
	
	public float strength = 10f;
	
	
	/// <summary>
	/// Whether the time scale will be ignored. Generally UI components should set it to 'true'.
	/// </summary>
	
	public bool ignoreTimeScale = false;
	
	/// <summary>
	/// Delegate to trigger when the spring finishes.
	/// </summary>
	//public OnFinished onFinished;
	
	float mThreshold = 0f;
	
	IEnumerator SpringPositionUpdate ()
	{
		while (true)
		{
			float delta = ignoreTimeScale ? UpdateRealTimeDelta() : Time.deltaTime;
			if (mThreshold == 0f) mThreshold = (targetPosition - target.localPosition).magnitude * 0.001f;
			target.localPosition = NGUIMath.SpringLerp(target.localPosition, targetPosition, strength, delta);
			
			joyStickPosX = target.transform.localPosition.x * posDivision;
			joyStickPosY = target.transform.localPosition.y * posDivision;
			
			if (mThreshold >= (targetPosition - target.localPosition).magnitude)
			{
				target.localPosition = targetPosition;	
				joyStickPosX = 0;
				joyStickPosY = 0;
				break;
			}
			yield return 0;
		}
	}
}
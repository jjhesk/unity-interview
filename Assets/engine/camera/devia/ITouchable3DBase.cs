/*/
* Script by Devin Curry
	* www.Devination.com
		* www.youtube.com/user/curryboy001
		* Please like and subscribe if you found my tutorials helpful :D
			* Google+ Community: https://plus.google.com/communities/108584850180626452949
				* Twitter: https://twitter.com/Devination3D
				* Facebook Page: https://www.facebook.com/unity3Dtutorialsbydevin
				/*/
public interface ITouchable3DBase
{
		//Remove functions you know you arent going to use
		// void OnNoTouches();
		void OnTouchBegan ();

		void OnTouchEnded ();

		void OnTouchMoved ();

		void OnTouchStayed ();
		// void OnTouchBeganAnywhere();
		void OnTouchEndedAnywhere ();

		void OnTouchMovedAnywhere ();

		void OnTouchStayedAnywhere ();
}
using UnityEngine;
using System;
using System.Collections.Generic;
using System.Collections;
using System.Collections.ObjectModel;

//using LitJson;
using System.Text;
using System.IO;
using JsonFx.Json;

//using Pathfinding.Serialization.JsonFx;
//using System.Linq;
//using SampleClassLibrary;
//using Newtonsoft.Json;
//using JsonFx.BuildTools;
//using JsonFx.Handlers;
//using Pathfinding.Serialization.JsonFx;
//
//using Pathfinding.Serialization.JsonFx.Json;



public class LoadGameData: MonoBehaviour
{
		private string jsonfolder = "http://hesk.imusictech.net/unity/json/";
		public string jsonGameData = "";
		public static LoadGameData gamedata;
		private gameLevelD listD;
		//private 
		void Start ()
		{
				if (gamedata == null) {
						gamedata = this;
						//DontDestroyOnLoad (this);
				}
		}

		public gameLevelD getLevelSetup {
				get {
						return listD;
				}
		}
//
//		private CombinedResolverStrategy dss ()
//		{
//				// accept all variations! list in order of priority
//					CombinedResolverStrategy resolver = new CombinedResolverStrategy (
//				new JsonResolverStrategy (),                                                             // simple JSON attributes
//				new DataContractResolverStrategy (),                                                     // DataContract attributes
//				new XmlResolverStrategy (),                                                              // XmlSerializer attributes
//				new ConventionResolverStrategy (ConventionResolverStrategy.WordCasing.PascalCase),       // DotNetStyle
//				new ConventionResolverStrategy (ConventionResolverStrategy.WordCasing.CamelCase),        // jsonStyle
//				new ConventionResolverStrategy (ConventionResolverStrategy.WordCasing.Lowercase, "-"),   // xml-style
//				new ConventionResolverStrategy (ConventionResolverStrategy.WordCasing.Uppercase, "_"));  // CONST_STYLE
//				return resolver;
//		}
		private IEnumerator wwwdataloading (string url)
		{
				//http://stackoverflow.com/questions/19928846/unity3d-how-to-using-assetbundle-loadasync-direct-load-prefab-from-assets-folder
				//http://gamedev.stackexchange.com/questions/61156/assetbundle-local-file-path-on-ios
				//http://docs.unity3d.com/Manual/abfaq.html
				//http://blog.paultondeur.com/2010/03/23/tutorial-loading-and-parsing-external-xml-and-json-files-with-unity-part-2-json/
				WWW www = new WWW (url);
				yield return www;
				if (www.error == null) {
						//Sucessfully loaded the JSON string
						Debug.Log ("Loaded following JSON string" + www.text);
						//Process books found in JSON file
						//ProcessBooks(www.data);
						loadcb (www.text);
				} else {
						Debug.Log ("ERROR: " + www.error);
				}
				//loadcb (www.text);
		}

		private IEnumerator iofileloading (string path)
		{
				StreamReader streamReader = new StreamReader (path, Encoding.UTF8);
				string data = streamReader.ReadToEnd ();
				streamReader.Close ();
				yield return data;
				loadcb (data);
		}

		public void export (cubebase[] data)
		{
				string datac = JsonWriter.Serialize (data);
				Debug.Log (datac);
		}

		private void loadcb (string datatxt)
		{
				JsonReaderSettings setting = new JsonReaderSettings ();
				setting.AddTypeConverter (new ColorConv ());
				JsonReader reader = new JsonReader (datatxt, setting);
				Debug.Log ("+++ Deserializing +++");
				listD = reader.Deserialize<gameLevelD> ();
				Debug.Log (datatxt);
		}

		private IEnumerator NewLoadBGElement ()
		{
				string path = Application.dataPath + "/Bundle/BGElement";
				AssetBundle ab = new AssetBundle ();
				AssetBundleRequest abr = ab.LoadAsync (path, typeof(GameObject));
				yield return abr;
				GameObject newCube = Instantiate (abr.asset) as GameObject;
		}

		private static IEnumerator DownloadFromStreamingAssetsFolder (string assetBundleName)
		{
				WWW file = new WWW ("file://" + Application.streamingAssetsPath + assetBundleName);
				yield return file;
				//Do something with your download
				//Application.persistentDataPath
		}

		public void LoadData ()
		{//var www = new WWW("file://" + Application.dataPath + "/myBundle.unity3d")

				//if(Application.platform
				//for android
				//http://answers.unity3d.com/questions/166495/application-file-path-android.html
				string path = Application.dataPath + "/" + jsonGameData;
				string wwwpath = jsonfolder + jsonGameData;
				if (Application.platform == RuntimePlatform.WindowsPlayer) {
						StartCoroutine (iofileloading (path));


				} else  if (Application.platform == RuntimePlatform.Android) {
						//StartCoroutine (iofileloading (path));
				} else  if (Application.platform == RuntimePlatform.WindowsEditor) {
						StartCoroutine (iofileloading (path));
				} else  if (Application.platform == RuntimePlatform.OSXEditor) {
						StartCoroutine (iofileloading (path));


				} else  if (Application.platform == RuntimePlatform.WindowsWebPlayer) {
						StartCoroutine (wwwdataloading (wwwpath));
				} else  if (Application.platform == RuntimePlatform.OSXWebPlayer) {
						StartCoroutine (wwwdataloading (wwwpath));
				}
		}
}

public class ColorConv : JsonConverter
{
		public override bool CanConvert (Type t)
		{
				return t == typeof(Color);
		}
	
		public override Dictionary<string,object> WriteJson (Type type, object value)
		{
				Color v = (Color)value;
				Dictionary<string,object> dict = new Dictionary<string, object> ();
				dict.Add ("r", v.r);
				dict.Add ("g", v.g);
				dict.Add ("b", v.b);
				dict.Add ("a", v.a);
				return dict;
		}

		public override object ReadJson (Type type, Dictionary<string,object> value)
		{
				//Debug.Log ("First key type "+value["x"].GetType());
				Color c = new Color (
					CastFloat (value ["r"]), 
					CastFloat (value ["g"]), 
					CastFloat (value ["b"]), 
					CastFloat (value ["a"])
				);
				//Vector3 v = new Vector3 (CastFloat (value ["r"]), CastFloat (value ["g"]), CastFloat (value ["b"]));
				return c;
		}
}
//		static void CountJsonTexts (string json_data)
//		{
//				JsonReader reader = new JsonReader (json_data);
//				int n_arrays, n_objects, n_total;
//				n_arrays = n_objects = n_total = 0;
//				while (! reader.EndOfInput) {
//						reader.Read ();
//						if (reader.EndOfJson) {
//								n_total++;
//								if (reader.Token == JsonToken.ArrayEnd)
//										n_arrays++;
//								else if (reader.Token == JsonToken.ObjectEnd)
//										n_objects++;
//						}
//				}
//				Debug.Log (string.Format ("Total of JSON texts read: {0}", n_total));
//				Debug.Log (string.Format ("Arrays: {0}", n_arrays));
//				Debug.Log (string.Format ("Objects: {0}", n_objects));
//		}
//
//		public static void CubeSerialization (cubebase[] list)
//		{
//				string datamap = JsonMapper.ToJson (list);
//				Debug.Log (datamap);
//		}
//	
//		public static void CubeDeserialization ()
//		{
//				string json = @"
//	            {
//	                ""Name""     : ""Thomas More"",
//	                ""Age""      : 57,
//	                ""Birthday"" : ""02/07/1478 00:00:00""
//	            }";
//				//Person thomas = JsonMapper.ToObject<Person> (json);
//				Debug.Log (json);
//		}

//		public void OnApplicationPause (bool pause)
//		{
//				Debug.Log ("*** OnApplicationPause ***************************");
//				if (pause) {
//						Debug.Log ("*** we got to pause and want to save ***********************");
//						// we are in background
//						saveLevelProgressToTextFile (1);
//				} else {
//						Debug.Log ("*** we resume the game ***********************");
//						// we are in foreground again.
//				}
//		}
//
//		public void saveLevelProgressToTextFile (int world)
//		{
//				Debug.Log ("******** saveLevelProgressToTextFile ********");
//				string fileName = "w" + world + "progress.txt";
//				// this turns a C# object into a JSON string.
//		
//				Debug.Log ("******** fileName = " + fileName);
//		
//		
//				Debug.Log ("******** Checking directory to save to");
//				if (!Directory.Exists (Application.persistentDataPath + "/LevelProgress")) {
//						Debug.Log ("Creating LevelProgress Folder");
//						Directory.CreateDirectory (Application.persistentDataPath + "/LevelProgress");
//			
//				} else {
//						Debug.Log ("LevelProgress Folder Exists");  
//				}
//		
//				//wir öffnen einen neuen StreamWriter
//				string fullPath = Application.persistentDataPath + "/LevelProgress/" + fileName;
//				Debug.Log ("try to save " + fullPath);
//
//				Debug.Log ("trying to serialize world1Levels = " + mLevelData);
//				string levelDataJSON = JsonWriter.Serialize (mLevelData);
//				Debug.Log ("******** levelDataJSON = " + levelDataJSON);
//
//				StreamWriter sw = new StreamWriter (fullPath);
//		
//				sw.WriteLine (levelDataJSON);
//				sw.Flush ();
//				sw.Close ();
//				//damit schliessen wir den StreamWriter
//				if (File.Exists (fullPath)) {
//						print ("File " + fileName + " written!");
//				} else {
//						Debug.LogWarning ("Error writing file " + fileName);
//				}
//		
//		
//		}



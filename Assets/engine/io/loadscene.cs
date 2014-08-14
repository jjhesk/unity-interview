using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
public class loadscene : MonoBehaviour
{
    [System.Serializable]
    private class TextureDownloader
    {
        public WWW www;
        public string url;
        public Texture2D tex;
        public string atlasName;
    }
    // Use this for initialization
    void Start()
    {
    
    }
    
    // Update is called once per frame
    void Update()
    {
    
    }

}

using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/SobelEdge")]
	public sealed class PP_SobelEdge : PostProcessBase {
		//Variables//
		public float threshold = 1f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/SobelEdge");
		}

		void Start() {
			base.material.SetFloat("_Threshold", threshold);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Threshold", threshold);
			Graphics.Blit (source, destination, material);
		}
	}

}
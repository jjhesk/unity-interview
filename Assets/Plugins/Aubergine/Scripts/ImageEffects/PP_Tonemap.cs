using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Tonemap")]
	public sealed class PP_Tonemap : PostProcessBase {
		//Variables//
		public float exposure = 0.1f;
		public float gamma = 1.0f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Tonemap");
		}

		void Start() {
			base.material.SetFloat("_Exposure", exposure);
			base.material.SetFloat("_Gamma", gamma);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Exposure", exposure);
			base.material.SetFloat("_Gamma", gamma);
			Graphics.Blit (source, destination, material);
		}
	}

}
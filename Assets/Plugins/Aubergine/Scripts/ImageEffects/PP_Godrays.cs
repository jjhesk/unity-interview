using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Godrays")]
	public sealed class PP_Godrays : PostProcessBase {
		//Variables//
		public float intensity = 6f;
		public float gamma = 1.6f;
		public float blurStart = 1f;
		public float blurWidth = -0.3f;
		public float centerX = 0.5f;
		public float centerY = 0.5f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Godrays");
		}

		void Start() {
			base.material.SetFloat("_Intensity", intensity);
			base.material.SetFloat("_Gamma", gamma);
			base.material.SetFloat("_BlurStart", blurStart);
			base.material.SetFloat("_BlurWidth", blurWidth);
			base.material.SetFloat("_CenterX", centerX);
			base.material.SetFloat("_CenterY", centerY);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Intensity", intensity);
			base.material.SetFloat("_Gamma", gamma);
			base.material.SetFloat("_BlurStart", blurStart);
			base.material.SetFloat("_BlurWidth", blurWidth);
			base.material.SetFloat("_CenterX", centerX);
			base.material.SetFloat("_CenterY", centerY);
			Graphics.Blit (source, destination, material);
		}
	}

}
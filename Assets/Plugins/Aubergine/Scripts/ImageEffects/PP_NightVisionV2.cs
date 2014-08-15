using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/NightVisionV2")]
	public sealed class PP_NightVisionV2 : PostProcessBase {
		//Variables//
		public Texture2D NoiseTex;
		public Color visionColor = Color.green;
		public Color fadeColor = Color.black;
		public float noiseAmount = 0.4f;
		public float radius = 0.5f;
		public float fade = 0.2f;
		public float intensity = 2.0f;
		public float gamma = 0.5f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/NightVisionV2");
		}

		void Start() {
			base.material.SetTexture("_NoiseTex", NoiseTex);
			base.material.SetVector("_VisionColor", visionColor);
			base.material.SetVector("_FadeColor", fadeColor);
			base.material.SetFloat("_NoiseAmount", noiseAmount);
			base.material.SetFloat("_Radius", radius);
			base.material.SetFloat("_Fade", fade);
			base.material.SetFloat("_Intensity", intensity);
			base.material.SetFloat("_Gamma", gamma);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetVector("_VisionColor", visionColor);
			base.material.SetVector("_FadeColor", fadeColor);
			base.material.SetFloat("_NoiseAmount", noiseAmount);
			base.material.SetFloat("_Radius", radius);
			base.material.SetFloat("_Fade", fade);
			base.material.SetFloat("_Intensity", intensity);
			base.material.SetFloat("_Gamma", gamma);
			Graphics.Blit (source, destination, material);
		}
	}

}
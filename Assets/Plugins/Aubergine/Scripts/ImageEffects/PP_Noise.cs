using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Noise")]
	public sealed class PP_Noise : PostProcessBase {
		//Variables//
		public float noiseScale = 0.5f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Noise");
		}

		void Start() {
			base.material.SetFloat("_NoiseScale", noiseScale);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_NoiseScale", noiseScale);
			Graphics.Blit (source, destination, material);
		}
	}

}
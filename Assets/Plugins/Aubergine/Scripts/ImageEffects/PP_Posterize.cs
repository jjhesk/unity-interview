using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Posterize")]
	public sealed class PP_Posterize : PostProcessBase {
		//Variables//
		public int colors = 4;
		public float gamma = 1f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Posterize");
		}

		void Start() {
			base.material.SetFloat("_Colors", colors);
			base.material.SetFloat("_Gamma", gamma);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Colors", colors);
			base.material.SetFloat("_Gamma", gamma);
			Graphics.Blit (source, destination, material);
		}
	}

}
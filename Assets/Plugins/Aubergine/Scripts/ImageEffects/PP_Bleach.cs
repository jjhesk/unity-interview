using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Bleach")]
	public sealed class PP_Bleach : PostProcessBase {
		//Variables//
		public float opacity = 1.0f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Bleach");
		}

		void Start() {
			base.material.SetFloat("_Opacity", opacity);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Opacity", opacity);
			Graphics.Blit (source, destination, material);
		}
	}

}
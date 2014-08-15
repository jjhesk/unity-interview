using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/DreamBlurColor")]
	public sealed class PP_DreamBlurColor : PostProcessBase {
		//Variables//
		public float blurStrength = 1f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/DreamBlurColor");
		}

		void Start() {
			base.material.SetFloat("_BlurStrength", blurStrength);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_BlurStrength", blurStrength);
			Graphics.Blit(source, destination, material);
		}
	}

}
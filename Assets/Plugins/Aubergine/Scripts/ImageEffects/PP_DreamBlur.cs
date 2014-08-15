using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/DreamBlur")]
	public sealed class PP_DreamBlur : PostProcessBase {
		//Variables//
		public float blurStrength = 1f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/DreamBlur");
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
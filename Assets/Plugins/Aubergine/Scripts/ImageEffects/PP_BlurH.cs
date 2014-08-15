using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/BlurH")]
	public sealed class PP_BlurH : PostProcessBase {
		//Variables//
		public float blurStrength = 1f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/BlurH");
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
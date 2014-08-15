using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/BlurV")]
	public sealed class PP_BlurV : PostProcessBase {
		//Variables//
		public float blurStrength = 1f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/BlurV");
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
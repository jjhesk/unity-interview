using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Desaturate")]
	public sealed class PP_Desaturate : PostProcessBase {
		//Variables//
		public float amount = 0.5f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Desaturate");
		}

		void Start() {
			base.material.SetFloat("_Amount", amount);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Amount", amount);
			Graphics.Blit (source, destination, material);
		}
	}

}
using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/FakeHDR")]
	public sealed class PP_FakeHDR : PostProcessBase {
		//Variables//
		public float amount = 0.5f;
		public float multiplier = 1f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/FakeHDR");
		}

		void Start() {
			base.material.SetFloat("_Amount", amount);
			base.material.SetFloat("_Multiplier", multiplier);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Amount", amount);
			base.material.SetFloat("_Multiplier", multiplier);
			Graphics.Blit (source, destination, material);
		}
	}

}
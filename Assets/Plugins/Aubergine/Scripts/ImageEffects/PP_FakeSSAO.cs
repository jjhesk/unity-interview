using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/FakeSSAO")]
	public sealed class PP_FakeSSAO : PostProcessBase {
		//Variables//
		public int amount = 4;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/FakeSSAO");
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
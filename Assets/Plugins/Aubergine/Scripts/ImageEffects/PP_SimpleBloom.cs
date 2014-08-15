using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/SimpleBloom")]
	public sealed class PP_SimpleBloom : PostProcessBase {
		//Variables//
		public float strength = 1f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/SimpleBloom");
		}

		void Start() {
			base.material.SetFloat("_Strength", strength);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Strength", strength);
			Graphics.Blit (source, destination, material);
		}
	}

}
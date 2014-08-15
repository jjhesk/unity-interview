using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/RadialBlur")]
	public sealed class PP_RadialBlur : PostProcessBase {
		//Variables//
		public float centerX = 0.5f;
		public float centerY = 0.5f;
		public float strength = 1f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/RadialBlur");
		}

		void Start() {
			base.material.SetFloat("_CenterX", centerX);
			base.material.SetFloat("_CenterY", centerY);
			base.material.SetFloat("_Strength", strength);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_CenterX", centerX);
			base.material.SetFloat("_CenterY", centerY);
			base.material.SetFloat("_Strength", strength);
			Graphics.Blit (source, destination, material);
		}
	}

}
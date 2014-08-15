using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Vignette")]
	public sealed class PP_Vignette : PostProcessBase {
		//Variables//
		public float radius = 10f;
		public float darkness = 0.5f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Vignette");
		}

		void Start() {
			base.material.SetFloat("_Radius", radius);
			base.material.SetFloat("_Darkness", darkness);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Radius", radius);
			base.material.SetFloat("_Darkness", darkness);
			Graphics.Blit (source, destination, material);
		}
	}

}
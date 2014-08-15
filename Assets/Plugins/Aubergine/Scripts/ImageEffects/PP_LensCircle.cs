using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/LensCircle")]
	public sealed class PP_LensCircle : PostProcessBase {
		//Variables//
		public float centerX = 0.5f;
		public float centerY = 0.5f;
		public float radiusX = 1.0f;
		public float radiusY = 0.0f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/LensCircle");
		}

		void Start() {
			base.material.SetFloat("_CenterX", centerX);
			base.material.SetFloat("_CenterY", centerY);
			base.material.SetFloat("_RadiusX", radiusX);
			base.material.SetFloat("_RadiusY", radiusY);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_CenterX", centerX);
			base.material.SetFloat("_CenterY", centerY);
			base.material.SetFloat("_RadiusX", radiusX);
			base.material.SetFloat("_RadiusY", radiusY);
			Graphics.Blit (source, destination, material);
		}
	}

}
using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/RadialUndistortion")]
	public sealed class PP_RadialUndistortion: PostProcessBase {
		//Variables//
		public float f = 368f;
		public float centerX = 147f;
		public float centerY = 126f;
		public float k1 = 0.41f;
		public float k2 = 0.40f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/RadialUndistortion");
		}

		void Start() {
			base.material.SetFloat("_F", f);
			base.material.SetFloat("_OX", centerX);
			base.material.SetFloat("_OY", centerY);
			base.material.SetFloat("_K1", k1);
			base.material.SetFloat("_K2", k2);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_F", f);
			base.material.SetFloat("_OX", centerX);
			base.material.SetFloat("_OY", centerY);
			base.material.SetFloat("_K1", k1);
			base.material.SetFloat("_K2", k2);
			Graphics.Blit (source, destination, material);
		}
	}

}
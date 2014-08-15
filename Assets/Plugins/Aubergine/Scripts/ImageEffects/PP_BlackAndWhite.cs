using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/BlackAndWhite")]
	public sealed class PP_BlackAndWhite : PostProcessBase {
		//Variables//
		public float threshold = 0.5f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/BlackAndWhite");
		}

		void Start() {
			base.material.SetFloat("_Threshold", threshold);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Threshold", threshold);
			Graphics.Blit (source, destination, material);
		}
	}

}
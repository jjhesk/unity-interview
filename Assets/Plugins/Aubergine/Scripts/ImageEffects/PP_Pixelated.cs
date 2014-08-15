using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Pixelated")]
	public sealed class PP_Pixelated : PostProcessBase {
		//Variables//
		public int pixelWidth = 16;
		public int pixelHeight = 16;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Pixelated");
		}

		void Start() {
			base.material.SetFloat("_PixWidth", pixelWidth);
			base.material.SetFloat("_PixHeight", pixelHeight);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_PixWidth", pixelWidth);
			base.material.SetFloat("_PixHeight", pixelHeight);
			Graphics.Blit (source, destination, material);
		}
	}

}
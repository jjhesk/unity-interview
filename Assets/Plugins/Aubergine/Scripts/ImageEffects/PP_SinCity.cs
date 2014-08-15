using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/SinCity")]
	public sealed class PP_SinCity : PostProcessBase {
		//Variables//
		public Color selectedColor = Color.red;
		public Color replacementColor = Color.white;
		public float desaturation = 0.5f;
		public float tolerance = 0.5f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/SinCity");
		}

		void Start() {
			base.material.SetVector("_SelectedColor", selectedColor);
			base.material.SetVector("_ReplacedColor", replacementColor);
			base.material.SetFloat("_Desaturation", desaturation);
			base.material.SetFloat("_Tolerance", tolerance);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetColor("_SelectedColor", selectedColor);
			base.material.SetColor("_ReplacedColor", replacementColor);
			base.material.SetFloat("_Desaturation", desaturation);
			base.material.SetFloat("_Tolerance", tolerance);
			Graphics.Blit (source, destination, material);
		}
	}

}
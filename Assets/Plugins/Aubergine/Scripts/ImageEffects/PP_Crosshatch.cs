using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Crosshatch")]
	public sealed class PP_Crosshatch : PostProcessBase {
		//Variables//
		public Color lineColor = Color.white;
		public float strength = 0.01f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Crosshatch");
		}

		void Start() {
			base.material.SetVector("_LineColor", lineColor);
			base.material.SetFloat("_Strength", strength);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetVector("_LineColor", lineColor);
			base.material.SetFloat("_Strength", strength);
			Graphics.Blit (source, destination, material);
		}
	}

}
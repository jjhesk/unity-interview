using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/LineArt")]
	public sealed class PP_LineArt : PostProcessBase {
		//Variables//
		public Color lineColor = Color.black;
		public float strength = 80f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/LineArt");
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
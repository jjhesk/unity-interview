using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/SecurityCamera")]
	public sealed class PP_SecurityCamera : PostProcessBase {
		//Variables//
		public float speed = 2.0f;
		public float thickness = 3.0f;
		public float luminance = 0.5f;
		public float darkness = 0.75f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/SecurityCamera");
		}

		void Start() {
			base.material.SetFloat("_Speed", speed);
			base.material.SetFloat("_Thickness", thickness);
			base.material.SetFloat("_Luminance", luminance);
			base.material.SetFloat("_Darkness", darkness);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Speed", speed);
			base.material.SetFloat("_Thickness", thickness);
			base.material.SetFloat("_Luminance", luminance);
			base.material.SetFloat("_Darkness", darkness);
			Graphics.Blit (source, destination, material);
		}
	}

}
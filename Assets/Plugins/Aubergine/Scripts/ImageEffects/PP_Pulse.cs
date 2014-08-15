using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Pulse")]
	public sealed class PP_Pulse : PostProcessBase {
		//Variables//
		public float directionX = 0.5f;
		public float directionY = 0.5f;
		public float speed = 5.0f;
		public float amplitude = 0.1f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Pulse");
		}

		void Start() {
			base.material.SetFloat("_DirectionX", directionX);
			base.material.SetFloat("_DirectionY", directionY);
			base.material.SetFloat("_Speed", speed);
			base.material.SetFloat("_Amplitude", amplitude);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_DirectionX", directionX);
			base.material.SetFloat("_DirectionY", directionY);
			base.material.SetFloat("_Speed", speed);
			base.material.SetFloat("_Amplitude", amplitude);
			Graphics.Blit (source, destination, material);
		}
	}

}
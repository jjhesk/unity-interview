using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Waves")]
	public sealed class PP_Waves : PostProcessBase {
		//Variables//
		public float speed = 10.0f;
		public float amplitude = 0.05f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Waves");
		}

		void Start() {
			base.material.SetFloat("_Speed", speed);
			base.material.SetFloat("_Amplitude", amplitude);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Speed", speed);
			base.material.SetFloat("_Amplitude", amplitude);
			Graphics.Blit (source, destination, material);
		}
	}

}
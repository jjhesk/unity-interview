using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Amnesia")]
	public sealed class PP_Amnesia : PostProcessBase {
		//Variables//
		public float density = 1.0f;
		public float speed = 3.0f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Amnesia");
		}

		void Start() {
			base.material.SetFloat("_Density", density);
			base.material.SetFloat("_Speed", speed);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Density", density);
			base.material.SetFloat("_Speed", speed);
			Graphics.Blit (source, destination, material);
		}
	}

}
using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/LightWave")]
	public sealed class PP_LightWave : PostProcessBase {
		//Variables//
		public float red = 4f;
		public float green = 4f;
		public float blue = 4f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/LightWave");
		}

		void Start() {
			base.material.SetFloat("_Red", red);
			base.material.SetFloat("_Green", green);
			base.material.SetFloat("_Blue", blue);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Red", red);
			base.material.SetFloat("_Green", green);
			base.material.SetFloat("_Blue", blue);
			Graphics.Blit (source, destination, material);
		}
	}

}
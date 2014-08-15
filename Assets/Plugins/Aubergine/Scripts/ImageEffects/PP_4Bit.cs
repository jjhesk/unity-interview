using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/4Bit")]
	public sealed class PP_4Bit : PostProcessBase {
		//Variables//
		public int bitDepth = 2;
		public float contrast = 1f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/4Bit");
		}

		void Start() {
			base.material.SetFloat("_BitDepth", bitDepth);
			base.material.SetFloat("_Contrast", contrast);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_BitDepth", bitDepth);
			base.material.SetFloat("_Contrast", contrast);
			Graphics.Blit (source, destination, material);
		}
	}

}
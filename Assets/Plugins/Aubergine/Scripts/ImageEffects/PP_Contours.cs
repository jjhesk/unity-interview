using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Contours")]
	public sealed class PP_Contours : PostProcessBase {
		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Contours");
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			Graphics.Blit (source, destination, material);
		}
	}

}
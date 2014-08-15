using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Negative")]
	public sealed class PP_Negative : PostProcessBase {
		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Negative");
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			Graphics.Blit (source, destination, material);
		}
	}

}
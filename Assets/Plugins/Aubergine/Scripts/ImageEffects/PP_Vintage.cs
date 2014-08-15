using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Vintage")]
	public sealed class PP_Vintage : PostProcessBase {
		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Vintage");
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			Graphics.Blit (source, destination, material);
		}
	}

}
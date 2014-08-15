using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/NightVision")]
	public sealed class PP_NightVision : PostProcessBase {
		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/NightVision");
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			Graphics.Blit (source, destination, material);
		}
	}

}
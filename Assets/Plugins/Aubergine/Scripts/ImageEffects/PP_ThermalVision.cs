using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/ThermalVision")]
	public sealed class PP_ThermalVision : PostProcessBase {
		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/ThermalVision");
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			Graphics.Blit (source, destination, material);
		}
	}

}
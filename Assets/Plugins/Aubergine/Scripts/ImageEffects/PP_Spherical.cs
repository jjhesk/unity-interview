using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Spherical")]
	public sealed class PP_Spherical : PostProcessBase {
		//Variables//
		public float radius = 1f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Spherical");
		}

		void Start() {
			base.material.SetFloat("_Radius", radius);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Radius", radius);
			Graphics.Blit (source, destination, material);
		}
	}

}
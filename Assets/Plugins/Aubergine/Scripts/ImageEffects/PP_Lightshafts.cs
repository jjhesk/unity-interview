using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Lightshafts")]
	public sealed class PP_Lightshafts : PostProcessBase {
		//Variables//
		public Transform lightSource;
		public float density = 1.0f;
		public float weight = 1.0f;
		public float decay = 1.0f;
		public float exposure = 1.0f;
		private Vector3 lightPos;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Lightshafts");
		}

		void Start() {
			base.material.SetFloat("_Density", density);
			base.material.SetFloat("_Weight", weight);
			base.material.SetFloat("_Decay", decay);
			base.material.SetFloat("_Exposure", exposure);
			lightPos = camera.WorldToViewportPoint(lightSource.position);
			base.material.SetVector("_LightPos", lightPos);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			lightPos = camera.WorldToViewportPoint(lightSource.position);
			if (lightPos.x < 0f || lightPos.x > 1f || lightPos.y < 0f || lightPos.y > 1f || lightPos.z < 0f) {
				base.material.SetVector("_LightPos", new Vector3(0.5f, 0.5f, 0f));
				base.material.SetFloat("_Density", density - density + 0.1f);
				base.material.SetFloat("_Weight", weight);
				base.material.SetFloat("_Decay", decay);
				base.material.SetFloat("_Exposure", exposure);
			}
			else {
				base.material.SetVector("_LightPos", lightPos);
				base.material.SetFloat("_Density", density);
				base.material.SetFloat("_Weight", weight);
				base.material.SetFloat("_Decay", decay);
				base.material.SetFloat("_Exposure", exposure);
			}
			Graphics.Blit (source, destination, material);
		}
	}

}
using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Frost")]
	public sealed class PP_Frost : PostProcessBase {
		//Variables//
		public Texture noiseTexture;
		public float amount = 1.0f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Frost");
		}

		void Start() {
			if(noiseTexture)
				base.material.SetTexture("_NoiseTex", noiseTexture);
			else
				Debug.LogWarning("You must set the noiseTexture Texture");
			base.material.SetFloat("_Amount", amount);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetTexture("_NoiseTex", noiseTexture);
			base.material.SetFloat("_Amount", amount);
			Graphics.Blit (source, destination, material);
		}
	}

}
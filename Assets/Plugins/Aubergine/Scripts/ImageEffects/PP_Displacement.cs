using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Displacement")]
	public sealed class PP_Displacement : PostProcessBase {
		//Variables//
		public Texture bumpTexture;
		public float amount = 0.5f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Displacement");
		}

		void Start() {
			if(bumpTexture)
				base.material.SetTexture("_BumpTex", bumpTexture);
			else
				Debug.LogWarning("You must set the bumpTexture Texture");
			base.material.SetFloat("_Amount", amount);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetTexture("_BumpTex", bumpTexture);
			base.material.SetFloat("_Amount", amount);
			Graphics.Blit (source, destination, material);
		}
	}

}
using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/Holywood")]
	public sealed class PP_Holywood : PostProcessBase {
		//Variables//
		public float lumThreshold = 0.13f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/Holywood");
		}

		void Start() {
			Matrix4x4 mtx = Matrix4x4.zero;
			mtx.m00 = 0.5149f; mtx.m01 = 0.3244f; mtx.m02 = 0.1607f; mtx.m03 = 0.0f;
			mtx.m10 = 0.2654f; mtx.m11 = 0.6704f; mtx.m12 = 0.0642f; mtx.m13 = 0.0f;
			mtx.m20 = 0.0248f; mtx.m21 = 0.1248f; mtx.m22 = 0.8504f; mtx.m23 = 0.0f;
			mtx.m30 = 0.0000f; mtx.m31 = 0.0000f; mtx.m32 = 0.0000f; mtx.m33 = 0.0f;
			base.material.SetMatrix("_MtxColor", mtx);
			base.material.SetFloat("_LumThreshold", lumThreshold);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_LumThreshold", lumThreshold);
			Graphics.Blit (source, destination, material);
		}
	}

}
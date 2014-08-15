using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/StereoAnaglyph-AmberBlue")]
	public sealed class PP_StereoAnaglyph_AmberBlue : PostProcessBase {
		//Variables//
		public float distance = 0.005f;

		//Mono Methods//
		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/StereoAnaglyph-AmberBlue");
		}

		void Start() {
			//dubois amber blue matrix 1
			Matrix4x4 mtx0 = Matrix4x4.zero;
			mtx0.m00 = 1.062f; mtx0.m01 = -0.026f; mtx0.m02 = -0.038f; mtx0.m03 = 0.0f;
			mtx0.m10 = -0.205f; mtx0.m11 = 0.908f; mtx0.m12 = -0.173f; mtx0.m13 = 0.0f;
			mtx0.m20 = 0.299f; mtx0.m21 = 0.068f; mtx0.m22 = 0.022f; mtx0.m23 = 0.0f;
			mtx0.m30 = 0.0000f; mtx0.m31 = 0.0000f; mtx0.m32 = 0.0000f; mtx0.m33 = 0.0f;
			//dubois amber blue matrix 2
			Matrix4x4 mtx1 = Matrix4x4.zero;
			mtx1.m00 = -0.016f; mtx1.m01 = 0.006f; mtx1.m02 = 0.094f; mtx1.m03 = 0.0f;
			mtx1.m10 = -0.123f; mtx1.m11 = 0.062f; mtx1.m12 = 0.185f; mtx1.m13 = 0.0f;
			mtx1.m20 = -0.017f; mtx1.m21 = -0.017f; mtx1.m22 = 0.911f; mtx1.m23 = 0.0f;
			mtx1.m30 = 0.0000f; mtx1.m31 = 0.0000f; mtx1.m32 = 0.0000f; mtx1.m33 = 0.0f;
			base.material.SetMatrix("_MtxColor0", mtx0);
			base.material.SetMatrix("_MtxColor1", mtx1);
			base.material.SetFloat("_Distance", distance);
		}

		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			base.material.SetFloat("_Distance", distance);
			Graphics.Blit (source, destination, material);
		}
	}

}
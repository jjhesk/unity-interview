using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/ThermalVisionV2")]
	public class PP_ThermalVisionV2 : PostProcessBase {
		//Variables//
		public Texture2D ThermalTex;
		public Texture2D NoiseTex;
		public float noiseAmount = 100.0f;

		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/ThermalVisionV2");
			camera.depthTextureMode |= DepthTextureMode.DepthNormals;
		}

		void Start() {
			base.material.SetTexture("_ThermalTex", ThermalTex);
			base.material.SetTexture("_NoiseTex", NoiseTex);
			base.material.SetFloat("_NoiseAmount", noiseAmount);
		}

		//[ImageEffectOpaque]
		void OnRenderImage(RenderTexture source, RenderTexture destination) {
			if(!enabled) {
				Graphics.Blit(source, destination);
				return;
			}
			//Screen space positions
			float camNear = camera.nearClipPlane;
			float camFar = camera.farClipPlane;
			float camFov = camera.fieldOfView;
			float camFovHalf = camFov * 0.5f;
			float camAspect = camera.aspect;
			Matrix4x4 corners = Matrix4x4.identity;

			Vector3 right = transform.right * camNear * Mathf.Tan(camFovHalf * Mathf.Deg2Rad) * camAspect;
			Vector3 top = transform.up * camNear * Mathf.Tan(camFovHalf * Mathf.Deg2Rad);
			//Set frustum corners
			Vector3 corner = (transform.forward * camNear - right + top); //topleft
			float camScale = corner.magnitude * camFar/camNear;
			corner.Normalize();
			corner *= camScale;
			corners.SetRow(0, corner);
			corner = (transform.forward * camNear + right + top); //topright
			corner.Normalize();
			corner *= camScale;
			corners.SetRow(1, corner);
			corner = (transform.forward * camNear + right - top); //bottomright
			corner.Normalize();
			corner *= camScale;
			corners.SetRow(2, corner);
			corner = (transform.forward * camNear - right - top); //bottomleft
			corner.Normalize();
			corner *= camScale;
			corners.SetRow(3, corner);
			base.material.SetMatrix("_WS_FrustumCorners", corners);
			//Faster according to Unity samples
			base.material.SetVector("_WS_CameraPosition", transform.position);

			//Set Variables
			base.material.SetTexture("_ThermalTex", ThermalTex);
			base.material.SetTexture("_NoiseTex", NoiseTex);
			base.material.SetFloat("_NoiseAmount", noiseAmount);

			//Graphics.Blit(source, destination);
			CustomGraphicsBlit(source, destination, base.material, 0);
		}

		static void CustomGraphicsBlit(RenderTexture source, RenderTexture dest, Material mat, int pass) {
			RenderTexture.active = dest;
			mat.SetTexture("_MainTex", source);
			//Custom Quad
			GL.PushMatrix();
			GL.LoadOrtho();
			mat.SetPass(pass);
			GL.Begin(GL.QUADS);
			GL.MultiTexCoord2(0, 0.0f, 0.0f);
			GL.Vertex3(0.0f, 0.0f, 3.0f); //BL

			GL.MultiTexCoord2(0, 1.0f, 0.0f);
			GL.Vertex3(1.0f, 0.0f, 2.0f); //BR

			GL.MultiTexCoord2(0, 1.0f, 1.0f);
			GL.Vertex3(1.0f, 1.0f, 1.0f); //TR

			GL.MultiTexCoord2(0, 0.0f, 1.0f);
			GL.Vertex3(0.0f, 1.0f, 0.0f); //TL
			GL.End();
			GL.PopMatrix();
		}
	}

}
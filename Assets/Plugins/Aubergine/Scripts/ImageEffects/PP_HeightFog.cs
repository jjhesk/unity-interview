using UnityEngine;

namespace Aubergine {

	[ExecuteInEditMode]
	[AddComponentMenu("Aubergine/Image Effects/HeightFog")]
	public class PP_HeightFog : PostProcessBase {
		
		public float Density = 100.0f;
		public float Height = 0.0f;
		public float FallOff = 1.0f;
		public float Scale = 0.0025f;
		public float Speed = 0.005f;
		public Texture2D NoiseTex;
		public Color FogColor = Color.gray;

		void Awake() {
			base.shader = Shader.Find("Hidden/Aubergine/ImageEffects/HeightFog");
			camera.depthTextureMode |= DepthTextureMode.Depth;
		}

		void Start() {
			base.material.SetVector("_Height", new Vector4(Height, 1.0f / FallOff));
			base.material.SetFloat("_Density", Density * 0.01f);
			base.material.SetTexture("_NoiseTex", NoiseTex);
			base.material.SetColor("_FogColor", FogColor);
			base.material.SetFloat("_Scale", Scale);
			base.material.SetFloat("_Speed", Speed);
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
			base.material.SetVector("_Height", new Vector4(Height, 1.0f/FallOff));
			base.material.SetFloat("_Density", Density * 0.01f);
			base.material.SetTexture("_NoiseTex", NoiseTex);
			base.material.SetColor("_FogColor", FogColor);
			base.material.SetFloat("_Scale", Scale);
			base.material.SetFloat("_Speed", Speed);

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
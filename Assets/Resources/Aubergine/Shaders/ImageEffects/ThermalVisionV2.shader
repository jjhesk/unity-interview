Shader "Hidden/Aubergine/ImageEffects/ThermalVisionV2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}

	CGINCLUDE
	#include "UnityCG.cginc"

	uniform sampler2D _CameraDepthNormalsTexture;
	uniform float4 _WS_CameraPosition;

	void GetPosAndNormals(float2 uvCoord, float4 ray, out float3 pos, out float3 norm) {
		float4 encoded = tex2D(_CameraDepthNormalsTexture, uvCoord);
		float d;
		float3 n;
		DecodeDepthNormal(encoded, d, n);
		//Norm
		norm = n;
		//Pos
		float depth = Linear01Depth(d);
		float4 wsDir = depth * ray;
		pos = _WS_CameraPosition.xyz + wsDir.xyz;
	}
	ENDCG

	SubShader {
		Pass {
			Tags { "LightMode" = "Always" }
			ZTest Always Cull Off ZWrite Off Fog { Mode off }

			CGPROGRAM
			#pragma exclude_renderers xbox360 ps3 flash
			#pragma vertex vert
			#pragma fragment frag
			#pragma fragmentoption ARB_precision_hint_fastest

			uniform sampler2D _MainTex, _ThermalTex, _NoiseTex;
			uniform float4 _MainTex_TexelSize;
			uniform float4x4 _WS_FrustumCorners;
			uniform float _NoiseAmount;

			struct v2f {
				float4 pos : POSITION;
				float2 uv : TEXCOORD0;
				float4 ray : TEXCOORD1;
			};

			v2f vert(appdata_img v) {
				v2f o;
				half index = v.vertex.z;
				v.vertex.z = 0.1;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				#ifdef UNITY_HALF_TEXEL_OFFSET
					v.texcoord.y += _MainTex_TexelSize.y;
				#endif
				#if SHADER_API_D3D9
					if (_MainTex_TexelSize.y < 0)
						v.texcoord.y = 1.0 - v.texcoord.y;
				#endif
				o.uv = MultiplyUV(UNITY_MATRIX_TEXTURE0, v.texcoord);
				o.ray = _WS_FrustumCorners[(int)index];
				o.ray.w = index;
				return o;
			}

			float4 frag (v2f i) : COLOR {
				float4 col = tex2D(_MainTex, i.uv);
				float3 pos, norm;
				GetPosAndNormals(i.uv, i.ray, pos, norm);
				fixed4 main = tex2D(_MainTex, i.uv);
				fixed lum = Luminance(main.rgb);
				
				fixed3 result = 0;
				float3 eyeVec = _WS_CameraPosition.xyz - pos;
				float rad = 2.2;
				if(length(norm) > 0.1)
					rad += dot(normalize(eyeVec), normalize(norm));
				float nuv = lum * saturate(rad);
				result = tex2D(_ThermalTex, float2(nuv, nuv)).rgb + tex2D(_NoiseTex, _NoiseAmount * (i.uv + sin(_Time.y * 50.0))).rgb;
				return fixed4(result, main.a);
			}
			ENDCG
		}
	}
	Fallback off
}
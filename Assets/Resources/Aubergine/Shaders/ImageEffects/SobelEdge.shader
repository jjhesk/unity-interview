Shader "Hidden/Aubergine/ImageEffects/SobelEdge" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}

	SubShader {
		Pass {
			Tags { "LightMode" = "Always" }
			ZTest Always Cull Off ZWrite Off Fog { Mode off }

			CGPROGRAM
			#pragma exclude_renderers xbox360 ps3 flash
			#pragma vertex vert
			#pragma fragment frag
			#pragma fragmentoption ARB_precision_hint_fastest
			#include "UnityCG.cginc"

			uniform sampler2D _MainTex;
			uniform float4 _MainTex_TexelSize;
			uniform float _Threshold;

			v2f_img vert(appdata_img v) {
				v2f_img o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				#ifdef UNITY_HALF_TEXEL_OFFSET
					v.texcoord.y += _MainTex_TexelSize.y;
				#endif
				#if SHADER_API_D3D9
					if (_MainTex_TexelSize.y < 0)
						v.texcoord.y = 1.0 - v.texcoord.y;
				#endif
				o.uv = MultiplyUV(UNITY_MATRIX_TEXTURE0, v.texcoord);
				return o;
			}

			fixed4 frag (v2f_img i) : COLOR {
				fixed4 main = tex2D(_MainTex, i.uv);
				fixed s00 = tex2D(_MainTex, i.uv + _MainTex_TexelSize.xy * float2(-1, -1)).r;
				fixed s01 = tex2D(_MainTex, i.uv + _MainTex_TexelSize.xy * float2( 0, -1)).r;
				fixed s02 = tex2D(_MainTex, i.uv + _MainTex_TexelSize.xy * float2( 1, -1)).r;
				fixed s10 = tex2D(_MainTex, i.uv + _MainTex_TexelSize.xy * float2(-1, 0)).r;
				fixed s12 = tex2D(_MainTex, i.uv + _MainTex_TexelSize.xy * float2( 1, 0)).r;
				fixed s20 = tex2D(_MainTex, i.uv + _MainTex_TexelSize.xy * float2(-1, 1)).r;
				fixed s21 = tex2D(_MainTex, i.uv + _MainTex_TexelSize.xy * float2( 0, 1)).r;
				fixed s22 = tex2D(_MainTex, i.uv + _MainTex_TexelSize.xy * float2( 1, 1)).r;
				float sobelX = s00 + 2 * s10 + s20 - s02 - 2 * s12 - s22;
				float sobelY = s00 + 2 * s01 + s02 - s20 - 2 * s21 - s22;
				float edgeSqr = (sobelX * sobelX + sobelY * sobelY);
				fixed4 result = edgeSqr;
				result  *= 1.0 - ((edgeSqr > _Threshold) * _Threshold);
				return result + main;
			}
			ENDCG
		}
	}

	Fallback off
}
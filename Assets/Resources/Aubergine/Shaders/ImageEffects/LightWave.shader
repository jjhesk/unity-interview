Shader "Hidden/Aubergine/ImageEffects/LightWave" {
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
			uniform float _Red, _Green, _Blue;

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
				fixed4 result = 0;
				result.r = tex2D(_MainTex, i.uv + float2(_MainTex_TexelSize.x * _Red, 0)).r;
				result.g = tex2D(_MainTex, i.uv + float2(0, _MainTex_TexelSize.y * _Green)).r;
				result.b = tex2D(_MainTex, i.uv + float2(_MainTex_TexelSize.x * _Blue, _MainTex_TexelSize.y * _Blue)).r;
				result.a = 1.0;
				return result;
			}
			ENDCG
		}
	}

	Fallback off
}
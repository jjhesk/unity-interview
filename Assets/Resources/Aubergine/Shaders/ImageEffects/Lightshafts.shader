Shader "Hidden/Aubergine/ImageEffects/Lightshafts" {
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
			#pragma target 3.0
			#include "UnityCG.cginc"

			uniform sampler2D _MainTex;
			uniform float4 _MainTex_TexelSize;
			uniform float _Density;
			uniform float _Weight;
			uniform float _Decay;
			uniform float _Exposure;
			uniform float4 _LightPos;

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
				float2 duv = (i.uv - _LightPos.xy);
				duv *= 1.0f / 32 * _Density;
				fixed4 main = tex2D(_MainTex, i.uv);
				half illum = 1.0f;
				for (int a = 0; a < 32; a++) {
					i.uv -= duv;
					fixed3 sample = tex2D(_MainTex, i.uv).rgb;
					sample *= illum * _Weight;
					main.rgb += sample;
					illum *= _Decay;
				}
				return fixed4(main.rgb * _Exposure, main.a);
			}
			ENDCG
		}
	}

	Fallback off
}
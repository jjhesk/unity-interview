Shader "Hidden/Aubergine/ImageEffects/LineArt" {
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
			uniform fixed4 _LineColor;
			uniform float _Strength;

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
				float x = i.uv.x;
				int xi = x * _Strength;
				float x2 = ((float)xi) / _Strength;

				float f = (x - x2) * _Strength;
				if (f > 0.5)
					f = 1.0 - f;
				float4 main = tex2D(_MainTex, float2(x2, i.uv.y));
				float lum =  Luminance(main.rgb) * 0.5;
				if (f > 0.45)
					lum = 1.0;
				else if(f < 0.5 - lum)
					lum = 0;
				else {
					f = 0.45 - f;
					lum = 1 - f / lum;
				}
				main.rgb = lum * _LineColor.rgb + (1.0 - lum) * (1.0 - _LineColor.rgb);
				//main.a *= _LineColor.a * lum;
				return main;
			}
			ENDCG
		}
	}

	Fallback off
}
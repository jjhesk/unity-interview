Shader "Hidden/Aubergine/ImageEffects/ThermalVision" {
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
			static const fixed4 colors[3] =
			{
				{ 0.0, 0.0, 1.0, 1.0 }, { 1.0, 1.0, 0.0, 1.0 }, { 1.0, 0.0, 0.0, 1.0 }
			};

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
				fixed lum = Luminance(main.rgb);
				int ix = (lum < 0.5) ? 0 : 1;
				half lum2 = (lum - fixed(ix) * 0.5) / 0.5;
				fixed4 result = 0;
				if (ix == 0) {
					result = colors[0] * lum2 + colors[1] * (1.0 - lum2);
				}
				if (ix == 1) {
					result = colors[1] * lum2 + colors[2] * (1.0 - lum2);
				}
				return result;
			}
			ENDCG
		}
	}

	Fallback off
}
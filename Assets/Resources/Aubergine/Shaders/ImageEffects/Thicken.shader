Shader "Hidden/Aubergine/ImageEffects/Thicken" {
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
			static const fixed2 RIGHT = float2(1.0, 0.0);
			static const fixed2 LEFT = float2(-1.0, 0.0);
			static const fixed2 DOWN = float2(0.0, 1.0);
			static const fixed2 UP = float2(0.0, -1.0);

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
				fixed3 r = tex2D(_MainTex, i.uv + RIGHT * _MainTex_TexelSize.x).rgb;
				fixed3 d = tex2D(_MainTex, i.uv + DOWN * _MainTex_TexelSize.y).rgb;
				fixed3 l = tex2D(_MainTex, i.uv + LEFT * _MainTex_TexelSize.x).rgb;
				fixed3 u = tex2D(_MainTex, i.uv + UP * _MainTex_TexelSize.y).rgb;
				main.rgb = ((main.rgb * r * d * l * u) + main.rgb) / 2.0;
				return main;
			}
			ENDCG
		}
	}

	Fallback off
}
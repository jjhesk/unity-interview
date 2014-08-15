Shader "Hidden/Aubergine/ImageEffects/Charcoal" {
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
				half xr = _MainTex_TexelSize.x * 2;
				half yr = _MainTex_TexelSize.y * 2;
				fixed4 main = tex2D(_MainTex, i.uv);
				fixed3 c0 = tex2D(_MainTex, i.uv + float2(xr, 0)).rgb;
				fixed3 c1 = tex2D(_MainTex, i.uv + float2(0, yr)).rgb;
				half f = 0;
				f += abs(main.r - c0.r);
				f += abs(main.g - c0.g);
				f += abs(main.b - c0.b);
				f += abs(main.r - c1.r);
				f += abs(main.g - c1.g);
				f += abs(main.b - c1.b);
				f -= _Strength;
				f = saturate(f);
				main.rgb = (1 - f) + _LineColor.rgb * f;
				return main;
			}
			ENDCG
		}
	}

	Fallback off
}
Shader "Hidden/Aubergine/ImageEffects/Vintage" {
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
			static const fixed3 _Layer1 = { 0.9843, 0.9490, 0.6392 };
			static const fixed3 _Layer2 = { 0.9098, 0.3960, 0.7019 };
			static const fixed3 _Layer3 = { 0.0352, 0.2862, 0.9137 };
			static const fixed3 _Factor = { 0.590, 0.205, 0.170 };

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
				fixed3 col = lerp(main.rgb, main.rgb * _Layer1, _Factor.x);
				col = lerp(col.rgb, (1.0 - ((1.0 - col.rgb) * (1.0 - _Layer2))), _Factor.y);
				col = lerp(col.rgb, (1.0 - ((1.0 - col.rgb) * (1.0 - _Layer3))), _Factor.z);
				return fixed4(col, main.a);
			}
			ENDCG
		}
	}

	Fallback off
}
Shader "Hidden/Aubergine/ImageEffects/Crosshatch" {
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
				fixed4 main = tex2D(_MainTex, i.uv);
				fixed lum = Luminance(main.rgb);
				fixed3 res = _LineColor.rgb;
				if(lum < 1.00) {
					if(fmod(i.uv.x + i.uv.y, _Strength * 2) < _Strength)
						res = fixed3(0.0, 0.0, 0.0);
				}
				if(lum < 0.75) {
					if(fmod(i.uv.x + i.uv.y, _Strength * 2) < _Strength)
						res = fixed3(0.0, 0.0, 0.0);
				}
				if(lum < 0.50) {
					if(fmod(i.uv.x + i.uv.y - _Strength, _Strength) < _Strength)
						res = fixed3(0.0, 0.0, 0.0);
				}
				if(lum < 0.25) {
					if(fmod(i.uv.x + i.uv.y - _Strength, _Strength) < _Strength)
						res = fixed3(0.0, 0.0, 0.0);
				}
				return fixed4(res, main.a);
			}
			ENDCG
		}
	}

	Fallback off
}
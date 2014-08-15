Shader "Hidden/Aubergine/ImageEffects/RadialUndistortion" {
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
			uniform float _F;
			uniform float _OX;
			uniform float _OY;
			uniform float _K1;
			uniform float _K2;

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
				float2 xy = (i.uv - float2(_OX, _OY) / _ScreenParams.xy) / float2(_F, _F);
				float r = sqrt(dot(xy, xy));
				float r2 = r * r;
				float r4 = r2 * r2;
				float coeff = (_K1 * r2 + _K2 * r4);
				
				xy = ((xy + xy * coeff.xx) * _F.xx) + float2(_OX, _OY) / _ScreenParams.xy;
				fixed4 main = tex2D(_MainTex, xy);
				return main;
			}
			ENDCG
		}
	}

	Fallback off
}
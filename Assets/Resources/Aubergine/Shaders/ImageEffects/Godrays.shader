Shader "Hidden/Aubergine/ImageEffects/Godrays" {
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
			uniform float _Intensity;
			uniform float _Gamma;
			uniform float _BlurStart;
			uniform float _BlurWidth;
			uniform float _CenterX, _CenterY;

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
				half4 blurred = 0;
				half2 center = float2(_CenterX, _CenterY);
				i.uv -= center;
				for(int j = 0; j < 32; j++) {
					float scale = _BlurStart + _BlurWidth * ((float)j / 31);
					blurred += tex2D(_MainTex, i.uv * scale + center);
				}
				blurred /= 32;
				blurred.rgb = pow(blurred.rgb, _Gamma);
				blurred.rgb *= _Intensity;
				blurred.rgb = saturate(blurred.rgb);
				fixed4 screen = tex2D(_MainTex, i.uv + center);
				half3 col = screen.rgb + (blurred.a) * blurred.rgb;
				half alpha = max(screen.a, blurred.a);
				return half4(col, alpha);
			}
			ENDCG
		}
	}

	Fallback off
}
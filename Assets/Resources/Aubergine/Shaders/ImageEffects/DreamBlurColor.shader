Shader "Hidden/Aubergine/ImageEffects/DreamBlurColor" {
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
			uniform float _BlurStrength;

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
				main.rgb += tex2D(_MainTex, i.uv + _MainTex_TexelSize.xy * _BlurStrength * 1).rgb;
				main.rgb += tex2D(_MainTex, i.uv + _MainTex_TexelSize.xy * _BlurStrength * 2).rgb;
				main.rgb += tex2D(_MainTex, i.uv + _MainTex_TexelSize.xy * _BlurStrength * 3).rgb;
				main.rgb += tex2D(_MainTex, i.uv + _MainTex_TexelSize.xy * _BlurStrength * 4).rgb;
				main.rgb += tex2D(_MainTex, i.uv + _MainTex_TexelSize.xy * _BlurStrength * 5).rgb;
				main.rgb += tex2D(_MainTex, i.uv - _MainTex_TexelSize.xy * _BlurStrength * 1).rgb;
				main.rgb += tex2D(_MainTex, i.uv - _MainTex_TexelSize.xy * _BlurStrength * 2).rgb;
				main.rgb += tex2D(_MainTex, i.uv - _MainTex_TexelSize.xy * _BlurStrength * 3).rgb;
				main.rgb += tex2D(_MainTex, i.uv - _MainTex_TexelSize.xy * _BlurStrength * 4).rgb;
				main.rgb += tex2D(_MainTex, i.uv - _MainTex_TexelSize.xy * _BlurStrength * 5).rgb;
				main.rgb /= 10;
				return main;
			}
			ENDCG
		}
	}

	Fallback off
}
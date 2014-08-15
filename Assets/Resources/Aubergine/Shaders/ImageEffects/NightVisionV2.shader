Shader "Hidden/Aubergine/ImageEffects/NightVisionV2" {
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

			uniform sampler2D _MainTex, _NoiseTex;
			uniform float4 _MainTex_TexelSize;
			uniform float _NoiseAmount, _Radius, _Fade;
			uniform float _Intensity, _Gamma;
			uniform fixed4 _VisionColor, _FadeColor;

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
				fixed3 result = 0;
				float2 nuv = i.uv;
				float2 pos = float2(0.5, 0.5);
				float distance = length(nuv - pos);
				if(distance >= _Radius)
					result = main.rgb * _FadeColor.rgb;
				else {
					fixed lum = Luminance(main.rgb);
					if(lum < _Gamma)
						main.rgb *= _Intensity;
					result = saturate(main.rgb * _VisionColor.rgb + tex2D(_NoiseTex, _NoiseAmount * (i.uv + sin(_Time.y * 50.0))).rgb * fixed3(0.0, 1.0, 0.0));
					if(distance >= _Radius - _Fade)
						result = lerp(result, _FadeColor.rgb * main.rgb, 1.0 - ((_Radius - distance) / _Fade));
				}
				return fixed4(result, main.a);
			}
			ENDCG
		}
	}
	Fallback off
}
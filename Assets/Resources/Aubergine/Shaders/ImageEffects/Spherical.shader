Shader "Hidden/Aubergine/ImageEffects/Spherical" {
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
			uniform float _Radius;

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
				float2 p = i.uv * 2.0 - 1.0;
				float rad = dot(p, p) * _Radius;
				//USE ONE OF THE BELOW FOR DIFFERENT EFFECTS
				float f = sqrt(1.0 - rad * rad);
				//float f = (1.0 - sqrt(1.0 - rad)) / rad;
				float2 nuv;
				nuv.x = (p.x * (f / 2.0)) + 0.5;
				nuv.y = (p.y * f) + 0.5;
				fixed4 main = tex2D(_MainTex, nuv);
				return main;
			}
			ENDCG
		}
	}

	Fallback off
}
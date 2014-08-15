Shader "Hidden/Aubergine/ImageEffects/StereoAnaglyph-GreenMagenta" {
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
			uniform float4x4 _MtxColor0, _MtxColor1;
			uniform float _Distance;
			static const float _Gamma = 2.2;

			struct v2f {
				float4 pos : SV_POSITION;
				half2 uv : TEXCOORD0;
			};

			v2f vert(appdata_img v) {
				v2f o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				#ifdef UNITY_HALF_TEXEL_OFFSET
					v.texcoord.y += _MainTex_TexelSize.y;
				#endif
				#if SHADER_API_D3D9
					if (_MainTex_TexelSize.y < 0)
						v.texcoord.y = 1.0 - v.texcoord.y;
				#endif
				float2 alignment = (0.5 / _ScreenParams.x, 0.5 / _ScreenParams.y);
				o.uv = MultiplyUV( UNITY_MATRIX_TEXTURE0, v.texcoord + alignment);
				return o;
			}

			fixed4 frag (v2f_img i) : COLOR {
				float2 left = i.uv; 
				float2 right = i.uv;
				if (i.uv.x < 0.5f) {
					left = i.uv;
					right = i.uv + float2(_Distance, 0.0f);
				}
				if (i.uv.x >= 0.5f) {
					right = i.uv;
					left = i.uv - float2(_Distance, 0.0f);
				}
				//Gamma fix
				fixed4 leftCol = tex2D(_MainTex, left);
				leftCol = pow(leftCol, 0.9 / _Gamma);
				//Gamma fix
				fixed4 rightCol = tex2D(_MainTex, right);
				rightCol = pow(rightCol, 1.25 / _Gamma);
				fixed4 main = mul(leftCol, _MtxColor0) + mul(rightCol, _MtxColor1);
				return fixed4(main.rgb, 1.0);
			}
			ENDCG
		}
	}

	Fallback off
}
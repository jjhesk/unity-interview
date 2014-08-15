//Hard Surface Shader Package, Written for the Unity engine by Bruno Rime: http://www.behance.net/brunorime brunorime@gmail.com
Shader "HardSurface/Hardsurface Free/Cut Out/Specular"{

Properties {
	_Color ("Main Color", Color) = (1,1,1,1)
	_SpecColor ("Specular Color", Color) = (1, 1, 1, 1)
	_Shininess ("Shininess", Range (0.01, 3)) = 1.5
	_Gloss("Gloss", Range (0.00, 1)) = .5
	_Reflection("Reflection", Range (0.00, 1)) = 0.5
	_Cube ("Reflection Cubemap", Cube) = "Black" { TexGen CubeReflect }
	_FrezPow("Fresnel Reflection",Range(0,2)) = .25
	_FrezFalloff("Fresnal/EdgeAlpha Falloff",Range(0,10)) = 4
	_Metalics("Metalics",Range(0,1)) = .5
	_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
	
	_MainTex ("Diffuse(RGB) Alpha(A)",2D) = "White" {}
	_BumpMap ("Normalmap", 2D) = "Bump" {}
	_Spec_Gloss_Reflec_Masks ("Spec(R) Gloss(G) Reflec(B)",2D) = "White" {}

	
}

	SubShader {
		
		
		// Zprime Front Faces
		Pass {
		Tags {"Queue" = "Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" "LightMode" = "Always"}
			zwrite on Cull back
			colormask 0
			Lighting Off
			Alphatest Greater [_Cutoff]
			SetTexture [_MainTex] { combine texture }
		} 

		// Front Faces
		Tags {"Queue" = "Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
		UsePass "Hidden/Hardsurface Pro Front Cut Out Specular/FORWARD"
	} 
	//FallBack "Transparent/Cutout/VertexLit"
}

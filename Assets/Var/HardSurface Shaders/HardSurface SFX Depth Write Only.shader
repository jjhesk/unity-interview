Shader "HardSurface/SFX/Depth Write Only "{

	SubShader {
		
		Tags {"Queue"="Geometry+250" "RenderType"="Opaque" "IgnoreProjector"="False" }
	Zwrite off
	colormask 0
	Pass {
		Lighting Off
		SetTexture [_Color] { combine texture } 
	}
		
	} 
	
	}

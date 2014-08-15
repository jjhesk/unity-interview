//Hard Surface Shader Package, Written for the Unity engine by Bruno Rime: http://www.behance.net/brunorime brunorime@gmail.com
Shader "Hidden/Hardsurface Pro Front Opaque"{

SubShader { // Shader Model 3

	// Front Faces pass
	
	//Tags {"Queue"="Geometry" "RenderType"="Opaque" "IgnoreProjector"="False" }
	 zwrite on Cull Back Ztest Lequal
	 Blend off
	 colormask RGBA
	
		
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardBase" }
Program "vp" {
// Vertex combos: 6
//   opengl - ALU: 33 to 94
//   d3d9 - ALU: 34 to 96
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
"3.0-!!ARBvp1.0
# 57 ALU
PARAM c[23] = { { 1 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[13].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[21];
DP4 R3.x, R1, c[19];
DP4 R3.y, R1, c[20];
MOV R1.xyz, vertex.attrib[14];
MAD R0.w, R0.x, R0.x, -R0.y;
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.w, c[22];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[5].xyz, R2, R3;
MUL R2.xyz, vertex.attrib[14].w, R0;
MOV R0.w, c[0].x;
MOV R0.xyz, c[14];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MAD R3.xyz, R1, c[13].w, -vertex.position;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[13].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[3].y, R2, R3;
DP3 result.texcoord[4].y, R2, R1;
MUL result.texcoord[2], R0, c[13].w;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R1;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 57 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
"vs_3_0
; 60 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c22, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r1.xyz, v2, c12.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c22.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.y, r2.w, r2.w
mad r0.w, r0.x, r0.x, -r0.y
dp4 r3.z, r1, c20
dp4 r3.y, r1, c19
dp4 r3.x, r1, c18
add r2.xyz, r2, r3
mul r3.xyz, r0.w, c21
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
add o6.xyz, r2, r3
mul r2.xyz, v1.w, r0
mov r0.w, c22.x
mov r0.xyz, c13
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
mad r3.xyz, r1, c12.w, -v0
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
dp4 r4.y, c14, r0
mov r1, c8
dp4 r4.x, c14, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o4.y, r2, r3
dp3 o5.y, r2, r4
mul o3, r0, c12.w
dp3 o4.z, v2, r3
dp3 o4.x, v1, r3
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  mat3 tmpvar_19;
  tmpvar_19[0] = _Object2World[0].xyz;
  tmpvar_19[1] = _Object2World[1].xyz;
  tmpvar_19[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = (tmpvar_19 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_23;
  mediump vec4 normal;
  normal = tmpvar_22;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAr, normal);
  x1.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAg, normal);
  x1.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAb, normal);
  x1.z = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBr, tmpvar_27);
  x2.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBg, tmpvar_27);
  x2.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBb, tmpvar_27);
  x2.z = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_31;
  highp vec3 tmpvar_32;
  tmpvar_32 = (unity_SHC.xyz * vC);
  x3 = tmpvar_32;
  tmpvar_23 = ((x1 + x2) + x3);
  shlight = tmpvar_23;
  tmpvar_7 = shlight;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (tmpvar_12 * (((_World2Object * tmpvar_21).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
}



#endif
#ifdef FRAGMENT

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform lowp float _Metalics;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_16);
  lowp float tmpvar_18;
  tmpvar_18 = (_Gloss + tmpvar_14);
  lowp float tmpvar_19;
  tmpvar_19 = min ((xlat_mutable__Color.w + tmpvar_17), 1.0);
  lowp vec3 tmpvar_20;
  tmpvar_20 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD3);
  lowp vec3 viewDir;
  viewDir = tmpvar_21;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_22;
  tmpvar_22 = dot (vec3(0.0, 0.0, 1.0), xlv_TEXCOORD4);
  lowp float tmpvar_23;
  tmpvar_23 = max (tmpvar_22, (abs (tmpvar_22) * (1.0 - tmpvar_19)));
  lowp float tmpvar_24;
  tmpvar_24 = dot (vec3(0.0, 0.0, 1.0), normalize ((xlv_TEXCOORD4 + viewDir)));
  nh = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, nh);
  nh = tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = (pow (tmpvar_25, (_Shininess * 128.0)) * tmpvar_18);
  mediump vec3 tmpvar_27;
  tmpvar_27 = ((((tmpvar_20 * _LightColor0.xyz) * tmpvar_23) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_26)) * 2.0);
  c_i0_i1.xyz = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = (tmpvar_19 + ((_LightColor0.w * _SpecColor.w) * tmpvar_26));
  c_i0_i1.w = tmpvar_28;
  c = c_i0_i1;
  c.xyz = (c_i0_i1.xyz + (tmpvar_20 * xlv_TEXCOORD5));
  c.xyz = (c.xyz + mix (CubeTex, (CubeTex * xlat_mutable__Color.xyz), vec3(((1.0 - tmpvar_17) * _Metalics))));
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_LightmapST]
"3.0-!!ARBvp1.0
# 33 ALU
PARAM c[17] = { { 1 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1.xyz, c[14];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MUL R1.xyz, vertex.attrib[14].w, R0;
MAD R2.xyz, R2, c[13].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[13].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[3].y, R1, R2;
MUL result.texcoord[2], R0, c[13].w;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 33 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 14 [unity_LightmapST]
"vs_3_0
; 34 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c15, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mov r1.xyz, c13
mov r1.w, c15.x
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mul r1.xyz, v1.w, r0
mad r2.xyz, r2, c12.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c12.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c12.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o4.y, r1, r2
mul o3, r0, c12.w
dp3 o4.z, v2, r2
dp3 o4.x, v1, r2
mad o5.xy, v3, c14, c14.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * -((((_World2Object * tmpvar_6).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_11;
  tmpvar_11.xyz = (tmpvar_10 * v_i0_i1.xyz);
  tmpvar_11.w = tmpvar_8.x;
  highp vec4 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * unity_Scale.w);
  tmpvar_3 = tmpvar_12;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_10 * v_i0_i1_i2.xyz);
  tmpvar_13.w = tmpvar_8.y;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_4 = tmpvar_14;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_10 * v_i0_i1_i2_i3.xyz);
  tmpvar_15.w = tmpvar_8.z;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_5 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (tmpvar_10 * (((_World2Object * tmpvar_17).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform sampler2D unity_Lightmap;
uniform lowp float _Metalics;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_16);
  c = vec4(0.0, 0.0, 0.0, 0.0);
  c.xyz = ((xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0))) * (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz));
  c.w = min ((xlat_mutable__Color.w + tmpvar_17), 1.0);
  c.xyz = (c.xyz + mix (CubeTex, (CubeTex * xlat_mutable__Color.xyz), vec3(((1.0 - tmpvar_17) * _Metalics))));
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
"3.0-!!ARBvp1.0
# 63 ALU
PARAM c[24] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[14].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[19];
DP4 R2.y, R0, c[18];
DP4 R2.x, R0, c[17];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[22];
DP4 R3.x, R1, c[20];
DP4 R3.y, R1, c[21];
MOV R1.xyz, vertex.attrib[14];
MAD R0.w, R0.x, R0.x, -R0.y;
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.w, c[23];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[5].xyz, R2, R3;
MUL R2.xyz, vertex.attrib[14].w, R0;
MOV R0.w, c[0].x;
MOV R0.xyz, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MAD R3.xyz, R1, c[14].w, -vertex.position;
MOV R0, c[16];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP4 R1.z, R0, c[11];
DP3 result.texcoord[4].y, R2, R1;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[14].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[14].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[4].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[3].y, R2, R3;
MUL R2.xyz, R0.xyww, c[0].y;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
ADD result.texcoord[6].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[6].zw, R0;
END
# 63 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
"vs_3_0
; 65 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c24, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r1.xyz, v2, c14.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c24.x
dp4 r2.z, r0, c19
dp4 r2.y, r0, c18
dp4 r2.x, r0, c17
mul r0.y, r2.w, r2.w
mad r0.w, r0.x, r0.x, -r0.y
dp4 r3.z, r1, c22
dp4 r3.y, r1, c21
dp4 r3.x, r1, c20
add r2.xyz, r2, r3
mul r3.xyz, r0.w, c23
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
add o6.xyz, r2, r3
mul r2.xyz, v1.w, r0
mov r0.w, c24.x
mov r0.xyz, c15
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
mad r3.xyz, r1, c14.w, -v0
mov r0, c10
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1, c8
dp4 r4.x, c16, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o3, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c24.y
mul r1.y, r1, c12.x
dp3 o4.y, r2, r3
dp3 o5.y, r2, r4
dp3 o4.z, v2, r3
dp3 o4.x, v1, r3
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
mad o7.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o7.zw, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_3 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_4 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_5 = tmpvar_19;
  mat3 tmpvar_20;
  tmpvar_20[0] = _Object2World[0].xyz;
  tmpvar_20[1] = _Object2World[1].xyz;
  tmpvar_20[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_13 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (tmpvar_20 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_24;
  mediump vec4 normal;
  normal = tmpvar_23;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAr, normal);
  x1.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAg, normal);
  x1.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHAb, normal);
  x1.z = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBr, tmpvar_28);
  x2.x = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBg, tmpvar_28);
  x2.y = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = dot (unity_SHBb, tmpvar_28);
  x2.z = tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_SHC.xyz * vC);
  x3 = tmpvar_33;
  tmpvar_24 = ((x1 + x2) + x3);
  shlight = tmpvar_24;
  tmpvar_7 = shlight;
  highp vec4 o_i0;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_8 * 0.5);
  o_i0 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35.x = tmpvar_34.x;
  tmpvar_35.y = (tmpvar_34.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_35 + tmpvar_34.w);
  o_i0.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (tmpvar_13 * (((_World2Object * tmpvar_22).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _ShadowMapTexture;
uniform lowp float _Metalics;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_16);
  lowp float tmpvar_18;
  tmpvar_18 = (_Gloss + tmpvar_14);
  lowp float tmpvar_19;
  tmpvar_19 = min ((xlat_mutable__Color.w + tmpvar_17), 1.0);
  lowp vec3 tmpvar_20;
  tmpvar_20 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  lowp float tmpvar_21;
  tmpvar_21 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize (xlv_TEXCOORD3);
  lowp vec3 viewDir;
  viewDir = tmpvar_22;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_23;
  tmpvar_23 = dot (vec3(0.0, 0.0, 1.0), xlv_TEXCOORD4);
  lowp float tmpvar_24;
  tmpvar_24 = max (tmpvar_23, (abs (tmpvar_23) * (1.0 - tmpvar_19)));
  lowp float tmpvar_25;
  tmpvar_25 = dot (vec3(0.0, 0.0, 1.0), normalize ((xlv_TEXCOORD4 + viewDir)));
  nh = tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = max (0.0, nh);
  nh = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = (pow (tmpvar_26, (_Shininess * 128.0)) * tmpvar_18);
  mediump vec3 tmpvar_28;
  tmpvar_28 = ((((tmpvar_20 * _LightColor0.xyz) * tmpvar_24) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_27)) * (tmpvar_21 * 2.0));
  c_i0_i1.xyz = tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = (tmpvar_19 + (((_LightColor0.w * _SpecColor.w) * tmpvar_27) * tmpvar_21));
  c_i0_i1.w = tmpvar_29;
  c = c_i0_i1;
  c.xyz = (c_i0_i1.xyz + (tmpvar_20 * xlv_TEXCOORD5));
  c.xyz = (c.xyz + mix (CubeTex, (CubeTex * xlat_mutable__Color.xyz), vec3(((1.0 - tmpvar_17) * _Metalics))));
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_LightmapST]
"3.0-!!ARBvp1.0
# 38 ALU
PARAM c[18] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1.xyz, c[15];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MUL R1.xyz, vertex.attrib[14].w, R0;
MAD R2.xyz, R2, c[14].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[14].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[14].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[3].y, R1, R2;
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
ADD result.texcoord[6].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[6].zw, R0;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[17], c[17].zwzw;
END
# 38 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 16 [unity_LightmapST]
"vs_3_0
; 39 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord6 o6
def c17, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mov r1.xyz, c15
mov r1.w, c17.x
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mul r1.xyz, v1.w, r0
mad r2.xyz, r2, c14.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c14.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c14.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o3, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
dp3 o4.y, r1, r2
mul r1.xyz, r0.xyww, c17.y
mul r1.y, r1, c12.x
dp3 o4.z, v2, r2
dp3 o4.x, v1, r2
mad o6.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o6.zw, r0
mad o5.xy, v3, c16, c16.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * -((((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_10;
  tmpvar_10[0] = tmpvar_1.xyz;
  tmpvar_10[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_10[2] = tmpvar_2;
  mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_10[0].x;
  tmpvar_11[0].y = tmpvar_10[1].x;
  tmpvar_11[0].z = tmpvar_10[2].x;
  tmpvar_11[1].x = tmpvar_10[0].y;
  tmpvar_11[1].y = tmpvar_10[1].y;
  tmpvar_11[1].z = tmpvar_10[2].y;
  tmpvar_11[2].x = tmpvar_10[0].z;
  tmpvar_11[2].y = tmpvar_10[1].z;
  tmpvar_11[2].z = tmpvar_10[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_12;
  tmpvar_12.xyz = (tmpvar_11 * v_i0_i1.xyz);
  tmpvar_12.w = tmpvar_9.x;
  highp vec4 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * unity_Scale.w);
  tmpvar_3 = tmpvar_13;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_11 * v_i0_i1_i2.xyz);
  tmpvar_14.w = tmpvar_9.y;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_11 * v_i0_i1_i2_i3.xyz);
  tmpvar_16.w = tmpvar_9.z;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = _WorldSpaceCameraPos;
  highp vec4 o_i0;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_6 * 0.5);
  o_i0 = tmpvar_19;
  highp vec2 tmpvar_20;
  tmpvar_20.x = tmpvar_19.x;
  tmpvar_20.y = (tmpvar_19.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_20 + tmpvar_19.w);
  o_i0.zw = tmpvar_6.zw;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (tmpvar_11 * (((_World2Object * tmpvar_18).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform sampler2D unity_Lightmap;
uniform sampler2D _ShadowMapTexture;
uniform lowp float _Metalics;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_16);
  c = vec4(0.0, 0.0, 0.0, 0.0);
  c.xyz = ((xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0))) * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz), vec3((texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x * 2.0))));
  c.w = min ((xlat_mutable__Color.w + tmpvar_17), 1.0);
  c.xyz = (c.xyz + mix (CubeTex, (CubeTex * xlat_mutable__Color.xyz), vec3(((1.0 - tmpvar_17) * _Metalics))));
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
"3.0-!!ARBvp1.0
# 88 ALU
PARAM c[31] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..30] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[13].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[17];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[16];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[18];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[19];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
DP4 R2.z, R4, c[26];
DP4 R2.y, R4, c[25];
DP4 R2.x, R4, c[24];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[21];
MAD R1.xyz, R0.x, c[20], R1;
MAD R0.xyz, R0.z, c[22], R1;
MUL R1, R4.xyzz, R4.yzzx;
MAD R0.xyz, R0.w, c[23], R0;
MUL R0.w, R3, R3;
MAD R0.w, R4.x, R4.x, -R0;
MUL R4.xyz, R0.w, c[30];
MOV R0.w, c[0].x;
DP4 R3.z, R1, c[29];
DP4 R3.y, R1, c[28];
DP4 R3.x, R1, c[27];
ADD R1.xyz, R2, R3;
ADD R1.xyz, R1, R4;
ADD result.texcoord[5].xyz, R1, R0;
MOV R0.xyz, c[14];
MOV R2.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R2.yzxw;
MAD R2.xyz, vertex.normal.yzxw, R2.zxyw, -R3;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MAD R3.xyz, R1, c[13].w, -vertex.position;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[13].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[3].y, R2, R3;
DP3 result.texcoord[4].y, R2, R1;
MUL result.texcoord[2], R0, c[13].w;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R1;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 88 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
"vs_3_0
; 91 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c30, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r3.xyz, v2, c12.w
dp4 r0.x, v0, c5
add r1, -r0.x, c16
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c15
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c30.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c17
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c18
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c30.x
dp4 r2.z, r4, c25
dp4 r2.y, r4, c24
dp4 r2.x, r4, c23
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c30.y
mul r0, r0, r1
mul r1.xyz, r0.y, c20
mad r1.xyz, r0.x, c19, r1
mad r0.xyz, r0.z, c21, r1
mad r1.xyz, r0.w, c22, r0
mul r0, r4.xyzz, r4.yzzx
dp4 r3.z, r0, c28
dp4 r3.y, r0, c27
dp4 r3.x, r0, c26
mul r1.w, r3, r3
mad r0.x, r4, r4, -r1.w
add r2.xyz, r2, r3
mul r3.xyz, r0.x, c29
add r3.xyz, r2, r3
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mul r2.xyz, v1.w, r0
add o6.xyz, r3, r1
mov r0.w, c30.x
mov r0.xyz, c13
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
mad r3.xyz, r1, c12.w, -v0
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
dp4 r4.y, c14, r0
mov r1, c8
dp4 r4.x, c14, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o4.y, r2, r3
dp3 o5.y, r2, r4
mul o3, r0, c12.w
dp3 o4.z, v2, r3
dp3 o4.x, v1, r3
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec3 unity_LightColor3;
uniform highp vec3 unity_LightColor2;
uniform highp vec3 unity_LightColor1;
uniform highp vec3 unity_LightColor0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  mat3 tmpvar_19;
  tmpvar_19[0] = _Object2World[0].xyz;
  tmpvar_19[1] = _Object2World[1].xyz;
  tmpvar_19[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_20;
  mediump vec3 tmpvar_24;
  mediump vec4 normal;
  normal = tmpvar_23;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAr, normal);
  x1.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAg, normal);
  x1.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHAb, normal);
  x1.z = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBr, tmpvar_28);
  x2.x = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBg, tmpvar_28);
  x2.y = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = dot (unity_SHBb, tmpvar_28);
  x2.z = tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_SHC.xyz * vC);
  x3 = tmpvar_33;
  tmpvar_24 = ((x1 + x2) + x3);
  shlight = tmpvar_24;
  tmpvar_7 = shlight;
  highp vec3 tmpvar_34;
  tmpvar_34 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosX0 - tmpvar_34.x);
  highp vec4 tmpvar_36;
  tmpvar_36 = (unity_4LightPosY0 - tmpvar_34.y);
  highp vec4 tmpvar_37;
  tmpvar_37 = (unity_4LightPosZ0 - tmpvar_34.z);
  highp vec4 tmpvar_38;
  tmpvar_38 = (((tmpvar_35 * tmpvar_35) + (tmpvar_36 * tmpvar_36)) + (tmpvar_37 * tmpvar_37));
  highp vec4 tmpvar_39;
  tmpvar_39 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_35 * tmpvar_20.x) + (tmpvar_36 * tmpvar_20.y)) + (tmpvar_37 * tmpvar_20.z)) * inversesqrt (tmpvar_38))) * 1.0/((1.0 + (tmpvar_38 * unity_4LightAtten0))));
  highp vec3 tmpvar_40;
  tmpvar_40 = (tmpvar_7 + ((((unity_LightColor0 * tmpvar_39.x) + (unity_LightColor1 * tmpvar_39.y)) + (unity_LightColor2 * tmpvar_39.z)) + (unity_LightColor3 * tmpvar_39.w)));
  tmpvar_7 = tmpvar_40;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (tmpvar_12 * (((_World2Object * tmpvar_22).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
}



#endif
#ifdef FRAGMENT

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform lowp float _Metalics;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_16);
  lowp float tmpvar_18;
  tmpvar_18 = (_Gloss + tmpvar_14);
  lowp float tmpvar_19;
  tmpvar_19 = min ((xlat_mutable__Color.w + tmpvar_17), 1.0);
  lowp vec3 tmpvar_20;
  tmpvar_20 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD3);
  lowp vec3 viewDir;
  viewDir = tmpvar_21;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_22;
  tmpvar_22 = dot (vec3(0.0, 0.0, 1.0), xlv_TEXCOORD4);
  lowp float tmpvar_23;
  tmpvar_23 = max (tmpvar_22, (abs (tmpvar_22) * (1.0 - tmpvar_19)));
  lowp float tmpvar_24;
  tmpvar_24 = dot (vec3(0.0, 0.0, 1.0), normalize ((xlv_TEXCOORD4 + viewDir)));
  nh = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, nh);
  nh = tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = (pow (tmpvar_25, (_Shininess * 128.0)) * tmpvar_18);
  mediump vec3 tmpvar_27;
  tmpvar_27 = ((((tmpvar_20 * _LightColor0.xyz) * tmpvar_23) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_26)) * 2.0);
  c_i0_i1.xyz = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = (tmpvar_19 + ((_LightColor0.w * _SpecColor.w) * tmpvar_26));
  c_i0_i1.w = tmpvar_28;
  c = c_i0_i1;
  c.xyz = (c_i0_i1.xyz + (tmpvar_20 * xlv_TEXCOORD5));
  c.xyz = (c.xyz + mix (CubeTex, (CubeTex * xlat_mutable__Color.xyz), vec3(((1.0 - tmpvar_17) * _Metalics))));
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
"3.0-!!ARBvp1.0
# 94 ALU
PARAM c[32] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..31] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[14].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[18];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[17];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[19];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[20];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
DP4 R2.z, R4, c[27];
DP4 R2.y, R4, c[26];
DP4 R2.x, R4, c[25];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[22];
MAD R1.xyz, R0.x, c[21], R1;
MAD R0.xyz, R0.z, c[23], R1;
MUL R1, R4.xyzz, R4.yzzx;
MAD R0.xyz, R0.w, c[24], R0;
MUL R0.w, R3, R3;
MAD R0.w, R4.x, R4.x, -R0;
MUL R4.xyz, R0.w, c[31];
MOV R0.w, c[0].x;
DP4 R3.z, R1, c[30];
DP4 R3.y, R1, c[29];
DP4 R3.x, R1, c[28];
ADD R1.xyz, R2, R3;
ADD R1.xyz, R1, R4;
ADD result.texcoord[5].xyz, R1, R0;
MOV R0.xyz, c[15];
MOV R2.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R2.yzxw;
MAD R2.xyz, vertex.normal.yzxw, R2.zxyw, -R3;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MAD R3.xyz, R1, c[14].w, -vertex.position;
MOV R0, c[16];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP4 R1.z, R0, c[11];
DP3 result.texcoord[4].y, R2, R1;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[14].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[14].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[4].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[3].y, R2, R3;
MUL R2.xyz, R0.xyww, c[0].z;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
ADD result.texcoord[6].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[6].zw, R0;
END
# 94 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
"vs_3_0
; 96 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c32, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r3.xyz, v2, c14.w
dp4 r0.x, v0, c5
add r1, -r0.x, c18
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c17
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c32.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c19
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c20
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c32.x
dp4 r2.z, r4, c27
dp4 r2.y, r4, c26
dp4 r2.x, r4, c25
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c32.y
mul r0, r0, r1
mul r1.xyz, r0.y, c22
mad r1.xyz, r0.x, c21, r1
mad r0.xyz, r0.z, c23, r1
mad r1.xyz, r0.w, c24, r0
mul r0, r4.xyzz, r4.yzzx
dp4 r3.z, r0, c30
dp4 r3.y, r0, c29
dp4 r3.x, r0, c28
mul r1.w, r3, r3
mad r0.x, r4, r4, -r1.w
add r2.xyz, r2, r3
mul r3.xyz, r0.x, c31
add r3.xyz, r2, r3
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mul r2.xyz, v1.w, r0
add o6.xyz, r3, r1
mov r0.w, c32.x
mov r0.xyz, c15
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
mad r3.xyz, r1, c14.w, -v0
mov r0, c10
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1, c8
dp4 r4.x, c16, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o3, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c32.z
mul r1.y, r1, c12.x
dp3 o4.y, r2, r3
dp3 o5.y, r2, r4
dp3 o4.z, v2, r3
dp3 o4.x, v1, r3
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
mad o7.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o7.zw, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec3 unity_LightColor3;
uniform highp vec3 unity_LightColor2;
uniform highp vec3 unity_LightColor1;
uniform highp vec3 unity_LightColor0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_3 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_4 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_5 = tmpvar_19;
  mat3 tmpvar_20;
  tmpvar_20[0] = _Object2World[0].xyz;
  tmpvar_20[1] = _Object2World[1].xyz;
  tmpvar_20[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_20 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_13 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = tmpvar_21;
  mediump vec3 tmpvar_25;
  mediump vec4 normal;
  normal = tmpvar_24;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAr, normal);
  x1.x = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHAg, normal);
  x1.y = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHAb, normal);
  x1.z = tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBr, tmpvar_29);
  x2.x = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = dot (unity_SHBg, tmpvar_29);
  x2.y = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = dot (unity_SHBb, tmpvar_29);
  x2.z = tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = (unity_SHC.xyz * vC);
  x3 = tmpvar_34;
  tmpvar_25 = ((x1 + x2) + x3);
  shlight = tmpvar_25;
  tmpvar_7 = shlight;
  highp vec3 tmpvar_35;
  tmpvar_35 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_36;
  tmpvar_36 = (unity_4LightPosX0 - tmpvar_35.x);
  highp vec4 tmpvar_37;
  tmpvar_37 = (unity_4LightPosY0 - tmpvar_35.y);
  highp vec4 tmpvar_38;
  tmpvar_38 = (unity_4LightPosZ0 - tmpvar_35.z);
  highp vec4 tmpvar_39;
  tmpvar_39 = (((tmpvar_36 * tmpvar_36) + (tmpvar_37 * tmpvar_37)) + (tmpvar_38 * tmpvar_38));
  highp vec4 tmpvar_40;
  tmpvar_40 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_36 * tmpvar_21.x) + (tmpvar_37 * tmpvar_21.y)) + (tmpvar_38 * tmpvar_21.z)) * inversesqrt (tmpvar_39))) * 1.0/((1.0 + (tmpvar_39 * unity_4LightAtten0))));
  highp vec3 tmpvar_41;
  tmpvar_41 = (tmpvar_7 + ((((unity_LightColor0 * tmpvar_40.x) + (unity_LightColor1 * tmpvar_40.y)) + (unity_LightColor2 * tmpvar_40.z)) + (unity_LightColor3 * tmpvar_40.w)));
  tmpvar_7 = tmpvar_41;
  highp vec4 o_i0;
  highp vec4 tmpvar_42;
  tmpvar_42 = (tmpvar_8 * 0.5);
  o_i0 = tmpvar_42;
  highp vec2 tmpvar_43;
  tmpvar_43.x = tmpvar_42.x;
  tmpvar_43.y = (tmpvar_42.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_43 + tmpvar_42.w);
  o_i0.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (tmpvar_13 * (((_World2Object * tmpvar_23).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _ShadowMapTexture;
uniform lowp float _Metalics;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_16);
  lowp float tmpvar_18;
  tmpvar_18 = (_Gloss + tmpvar_14);
  lowp float tmpvar_19;
  tmpvar_19 = min ((xlat_mutable__Color.w + tmpvar_17), 1.0);
  lowp vec3 tmpvar_20;
  tmpvar_20 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  lowp float tmpvar_21;
  tmpvar_21 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize (xlv_TEXCOORD3);
  lowp vec3 viewDir;
  viewDir = tmpvar_22;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_23;
  tmpvar_23 = dot (vec3(0.0, 0.0, 1.0), xlv_TEXCOORD4);
  lowp float tmpvar_24;
  tmpvar_24 = max (tmpvar_23, (abs (tmpvar_23) * (1.0 - tmpvar_19)));
  lowp float tmpvar_25;
  tmpvar_25 = dot (vec3(0.0, 0.0, 1.0), normalize ((xlv_TEXCOORD4 + viewDir)));
  nh = tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = max (0.0, nh);
  nh = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = (pow (tmpvar_26, (_Shininess * 128.0)) * tmpvar_18);
  mediump vec3 tmpvar_28;
  tmpvar_28 = ((((tmpvar_20 * _LightColor0.xyz) * tmpvar_24) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_27)) * (tmpvar_21 * 2.0));
  c_i0_i1.xyz = tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = (tmpvar_19 + (((_LightColor0.w * _SpecColor.w) * tmpvar_27) * tmpvar_21));
  c_i0_i1.w = tmpvar_29;
  c = c_i0_i1;
  c.xyz = (c_i0_i1.xyz + (tmpvar_20 * xlv_TEXCOORD5));
  c.xyz = (c.xyz + mix (CubeTex, (CubeTex * xlat_mutable__Color.xyz), vec3(((1.0 - tmpvar_17) * _Metalics))));
  gl_FragData[0] = c;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 4
//   opengl - ALU: 37 to 63, TEX: 1 to 3
//   d3d9 - ALU: 41 to 72, TEX: 2 to 4
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
Float 9 [_Metalics]
SetTexture 0 [_Cube] CUBE
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 60 ALU, 1 TEX
PARAM c[12] = { program.local[0..9],
		{ 2, 1, 0, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R3.zw, c[10].xyyw;
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[10].x, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[10].y;
POW R0.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R2.x, R0.w, c[7], R1;
MUL R0.xyz, R2.x, R0;
DP3_SAT R1.x, R0, c[11];
MUL R1.y, R1.x, R1.x;
MAD R1.x, -R0.w, c[2], R3.z;
MAD R1.x, R1, c[3].w, R1.y;
ADD R2.y, -R1, c[10];
MIN R1.w, R1.x, c[10].y;
MAD R1.xyz, R0, c[3], -R0;
MUL R2.y, R2, c[9].x;
MAD R3.xyz, R2.y, R1, R0;
MOV_SAT R0.x, R2;
ADD R0.x, -R0, c[10].y;
DP3 R2.x, fragment.texcoord[3], fragment.texcoord[3];
MUL R1.xyz, R0.x, c[3];
ADD R0.z, -R1.w, c[10].y;
ABS R0.y, fragment.texcoord[4].z;
MUL R0.y, R0, R0.z;
MAX R2.w, fragment.texcoord[4].z, R0.y;
RSQ R2.x, R2.x;
MOV R0.xyz, fragment.texcoord[4];
MAD R0.xyz, R2.x, fragment.texcoord[3], R0;
DP3 R0.x, R0, R0;
MUL R2.xyz, R1, fragment.texcoord[5];
MOV R0.y, c[5].x;
MAD R4.x, R0.w, c[7], R0.y;
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R0.y, R3.w, c[4].x;
MAX R0.x, R0, c[10].z;
POW R3.w, R0.x, R0.y;
MOV R0, c[1];
MUL R3.w, R3, R4.x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, c[0];
MUL R0.xyz, R0, R3.w;
MUL R1.xyz, R1, c[0];
MAD R0.xyz, R1, R2.w, R0;
MAD R0.xyz, R0, c[10].x, R2;
ADD result.color.xyz, R0, R3;
MAD result.color.w, R3, R0, R1;
END
# 60 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
Float 9 [_Metalics]
SetTexture 0 [_Cube] CUBE
"ps_3_0
; 70 ALU, 2 TEX
dcl_cube s0
def c10, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c11, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c10.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c10, -r0
mul_pp r1.w, r0.y, c10.z
add_pp r2.x, -r0, c10.y
pow_pp r0, r2.x, c8.x
texldl r1.xyz, r1, s0
mov_pp r3.x, r0
mov_pp r0.y, c6.x
mad_pp r0.w, r3.x, c7.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r1.y, r0, c11
mad_pp r2.x, -r1.y, r1.y, c10.y
mov_pp r1.x, c10.y
mov_pp_sat r0.w, r0
mul_pp r1.z, r1.y, r1.y
mad_pp r1.x, -r3, c2, r1
mad_pp r1.x, r1, c3.w, r1.z
min_pp r1.w, r1.x, c10.y
add_pp r1.z, -r1.w, c10.y
abs_pp r1.x, v4.z
mul_pp r2.w, r1.x, r1.z
mad_pp r1.xyz, r0, c3, -r0
mul_pp r2.x, r2, c9
mad_pp r2.xyz, r2.x, r1, r0
dp3_pp r1.x, v3, v3
max_pp r2.w, v4.z, r2
rsq_pp r1.x, r1.x
mov_pp r0.xyz, v4
mad_pp r0.xyz, r1.x, v3, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c10.y
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r1.xyz, r0.w, c3
mul_pp r3.z, c11.w, r0.y
max_pp r3.y, r0.x, c10.w
pow_pp r0, r3.y, r3.z
mov_pp r0.y, c5.x
mad_pp r3.x, r3, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r3.x
mul_pp r0.xyz, c1, r0
mul_pp r3.xyz, r0, r0.w
mul_pp r0.xyz, r1, c0
mad_pp r0.xyz, r0, r2.w, r3
mul_pp r1.xyz, r1, v5
mad_pp r0.xyz, r0, c10.x, r1
mov_pp r2.w, c0
mul_pp r1.x, c1.w, r2.w
add_pp oC0.xyz, r0, r2
mad_pp oC0.w, r0, r1.x, r1
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [unity_Lightmap] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 37 ALU, 2 TEX
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 8 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[6].x, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R1.x, -R0.w, c[6].y;
POW R1.w, R1.x, c[4].x;
MOV R0.w, c[2].x;
MAD R0.w, R1, c[3].x, R0;
MUL R0.xyz, R0.w, R0;
DP3_SAT R1.x, R0, c[7];
MUL R2.x, R1, R1;
ADD R1.x, -R2, c[6].y;
MUL R2.z, R1.x, c[5].x;
MAD R1.xyz, R0, c[1], -R0;
MAD R0.xyz, R2.z, R1, R0;
MOV R2.y, c[6];
MAD R1.x, -R1.w, c[0], R2.y;
MOV_SAT R1.y, R0.w;
MAD R0.w, R1.x, c[1], R2.x;
ADD R2.x, -R1.y, c[6].y;
TEX R1, fragment.texcoord[4], texture[1], 2D;
MUL R2.xyz, R2.x, c[1];
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, R2;
MAD result.color.xyz, R1, c[6].z, R0;
MIN result.color.w, R0, c[6].y;
END
# 37 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Shininess]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
Float 6 [_Metalics]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [unity_Lightmap] 2D
"ps_3_0
; 41 ALU, 3 TEX
dcl_cube s0
dcl_2d s1
def c7, 2.00000000, 1.00000000, 6.00000000, 8.00000000
def c8, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord4 v3.xy
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c7.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c2.x
add_pp r0.y, c7, -r0
mul_pp r1.w, r0.y, c7.z
add_pp r2.x, -r0, c7.y
pow_pp r0, r2.x, c5.x
texldl r1.xyz, r1, s0
mov_pp r1.w, r0.x
mov_pp r0.y, c3.x
mad_pp r0.w, r1, c4.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r2.w, r0, c8
mad_pp r2.x, -r2.w, r2.w, c7.y
mad_pp r1.xyz, r0, c1, -r0
mul_pp r2.x, r2, c6
mad_pp r2.xyz, r2.x, r1, r0
mov_pp_sat r0.x, r0.w
add_pp r1.x, -r0, c7.y
mov_pp r0.y, c7
mad_pp r0.y, -r1.w, c0.x, r0
mul_pp r0.z, r2.w, r2.w
mad_pp r1.w, r0.y, c1, r0.z
texld r0, v3, s1
mul_pp r1.xyz, r1.x, c1
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, r1
mad_pp oC0.xyz, r0, c7.w, r2
min_pp oC0.w, r1, c7.y
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
Float 9 [_Metalics]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 63 ALU, 2 TEX
PARAM c[12] = { program.local[0..9],
		{ 2, 1, 0, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[10].x, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[10].y;
POW R2.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R3.x, R2.w, c[7], R1;
MUL R1.xyz, R3.x, R0;
DP3_SAT R0.x, R1, c[11];
MUL R0.y, R0.x, R0.x;
MOV R0.zw, c[10].xyyw;
MAD R0.x, -R2.w, c[2], R0.z;
MAD R0.x, R0, c[3].w, R0.y;
ADD R2.x, -R0.y, c[10].y;
MIN R1.w, R0.x, c[10].y;
MAD R0.xyz, R1, c[3], -R1;
MUL R2.x, R2, c[9];
MAD R2.xyz, R2.x, R0, R1;
DP3 R1.y, fragment.texcoord[3], fragment.texcoord[3];
ABS R0.x, fragment.texcoord[4].z;
ADD R0.y, -R1.w, c[10];
MUL R0.y, R0.x, R0;
MOV_SAT R0.x, R3;
MAX R3.w, fragment.texcoord[4].z, R0.y;
ADD R1.x, -R0, c[10].y;
RSQ R1.y, R1.y;
MOV R0.xyz, fragment.texcoord[4];
MAD R0.xyz, R1.y, fragment.texcoord[3], R0;
DP3 R0.x, R0, R0;
MOV R0.y, c[5].x;
MAD R2.w, R2, c[7].x, R0.y;
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R1.xyz, R1.x, c[3];
MUL R0.y, R0.w, c[4].x;
MAX R0.x, R0, c[10].z;
POW R3.x, R0.x, R0.y;
MOV R0, c[1];
MUL R2.w, R3.x, R2;
MUL R0.xyz, R0, c[0];
MUL R3.xyz, R0, R2.w;
MUL R0.xyz, R1, c[0];
MAD R0.xyz, R0, R3.w, R3;
TXP R3.x, fragment.texcoord[6], texture[1], 2D;
MUL R0.w, R0, c[0];
MUL R0.w, R2, R0;
MUL R0.xyz, R3.x, R0;
MUL R1.xyz, R1, fragment.texcoord[5];
MAD R0.xyz, R0, c[10].x, R1;
ADD result.color.xyz, R0, R2;
MAD result.color.w, R3.x, R0, R1;
END
# 63 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
Float 9 [_Metalics]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] 2D
"ps_3_0
; 72 ALU, 3 TEX
dcl_cube s0
dcl_2d s1
def c10, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c11, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c10.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c10, -r0
mul_pp r1.w, r0.y, c10.z
add_pp r2.x, -r0, c10.y
pow_pp r0, r2.x, c8.x
texldl r1.xyz, r1, s0
mov_pp r3.x, r0
mov_pp r0.y, c6.x
mad_pp r0.w, r3.x, c7.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r1.y, r0, c11
mad_pp r2.x, -r1.y, r1.y, c10.y
mov_pp r1.x, c10.y
mov_pp_sat r0.w, r0
mul_pp r1.z, r1.y, r1.y
mad_pp r1.x, -r3, c2, r1
mad_pp r1.x, r1, c3.w, r1.z
min_pp r1.w, r1.x, c10.y
add_pp r1.z, -r1.w, c10.y
abs_pp r1.x, v4.z
mul_pp r2.w, r1.x, r1.z
mad_pp r1.xyz, r0, c3, -r0
mul_pp r2.x, r2, c9
mad_pp r2.xyz, r2.x, r1, r0
dp3_pp r1.x, v3, v3
max_pp r2.w, v4.z, r2
rsq_pp r1.x, r1.x
mov_pp r0.xyz, v4
mad_pp r0.xyz, r1.x, v3, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c10.y
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r1.xyz, r0.w, c3
mul_pp r3.z, c11.w, r0.y
max_pp r3.y, r0.x, c10.w
pow_pp r0, r3.y, r3.z
mov_pp r0.y, c5.x
mad_pp r3.x, r3, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r3.x
mul_pp r0.xyz, c1, r0
mul_pp r3.xyz, r0, r0.w
mul_pp r0.xyz, r1, c0
mad_pp r0.xyz, r0, r2.w, r3
texldp r3.x, v6, s1
mov_pp r2.w, c0
mul_pp r2.w, c1, r2
mul_pp r0.w, r0, r2
mul_pp r0.xyz, r3.x, r0
mul_pp r1.xyz, r1, v5
mad_pp r0.xyz, r0, c10.x, r1
add_pp oC0.xyz, r0, r2
mad_pp oC0.w, r3.x, r0, r1
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] 2D
SetTexture 2 [unity_Lightmap] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 40 ALU, 3 TEX
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 8 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R2.x, fragment.texcoord[0].z;
MOV R2.y, fragment.texcoord[1].z;
MOV R2.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].w;
MOV R0.z, fragment.texcoord[2].w;
MOV R0.y, fragment.texcoord[1].w;
DP3 R0.w, R2, R0;
MUL R1.xyz, R2, R0.w;
MAD R0.xyz, -R1, c[6].x, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.w, R0, R2;
ABS R0.w, R0;
ADD R0.w, -R0, c[6].y;
POW R1.w, R0.w, c[4].x;
MOV R1.x, c[2];
MAD R0.w, R1, c[3].x, R1.x;
TEX R0.xyz, R0, texture[0], CUBE;
MUL R0.xyz, R0.w, R0;
DP3_SAT R1.x, R0, c[7];
MUL R2.w, R1.x, R1.x;
ADD R2.x, -R2.w, c[6].y;
MAD R1.xyz, R0, c[1], -R0;
MUL R2.x, R2, c[5];
MAD R2.xyz, R2.x, R1, R0;
MOV R0.x, c[6].y;
MAD R0.z, -R1.w, c[0].x, R0.x;
MOV_SAT R0.y, R0.w;
ADD R0.x, -R0.y, c[6].y;
MAD R2.w, R0.z, c[1], R2;
MUL R1.yzw, R0.x, c[1].xxyz;
TEX R0, fragment.texcoord[4], texture[2], 2D;
MUL R0.xyz, R0.w, R0;
TXP R1.x, fragment.texcoord[6], texture[1], 2D;
MUL R0.w, R1.x, c[6].x;
MUL R0.xyz, R0, c[6].z;
MIN R0.xyz, R0, R0.w;
MAD result.color.xyz, R1.yzww, R0, R2;
MIN result.color.w, R2, c[6].y;
END
# 40 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Shininess]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
Float 6 [_Metalics]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] 2D
SetTexture 2 [unity_Lightmap] 2D
"ps_3_0
; 43 ALU, 4 TEX
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c7, 2.00000000, 8.00000000, 1.00000000, 6.00000000
def c8, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord4 v3.xy
dcl_texcoord6 v4
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r2.x, v0.w
mov r2.z, v2.w
mov r2.y, v1.w
dp3 r0.w, r0, r2
mul r1.xyz, r0, r0.w
mad r1.xyz, -r1, c7.x, r2
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c2.x
add_pp r0.y, c7.z, -r0
mul_pp r1.w, r0.y, c7
add_pp r2.x, -r0, c7.z
pow_pp r0, r2.x, c5.x
texldl r1.xyz, r1, s0
mov_pp r0.w, r0.x
mov_pp r0.y, c3.x
mad_pp r1.w, r0, c4.x, r0.y
mul_pp r0.xyz, r1.w, r1
dp3_pp_sat r2.w, r0, c8
mad_pp r2.x, -r2.w, r2.w, c7.z
mad_pp r1.xyz, r0, c1, -r0
mul_pp r2.x, r2, c6
mad_pp r2.xyz, r2.x, r1, r0
mov_pp_sat r0.x, r1.w
add_pp r0.x, -r0, c7.z
mov_pp r0.y, c7.z
mul_pp r0.z, r2.w, r2.w
mad_pp r0.y, -r0.w, c0.x, r0
mad_pp r2.w, r0.y, c1, r0.z
mul_pp r1.yzw, r0.x, c1.xxyz
texld r0, v3, s2
mul_pp r0.xyz, r0.w, r0
texldp r1.x, v4, s1
mul_pp r0.w, r1.x, c7.x
mul_pp r0.xyz, r0, c7.y
min_pp r0.xyz, r0, r0.w
mad_pp oC0.xyz, r1.yzww, r0, r2
min_pp oC0.w, r2, c7.z
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"!!GLES"
}

}
	}
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardAdd" }
		ZWrite Off Blend One One Fog { Color (0,0,0,0) }
Program "vp" {
// Vertex combos: 15
//   opengl - ALU: 39 to 52
//   d3d9 - ALU: 42 to 55
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
# 47 ALU
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[17].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[19];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 47 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_3_0
; 50 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c19.x
mov r1.xyz, c17
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c16.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c18, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mad r0.xyz, r4, c16.w, -v0
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c16.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c16.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c16.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_6 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_12 * (((_World2Object * tmpvar_20).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_21;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (_Gloss + tmpvar_14);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize (xlv_TEXCOORD3);
  lightDir = tmpvar_20;
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD4);
  highp vec2 tmpvar_22;
  tmpvar_22 = vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5));
  lowp vec3 viewDir;
  viewDir = tmpvar_21;
  lowp float atten;
  atten = texture2D (_LightTexture0, tmpvar_22).w;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_23;
  tmpvar_23 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  lowp float tmpvar_24;
  tmpvar_24 = max (tmpvar_23, (abs (tmpvar_23) * (1.0 - tmpvar_18)));
  lowp float tmpvar_25;
  tmpvar_25 = dot (vec3(0.0, 0.0, 1.0), normalize ((lightDir + viewDir)));
  nh = tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = max (0.0, nh);
  nh = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = (pow (tmpvar_26, (_Shininess * 128.0)) * tmpvar_17);
  mediump vec3 tmpvar_28;
  tmpvar_28 = ((((tmpvar_19 * _LightColor0.xyz) * tmpvar_24) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_27)) * (atten * 2.0));
  c_i0_i1.xyz = tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = (tmpvar_18 + (((_LightColor0.w * _SpecColor.w) * tmpvar_27) * atten));
  c_i0_i1.w = tmpvar_29;
  c = c_i0_i1;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
"3.0-!!ARBvp1.0
# 39 ALU
PARAM c[16] = { { 1 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[14];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R3.xyz, R2, c[13].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[13].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[4].y, R2, R3;
MUL result.texcoord[2], R0, c[13].w;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 39 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
"vs_3_0
; 42 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c15, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.w, c15.x
mov r0.xyz, c13
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c12.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
dp4 r4.y, c14, r0
mov r1, c8
dp4 r4.x, c14, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o4.y, r2, r4
dp3 o5.y, r2, r3
mul o3, r0, c12.w
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_12 * (((_World2Object * tmpvar_20).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_21;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
}



#endif
#ifdef FRAGMENT

varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (_Gloss + tmpvar_14);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  lightDir = xlv_TEXCOORD3;
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize (xlv_TEXCOORD4);
  lowp vec3 viewDir;
  viewDir = tmpvar_20;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_21;
  tmpvar_21 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  lowp float tmpvar_22;
  tmpvar_22 = max (tmpvar_21, (abs (tmpvar_21) * (1.0 - tmpvar_18)));
  lowp float tmpvar_23;
  tmpvar_23 = dot (vec3(0.0, 0.0, 1.0), normalize ((lightDir + viewDir)));
  nh = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, nh);
  nh = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = (pow (tmpvar_24, (_Shininess * 128.0)) * tmpvar_17);
  mediump vec3 tmpvar_26;
  tmpvar_26 = ((((tmpvar_19 * _LightColor0.xyz) * tmpvar_22) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_25)) * 2.0);
  c_i0_i1.xyz = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_18 + ((_LightColor0.w * _SpecColor.w) * tmpvar_25));
  c_i0_i1.w = tmpvar_27;
  c = c_i0_i1;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
# 48 ALU
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[17].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[19];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].w, R0, c[16];
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 48 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_3_0
; 51 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c19.x
mov r1.xyz, c17
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c16.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c18, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mad r0.xyz, r4, c16.w, -v0
dp4 r0.w, v0, c7
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c16.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c16.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c16.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.w, r0, c15
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_6 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_12 * (((_World2Object * tmpvar_20).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_21;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (_Gloss + tmpvar_14);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize (xlv_TEXCOORD3);
  lightDir = tmpvar_20;
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD4);
  highp vec3 LightCoord_i0;
  LightCoord_i0 = xlv_TEXCOORD5.xyz;
  highp vec2 tmpvar_22;
  tmpvar_22 = vec2(dot (LightCoord_i0, LightCoord_i0));
  lowp vec3 viewDir;
  viewDir = tmpvar_21;
  lowp float atten;
  atten = ((float((xlv_TEXCOORD5.z > 0.0)) * texture2D (_LightTexture0, ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5)).w) * texture2D (_LightTextureB0, tmpvar_22).w);
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_23;
  tmpvar_23 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  lowp float tmpvar_24;
  tmpvar_24 = max (tmpvar_23, (abs (tmpvar_23) * (1.0 - tmpvar_18)));
  lowp float tmpvar_25;
  tmpvar_25 = dot (vec3(0.0, 0.0, 1.0), normalize ((lightDir + viewDir)));
  nh = tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = max (0.0, nh);
  nh = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = (pow (tmpvar_26, (_Shininess * 128.0)) * tmpvar_17);
  mediump vec3 tmpvar_28;
  tmpvar_28 = ((((tmpvar_19 * _LightColor0.xyz) * tmpvar_24) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_27)) * (atten * 2.0));
  c_i0_i1.xyz = tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = (tmpvar_18 + (((_LightColor0.w * _SpecColor.w) * tmpvar_27) * atten));
  c_i0_i1.w = tmpvar_29;
  c = c_i0_i1;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
# 47 ALU
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[17].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[19];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 47 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_3_0
; 50 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c19.x
mov r1.xyz, c17
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c16.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c18, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mad r0.xyz, r4, c16.w, -v0
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c16.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c16.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c16.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_6 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_12 * (((_World2Object * tmpvar_20).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_21;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _LightTextureB0;
uniform samplerCube _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (_Gloss + tmpvar_14);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize (xlv_TEXCOORD3);
  lightDir = tmpvar_20;
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD4);
  highp vec2 tmpvar_22;
  tmpvar_22 = vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5));
  lowp vec3 viewDir;
  viewDir = tmpvar_21;
  lowp float atten;
  atten = (texture2D (_LightTextureB0, tmpvar_22).w * textureCube (_LightTexture0, xlv_TEXCOORD5).w);
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_23;
  tmpvar_23 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  lowp float tmpvar_24;
  tmpvar_24 = max (tmpvar_23, (abs (tmpvar_23) * (1.0 - tmpvar_18)));
  lowp float tmpvar_25;
  tmpvar_25 = dot (vec3(0.0, 0.0, 1.0), normalize ((lightDir + viewDir)));
  nh = tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = max (0.0, nh);
  nh = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = (pow (tmpvar_26, (_Shininess * 128.0)) * tmpvar_17);
  mediump vec3 tmpvar_28;
  tmpvar_28 = ((((tmpvar_19 * _LightColor0.xyz) * tmpvar_24) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_27)) * (atten * 2.0));
  c_i0_i1.xyz = tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = (tmpvar_18 + (((_LightColor0.w * _SpecColor.w) * tmpvar_27) * atten));
  c_i0_i1.w = tmpvar_29;
  c = c_i0_i1;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
# 45 ALU
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R3.xyz, R2, c[17].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[19];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[17].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[4].y, R2, R3;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 45 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_3_0
; 48 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.w, c19.x
mov r0.xyz, c17
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c16.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mov r1, c8
dp4 r4.x, c18, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c16.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c16.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o3, r0, c16.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o4.y, r2, r4
dp3 o5.y, r2, r3
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_12 * (((_World2Object * tmpvar_20).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_21;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (_Gloss + tmpvar_14);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  lightDir = xlv_TEXCOORD3;
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize (xlv_TEXCOORD4);
  lowp vec3 viewDir;
  viewDir = tmpvar_20;
  lowp float atten;
  atten = texture2D (_LightTexture0, xlv_TEXCOORD5).w;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_21;
  tmpvar_21 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  lowp float tmpvar_22;
  tmpvar_22 = max (tmpvar_21, (abs (tmpvar_21) * (1.0 - tmpvar_18)));
  lowp float tmpvar_23;
  tmpvar_23 = dot (vec3(0.0, 0.0, 1.0), normalize ((lightDir + viewDir)));
  nh = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, nh);
  nh = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = (pow (tmpvar_24, (_Shininess * 128.0)) * tmpvar_17);
  mediump vec3 tmpvar_26;
  tmpvar_26 = ((((tmpvar_19 * _LightColor0.xyz) * tmpvar_22) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_25)) * (atten * 2.0));
  c_i0_i1.xyz = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_18 + (((_LightColor0.w * _SpecColor.w) * tmpvar_25) * atten));
  c_i0_i1.w = tmpvar_27;
  c = c_i0_i1;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 21 [unity_Scale]
Vector 22 [_WorldSpaceCameraPos]
Vector 23 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [unity_World2Shadow]
Matrix 17 [_LightMatrix0]
"3.0-!!ARBvp1.0
# 52 ALU
PARAM c[24] = { { 1 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[22];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[21].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[23];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[21].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[21].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[21].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[21].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].w, R0, c[20];
DP4 result.texcoord[5].z, R0, c[19];
DP4 result.texcoord[5].y, R0, c[18];
DP4 result.texcoord[5].x, R0, c[17];
DP4 result.texcoord[6].w, R0, c[16];
DP4 result.texcoord[6].z, R0, c[15];
DP4 result.texcoord[6].y, R0, c[14];
DP4 result.texcoord[6].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 52 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 20 [unity_Scale]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [unity_World2Shadow]
Matrix 16 [_LightMatrix0]
"vs_3_0
; 55 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c23, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c23.x
mov r1.xyz, c21
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c20.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c22, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c22, r0
mov r0, c9
dp4 r4.y, c22, r0
mad r0.xyz, r4, c20.w, -v0
dp4 r0.w, v0, c7
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c20.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c20.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c20.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.w, r0, c19
dp4 o6.z, r0, c18
dp4 o6.y, r0, c17
dp4 o6.x, r0, c16
dp4 o7.w, r0, c15
dp4 o7.z, r0, c14
dp4 o7.y, r0, c13
dp4 o7.x, r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp mat4 unity_World2Shadow;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_6 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_12 * (((_World2Object * tmpvar_20).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_21;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
  xlv_TEXCOORD6 = (unity_World2Shadow * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (_Gloss + tmpvar_14);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize (xlv_TEXCOORD3);
  lightDir = tmpvar_20;
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD4);
  lowp float tmpvar_22;
  tmpvar_22 = texture2D (_LightTexture0, ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5)).w;
  lowp float tmpvar_23;
  highp vec3 LightCoord_i0;
  LightCoord_i0 = xlv_TEXCOORD5.xyz;
  highp vec2 tmpvar_24;
  tmpvar_24 = vec2(dot (LightCoord_i0, LightCoord_i0));
  tmpvar_23 = texture2D (_LightTextureB0, tmpvar_24).w;
  lowp float tmpvar_25;
  mediump float shadow;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6);
  highp float tmpvar_27;
  if ((tmpvar_26.x < (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))) {
    tmpvar_27 = _LightShadowData.x;
  } else {
    tmpvar_27 = 1.0;
  };
  shadow = tmpvar_27;
  tmpvar_25 = shadow;
  lowp vec3 viewDir;
  viewDir = tmpvar_21;
  lowp float atten;
  atten = (((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_22) * tmpvar_23) * tmpvar_25);
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_28;
  tmpvar_28 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  lowp float tmpvar_29;
  tmpvar_29 = max (tmpvar_28, (abs (tmpvar_28) * (1.0 - tmpvar_18)));
  lowp float tmpvar_30;
  tmpvar_30 = dot (vec3(0.0, 0.0, 1.0), normalize ((lightDir + viewDir)));
  nh = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = max (0.0, nh);
  nh = tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = (pow (tmpvar_31, (_Shininess * 128.0)) * tmpvar_17);
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_19 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * (atten * 2.0));
  c_i0_i1.xyz = tmpvar_33;
  mediump float tmpvar_34;
  tmpvar_34 = (tmpvar_18 + (((_LightColor0.w * _SpecColor.w) * tmpvar_32) * atten));
  c_i0_i1.w = tmpvar_34;
  c = c_i0_i1;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 20 [unity_Scale]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [unity_World2Shadow]
Matrix 16 [_LightMatrix0]
"vs_3_0
; 55 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c23, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c23.x
mov r1.xyz, c21
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c20.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c22, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c22, r0
mov r0, c9
dp4 r4.y, c22, r0
mad r0.xyz, r4, c20.w, -v0
dp4 r0.w, v0, c7
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c20.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c20.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c20.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.w, r0, c19
dp4 o6.z, r0, c18
dp4 o6.y, r0, c17
dp4 o6.x, r0, c16
dp4 o7.w, r0, c15
dp4 o7.z, r0, c14
dp4 o7.y, r0, c13
dp4 o7.x, r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
"3.0-!!ARBvp1.0
# 44 ALU
PARAM c[17] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[15];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R3.xyz, R2, c[14].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[16];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[14].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[14].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[4].y, R2, R3;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
END
# 44 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
"vs_3_0
; 47 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c17, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.w, c17.x
mov r0.xyz, c15
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c14.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1, c8
dp4 r4.x, c16, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o3, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c17.y
mul r1.y, r1, c12.x
dp3 o4.y, r2, r4
dp3 o5.y, r2, r3
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
mad o6.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o6.zw, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_3 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_4 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_13 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_13 * (((_World2Object * tmpvar_21).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_22;
  highp vec4 o_i0;
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_8 * 0.5);
  o_i0 = tmpvar_23;
  highp vec2 tmpvar_24;
  tmpvar_24.x = tmpvar_23.x;
  tmpvar_24.y = (tmpvar_23.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_24 + tmpvar_23.w);
  o_i0.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _ShadowMapTexture;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (_Gloss + tmpvar_14);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  lightDir = xlv_TEXCOORD3;
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize (xlv_TEXCOORD4);
  lowp float tmpvar_21;
  tmpvar_21 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  lowp vec3 viewDir;
  viewDir = tmpvar_20;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_22;
  tmpvar_22 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  lowp float tmpvar_23;
  tmpvar_23 = max (tmpvar_22, (abs (tmpvar_22) * (1.0 - tmpvar_18)));
  lowp float tmpvar_24;
  tmpvar_24 = dot (vec3(0.0, 0.0, 1.0), normalize ((lightDir + viewDir)));
  nh = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, nh);
  nh = tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = (pow (tmpvar_25, (_Shininess * 128.0)) * tmpvar_17);
  mediump vec3 tmpvar_27;
  tmpvar_27 = ((((tmpvar_19 * _LightColor0.xyz) * tmpvar_23) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_26)) * (tmpvar_21 * 2.0));
  c_i0_i1.xyz = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = (tmpvar_18 + (((_LightColor0.w * _SpecColor.w) * tmpvar_26) * tmpvar_21));
  c_i0_i1.w = tmpvar_28;
  c = c_i0_i1;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 17 [_ProjectionParams]
Vector 18 [unity_Scale]
Vector 19 [_WorldSpaceCameraPos]
Vector 20 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
# 50 ALU
PARAM c[21] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.w, c[0].x;
MOV R1.xyz, c[19];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R3.xyz, R2, c[18].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[20];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[18].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[18].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[18].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP4 R1.w, vertex.position, c[8];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[17].x;
ADD result.texcoord[6].xy, R1, R1.z;
DP4 R1.z, vertex.position, c[7];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R2, R3;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
MOV result.position, R0;
DP4 result.texcoord[5].y, R1, c[14];
DP4 result.texcoord[5].x, R1, c[13];
MOV result.texcoord[6].zw, R0;
END
# 50 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [unity_Scale]
Vector 19 [_WorldSpaceCameraPos]
Vector 20 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_3_0
; 53 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c21, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.w, c21.x
mov r0.xyz, c19
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c18.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r1, c8
dp4 r4.x, c20, r1
mov r0, c10
dp4 r4.z, c20, r0
mov r0, c9
dp4 r4.y, c20, r0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c18.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c18.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o3, r0, c18.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c21.y
mul r1.y, r1, c16.x
mad o7.xy, r1.z, c17.zwzw, r1
dp4 r1.w, v0, c7
dp4 r1.z, v0, c6
dp4 r1.x, v0, c4
dp4 r1.y, v0, c5
dp3 o4.y, r2, r4
dp3 o5.y, r2, r3
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
mov o0, r0
dp4 o6.y, r1, c13
dp4 o6.x, r1, c12
mov o7.zw, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_3 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_4 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_13 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_13 * (((_World2Object * tmpvar_21).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_22;
  highp vec4 o_i0;
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_8 * 0.5);
  o_i0 = tmpvar_23;
  highp vec2 tmpvar_24;
  tmpvar_24.x = tmpvar_23.x;
  tmpvar_24.y = (tmpvar_23.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_24 + tmpvar_23.w);
  o_i0.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
  xlv_TEXCOORD6 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (_Gloss + tmpvar_14);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  lightDir = xlv_TEXCOORD3;
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize (xlv_TEXCOORD4);
  lowp vec3 viewDir;
  viewDir = tmpvar_20;
  lowp float atten;
  atten = (texture2D (_LightTexture0, xlv_TEXCOORD5).w * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x);
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_21;
  tmpvar_21 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  lowp float tmpvar_22;
  tmpvar_22 = max (tmpvar_21, (abs (tmpvar_21) * (1.0 - tmpvar_18)));
  lowp float tmpvar_23;
  tmpvar_23 = dot (vec3(0.0, 0.0, 1.0), normalize ((lightDir + viewDir)));
  nh = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, nh);
  nh = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = (pow (tmpvar_24, (_Shininess * 128.0)) * tmpvar_17);
  mediump vec3 tmpvar_26;
  tmpvar_26 = ((((tmpvar_19 * _LightColor0.xyz) * tmpvar_22) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_25)) * (atten * 2.0));
  c_i0_i1.xyz = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_18 + (((_LightColor0.w * _SpecColor.w) * tmpvar_25) * atten));
  c_i0_i1.w = tmpvar_27;
  c = c_i0_i1;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 20 [_LightPositionRange]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
# 48 ALU
PARAM c[21] = { { 1 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[17].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[19];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[17].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
ADD result.texcoord[6].xyz, R0, -c[20];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 48 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 19 [_LightPositionRange]
Matrix 12 [_LightMatrix0]
"vs_3_0
; 51 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c20.x
mov r1.xyz, c17
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c16.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c18, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mad r0.xyz, r4, c16.w, -v0
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c16.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c16.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c16.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
add o7.xyz, r0, -c19
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_6 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_12 * (((_World2Object * tmpvar_20).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_21;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 _LightPositionRange;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (_Gloss + tmpvar_14);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize (xlv_TEXCOORD3);
  lightDir = tmpvar_20;
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD4);
  highp vec2 tmpvar_22;
  tmpvar_22 = vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5));
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_LightTexture0, tmpvar_22);
  highp float tmpvar_24;
  tmpvar_24 = ((length (xlv_TEXCOORD6) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist;
  lowp vec4 tmpvar_25;
  tmpvar_25 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (packDist, vec4(1.0, 0.00392157, 1.53787e-005, 0.0));
  highp float tmpvar_27;
  if ((tmpvar_26 < tmpvar_24)) {
    tmpvar_27 = _LightShadowData.x;
  } else {
    tmpvar_27 = 1.0;
  };
  lowp vec3 viewDir;
  viewDir = tmpvar_21;
  lowp float atten;
  atten = (tmpvar_23.w * tmpvar_27);
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_28;
  tmpvar_28 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  lowp float tmpvar_29;
  tmpvar_29 = max (tmpvar_28, (abs (tmpvar_28) * (1.0 - tmpvar_18)));
  lowp float tmpvar_30;
  tmpvar_30 = dot (vec3(0.0, 0.0, 1.0), normalize ((lightDir + viewDir)));
  nh = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = max (0.0, nh);
  nh = tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = (pow (tmpvar_31, (_Shininess * 128.0)) * tmpvar_17);
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_19 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * (atten * 2.0));
  c_i0_i1.xyz = tmpvar_33;
  mediump float tmpvar_34;
  tmpvar_34 = (tmpvar_18 + (((_LightColor0.w * _SpecColor.w) * tmpvar_32) * atten));
  c_i0_i1.w = tmpvar_34;
  c = c_i0_i1;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 20 [_LightPositionRange]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
# 48 ALU
PARAM c[21] = { { 1 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[17].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[19];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[17].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
ADD result.texcoord[6].xyz, R0, -c[20];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 48 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 19 [_LightPositionRange]
Matrix 12 [_LightMatrix0]
"vs_3_0
; 51 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c20.x
mov r1.xyz, c17
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c16.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c18, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mad r0.xyz, r4, c16.w, -v0
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c16.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c16.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c16.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
add o7.xyz, r0, -c19
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_6 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_12 * (((_World2Object * tmpvar_20).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_21;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform samplerCube _ShadowMapTexture;
uniform sampler2D _LightTextureB0;
uniform samplerCube _LightTexture0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 _LightPositionRange;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (_Gloss + tmpvar_14);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize (xlv_TEXCOORD3);
  lightDir = tmpvar_20;
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD4);
  highp vec2 tmpvar_22;
  tmpvar_22 = vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5));
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_LightTextureB0, tmpvar_22);
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_25;
  tmpvar_25 = ((length (xlv_TEXCOORD6) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist;
  lowp vec4 tmpvar_26;
  tmpvar_26 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (packDist, vec4(1.0, 0.00392157, 1.53787e-005, 0.0));
  highp float tmpvar_28;
  if ((tmpvar_27 < tmpvar_25)) {
    tmpvar_28 = _LightShadowData.x;
  } else {
    tmpvar_28 = 1.0;
  };
  lowp vec3 viewDir;
  viewDir = tmpvar_21;
  lowp float atten;
  atten = ((tmpvar_23.w * tmpvar_24.w) * tmpvar_28);
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_29;
  tmpvar_29 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  lowp float tmpvar_30;
  tmpvar_30 = max (tmpvar_29, (abs (tmpvar_29) * (1.0 - tmpvar_18)));
  lowp float tmpvar_31;
  tmpvar_31 = dot (vec3(0.0, 0.0, 1.0), normalize ((lightDir + viewDir)));
  nh = tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = max (0.0, nh);
  nh = tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (pow (tmpvar_32, (_Shininess * 128.0)) * tmpvar_17);
  mediump vec3 tmpvar_34;
  tmpvar_34 = ((((tmpvar_19 * _LightColor0.xyz) * tmpvar_30) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_33)) * (atten * 2.0));
  c_i0_i1.xyz = tmpvar_34;
  mediump float tmpvar_35;
  tmpvar_35 = (tmpvar_18 + (((_LightColor0.w * _SpecColor.w) * tmpvar_33) * atten));
  c_i0_i1.w = tmpvar_35;
  c = c_i0_i1;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 21 [unity_Scale]
Vector 22 [_WorldSpaceCameraPos]
Vector 23 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [unity_World2Shadow]
Matrix 17 [_LightMatrix0]
"3.0-!!ARBvp1.0
# 52 ALU
PARAM c[24] = { { 1 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[22];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[21].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[23];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[21].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[21].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[21].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[21].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].w, R0, c[20];
DP4 result.texcoord[5].z, R0, c[19];
DP4 result.texcoord[5].y, R0, c[18];
DP4 result.texcoord[5].x, R0, c[17];
DP4 result.texcoord[6].w, R0, c[16];
DP4 result.texcoord[6].z, R0, c[15];
DP4 result.texcoord[6].y, R0, c[14];
DP4 result.texcoord[6].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 52 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 20 [unity_Scale]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [unity_World2Shadow]
Matrix 16 [_LightMatrix0]
"vs_3_0
; 55 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c23, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c23.x
mov r1.xyz, c21
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c20.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c22, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c22, r0
mov r0, c9
dp4 r4.y, c22, r0
mad r0.xyz, r4, c20.w, -v0
dp4 r0.w, v0, c7
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c20.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c20.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c20.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.w, r0, c19
dp4 o6.z, r0, c18
dp4 o6.y, r0, c17
dp4 o6.x, r0, c16
dp4 o7.w, r0, c15
dp4 o7.z, r0, c14
dp4 o7.y, r0, c13
dp4 o7.x, r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp mat4 unity_World2Shadow;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_6 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_12 * (((_World2Object * tmpvar_20).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_21;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
  xlv_TEXCOORD6 = (unity_World2Shadow * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform vec4 _ShadowOffsets[4];
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (_Gloss + tmpvar_14);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize (xlv_TEXCOORD3);
  lightDir = tmpvar_20;
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD4);
  lowp float tmpvar_22;
  tmpvar_22 = texture2D (_LightTexture0, ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5)).w;
  lowp float tmpvar_23;
  highp vec3 LightCoord_i0;
  LightCoord_i0 = xlv_TEXCOORD5.xyz;
  highp vec2 tmpvar_24;
  tmpvar_24 = vec2(dot (LightCoord_i0, LightCoord_i0));
  tmpvar_23 = texture2D (_LightTextureB0, tmpvar_24).w;
  lowp float tmpvar_25;
  highp vec4 shadowVals;
  highp vec3 tmpvar_26;
  tmpvar_26 = (xlv_TEXCOORD6.xyz / xlv_TEXCOORD6.w);
  highp vec2 tmpvar_27;
  tmpvar_27 = tmpvar_26.xy;
  lowp float tmpvar_28;
  tmpvar_28 = texture2D (_ShadowMapTexture, (tmpvar_27 + _ShadowOffsets[0].xy)).x;
  shadowVals.x = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = tmpvar_26.xy;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_ShadowMapTexture, (tmpvar_29 + _ShadowOffsets[1].xy)).x;
  shadowVals.y = tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = tmpvar_26.xy;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_ShadowMapTexture, (tmpvar_31 + _ShadowOffsets[2].xy)).x;
  shadowVals.z = tmpvar_32;
  highp vec2 tmpvar_33;
  tmpvar_33 = tmpvar_26.xy;
  lowp float tmpvar_34;
  tmpvar_34 = texture2D (_ShadowMapTexture, (tmpvar_33 + _ShadowOffsets[3].xy)).x;
  shadowVals.w = tmpvar_34;
  bvec4 tmpvar_35;
  tmpvar_35 = lessThan (shadowVals, tmpvar_26.zzzz);
  highp vec4 tmpvar_36;
  tmpvar_36 = _LightShadowData.xxxx;
  float tmpvar_37;
  if (tmpvar_35.x) {
    tmpvar_37 = tmpvar_36.x;
  } else {
    tmpvar_37 = 1.0;
  };
  float tmpvar_38;
  if (tmpvar_35.y) {
    tmpvar_38 = tmpvar_36.y;
  } else {
    tmpvar_38 = 1.0;
  };
  float tmpvar_39;
  if (tmpvar_35.z) {
    tmpvar_39 = tmpvar_36.z;
  } else {
    tmpvar_39 = 1.0;
  };
  float tmpvar_40;
  if (tmpvar_35.w) {
    tmpvar_40 = tmpvar_36.w;
  } else {
    tmpvar_40 = 1.0;
  };
  vec4 tmpvar_41;
  tmpvar_41.x = tmpvar_37;
  tmpvar_41.y = tmpvar_38;
  tmpvar_41.z = tmpvar_39;
  tmpvar_41.w = tmpvar_40;
  mediump float tmpvar_42;
  tmpvar_42 = dot (tmpvar_41, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_25 = tmpvar_42;
  lowp vec3 viewDir;
  viewDir = tmpvar_21;
  lowp float atten;
  atten = (((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_22) * tmpvar_23) * tmpvar_25);
  lowp vec4 c_i0_i1_i2;
  mediump float nh;
  lowp float tmpvar_43;
  tmpvar_43 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  lowp float tmpvar_44;
  tmpvar_44 = max (tmpvar_43, (abs (tmpvar_43) * (1.0 - tmpvar_18)));
  lowp float tmpvar_45;
  tmpvar_45 = dot (vec3(0.0, 0.0, 1.0), normalize ((lightDir + viewDir)));
  nh = tmpvar_45;
  mediump float tmpvar_46;
  tmpvar_46 = max (0.0, nh);
  nh = tmpvar_46;
  mediump float tmpvar_47;
  tmpvar_47 = (pow (tmpvar_46, (_Shininess * 128.0)) * tmpvar_17);
  mediump vec3 tmpvar_48;
  tmpvar_48 = ((((tmpvar_19 * _LightColor0.xyz) * tmpvar_44) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_47)) * (atten * 2.0));
  c_i0_i1_i2.xyz = tmpvar_48;
  mediump float tmpvar_49;
  tmpvar_49 = (tmpvar_18 + (((_LightColor0.w * _SpecColor.w) * tmpvar_47) * atten));
  c_i0_i1_i2.w = tmpvar_49;
  c = c_i0_i1_i2;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 20 [unity_Scale]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [unity_World2Shadow]
Matrix 16 [_LightMatrix0]
"vs_3_0
; 55 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c23, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c23.x
mov r1.xyz, c21
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c20.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c22, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c22, r0
mov r0, c9
dp4 r4.y, c22, r0
mad r0.xyz, r4, c20.w, -v0
dp4 r0.w, v0, c7
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c20.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c20.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c20.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.w, r0, c19
dp4 o6.z, r0, c18
dp4 o6.y, r0, c17
dp4 o6.x, r0, c16
dp4 o7.w, r0, c15
dp4 o7.z, r0, c14
dp4 o7.y, r0, c13
dp4 o7.x, r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 20 [_LightPositionRange]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
# 48 ALU
PARAM c[21] = { { 1 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[17].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[19];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[17].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
ADD result.texcoord[6].xyz, R0, -c[20];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 48 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 19 [_LightPositionRange]
Matrix 12 [_LightMatrix0]
"vs_3_0
; 51 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c20.x
mov r1.xyz, c17
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c16.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c18, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mad r0.xyz, r4, c16.w, -v0
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c16.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c16.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c16.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
add o7.xyz, r0, -c19
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_6 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_12 * (((_World2Object * tmpvar_20).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_21;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 _LightPositionRange;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (_Gloss + tmpvar_14);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize (xlv_TEXCOORD3);
  lightDir = tmpvar_20;
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD4);
  highp vec2 tmpvar_22;
  tmpvar_22 = vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5));
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_LightTexture0, tmpvar_22);
  highp float tmpvar_24;
  highp vec4 shadowVals;
  highp vec3 vec_i0;
  vec_i0 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist;
  lowp vec4 tmpvar_25;
  tmpvar_25 = textureCube (_ShadowMapTexture, vec_i0);
  packDist = tmpvar_25;
  shadowVals.x = dot (packDist, vec4(1.0, 0.00392157, 1.53787e-005, 0.0));
  highp vec3 vec_i0_i1;
  vec_i0_i1 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_i0;
  lowp vec4 tmpvar_26;
  tmpvar_26 = textureCube (_ShadowMapTexture, vec_i0_i1);
  packDist_i0 = tmpvar_26;
  shadowVals.y = dot (packDist_i0, vec4(1.0, 0.00392157, 1.53787e-005, 0.0));
  highp vec3 vec_i0_i1_i2;
  vec_i0_i1_i2 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_i0_i1;
  lowp vec4 tmpvar_27;
  tmpvar_27 = textureCube (_ShadowMapTexture, vec_i0_i1_i2);
  packDist_i0_i1 = tmpvar_27;
  shadowVals.z = dot (packDist_i0_i1, vec4(1.0, 0.00392157, 1.53787e-005, 0.0));
  highp vec3 vec_i0_i1_i2_i3;
  vec_i0_i1_i2_i3 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_i0_i1_i2;
  lowp vec4 tmpvar_28;
  tmpvar_28 = textureCube (_ShadowMapTexture, vec_i0_i1_i2_i3);
  packDist_i0_i1_i2 = tmpvar_28;
  shadowVals.w = dot (packDist_i0_i1_i2, vec4(1.0, 0.00392157, 1.53787e-005, 0.0));
  highp vec4 tmpvar_29;
  tmpvar_29 = vec4(((length (xlv_TEXCOORD6) * _LightPositionRange.w) * 0.97));
  bvec4 tmpvar_30;
  tmpvar_30 = lessThan (shadowVals, tmpvar_29);
  highp vec4 tmpvar_31;
  tmpvar_31 = _LightShadowData.xxxx;
  float tmpvar_32;
  if (tmpvar_30.x) {
    tmpvar_32 = tmpvar_31.x;
  } else {
    tmpvar_32 = 1.0;
  };
  float tmpvar_33;
  if (tmpvar_30.y) {
    tmpvar_33 = tmpvar_31.y;
  } else {
    tmpvar_33 = 1.0;
  };
  float tmpvar_34;
  if (tmpvar_30.z) {
    tmpvar_34 = tmpvar_31.z;
  } else {
    tmpvar_34 = 1.0;
  };
  float tmpvar_35;
  if (tmpvar_30.w) {
    tmpvar_35 = tmpvar_31.w;
  } else {
    tmpvar_35 = 1.0;
  };
  vec4 tmpvar_36;
  tmpvar_36.x = tmpvar_32;
  tmpvar_36.y = tmpvar_33;
  tmpvar_36.z = tmpvar_34;
  tmpvar_36.w = tmpvar_35;
  mediump float tmpvar_37;
  tmpvar_37 = dot (tmpvar_36, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_24 = tmpvar_37;
  lowp vec3 viewDir;
  viewDir = tmpvar_21;
  lowp float atten;
  atten = (tmpvar_23.w * tmpvar_24);
  lowp vec4 c_i0_i1_i2;
  mediump float nh;
  lowp float tmpvar_38;
  tmpvar_38 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  lowp float tmpvar_39;
  tmpvar_39 = max (tmpvar_38, (abs (tmpvar_38) * (1.0 - tmpvar_18)));
  lowp float tmpvar_40;
  tmpvar_40 = dot (vec3(0.0, 0.0, 1.0), normalize ((lightDir + viewDir)));
  nh = tmpvar_40;
  mediump float tmpvar_41;
  tmpvar_41 = max (0.0, nh);
  nh = tmpvar_41;
  mediump float tmpvar_42;
  tmpvar_42 = (pow (tmpvar_41, (_Shininess * 128.0)) * tmpvar_17);
  mediump vec3 tmpvar_43;
  tmpvar_43 = ((((tmpvar_19 * _LightColor0.xyz) * tmpvar_39) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_42)) * (atten * 2.0));
  c_i0_i1_i2.xyz = tmpvar_43;
  mediump float tmpvar_44;
  tmpvar_44 = (tmpvar_18 + (((_LightColor0.w * _SpecColor.w) * tmpvar_42) * atten));
  c_i0_i1_i2.w = tmpvar_44;
  c = c_i0_i1_i2;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 20 [_LightPositionRange]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
# 48 ALU
PARAM c[21] = { { 1 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[17].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[19];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[17].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
ADD result.texcoord[6].xyz, R0, -c[20];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 48 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 19 [_LightPositionRange]
Matrix 12 [_LightMatrix0]
"vs_3_0
; 51 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c20.x
mov r1.xyz, c17
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c16.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c18, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mad r0.xyz, r4, c16.w, -v0
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c16.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c16.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c16.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
add o7.xyz, r0, -c19
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_6 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_12 * (((_World2Object * tmpvar_20).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_21;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform samplerCube _ShadowMapTexture;
uniform sampler2D _LightTextureB0;
uniform samplerCube _LightTexture0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 _LightPositionRange;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (_Gloss + tmpvar_14);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize (xlv_TEXCOORD3);
  lightDir = tmpvar_20;
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD4);
  highp vec2 tmpvar_22;
  tmpvar_22 = vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5));
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_LightTextureB0, tmpvar_22);
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_25;
  highp vec4 shadowVals;
  highp vec3 vec_i0;
  vec_i0 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist;
  lowp vec4 tmpvar_26;
  tmpvar_26 = textureCube (_ShadowMapTexture, vec_i0);
  packDist = tmpvar_26;
  shadowVals.x = dot (packDist, vec4(1.0, 0.00392157, 1.53787e-005, 0.0));
  highp vec3 vec_i0_i1;
  vec_i0_i1 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_i0;
  lowp vec4 tmpvar_27;
  tmpvar_27 = textureCube (_ShadowMapTexture, vec_i0_i1);
  packDist_i0 = tmpvar_27;
  shadowVals.y = dot (packDist_i0, vec4(1.0, 0.00392157, 1.53787e-005, 0.0));
  highp vec3 vec_i0_i1_i2;
  vec_i0_i1_i2 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_i0_i1;
  lowp vec4 tmpvar_28;
  tmpvar_28 = textureCube (_ShadowMapTexture, vec_i0_i1_i2);
  packDist_i0_i1 = tmpvar_28;
  shadowVals.z = dot (packDist_i0_i1, vec4(1.0, 0.00392157, 1.53787e-005, 0.0));
  highp vec3 vec_i0_i1_i2_i3;
  vec_i0_i1_i2_i3 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_i0_i1_i2;
  lowp vec4 tmpvar_29;
  tmpvar_29 = textureCube (_ShadowMapTexture, vec_i0_i1_i2_i3);
  packDist_i0_i1_i2 = tmpvar_29;
  shadowVals.w = dot (packDist_i0_i1_i2, vec4(1.0, 0.00392157, 1.53787e-005, 0.0));
  highp vec4 tmpvar_30;
  tmpvar_30 = vec4(((length (xlv_TEXCOORD6) * _LightPositionRange.w) * 0.97));
  bvec4 tmpvar_31;
  tmpvar_31 = lessThan (shadowVals, tmpvar_30);
  highp vec4 tmpvar_32;
  tmpvar_32 = _LightShadowData.xxxx;
  float tmpvar_33;
  if (tmpvar_31.x) {
    tmpvar_33 = tmpvar_32.x;
  } else {
    tmpvar_33 = 1.0;
  };
  float tmpvar_34;
  if (tmpvar_31.y) {
    tmpvar_34 = tmpvar_32.y;
  } else {
    tmpvar_34 = 1.0;
  };
  float tmpvar_35;
  if (tmpvar_31.z) {
    tmpvar_35 = tmpvar_32.z;
  } else {
    tmpvar_35 = 1.0;
  };
  float tmpvar_36;
  if (tmpvar_31.w) {
    tmpvar_36 = tmpvar_32.w;
  } else {
    tmpvar_36 = 1.0;
  };
  vec4 tmpvar_37;
  tmpvar_37.x = tmpvar_33;
  tmpvar_37.y = tmpvar_34;
  tmpvar_37.z = tmpvar_35;
  tmpvar_37.w = tmpvar_36;
  mediump float tmpvar_38;
  tmpvar_38 = dot (tmpvar_37, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_25 = tmpvar_38;
  lowp vec3 viewDir;
  viewDir = tmpvar_21;
  lowp float atten;
  atten = ((tmpvar_23.w * tmpvar_24.w) * tmpvar_25);
  lowp vec4 c_i0_i1_i2;
  mediump float nh;
  lowp float tmpvar_39;
  tmpvar_39 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  lowp float tmpvar_40;
  tmpvar_40 = max (tmpvar_39, (abs (tmpvar_39) * (1.0 - tmpvar_18)));
  lowp float tmpvar_41;
  tmpvar_41 = dot (vec3(0.0, 0.0, 1.0), normalize ((lightDir + viewDir)));
  nh = tmpvar_41;
  mediump float tmpvar_42;
  tmpvar_42 = max (0.0, nh);
  nh = tmpvar_42;
  mediump float tmpvar_43;
  tmpvar_43 = (pow (tmpvar_42, (_Shininess * 128.0)) * tmpvar_17);
  mediump vec3 tmpvar_44;
  tmpvar_44 = ((((tmpvar_19 * _LightColor0.xyz) * tmpvar_40) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_43)) * (atten * 2.0));
  c_i0_i1_i2.xyz = tmpvar_44;
  mediump float tmpvar_45;
  tmpvar_45 = (tmpvar_18 + (((_LightColor0.w * _SpecColor.w) * tmpvar_43) * atten));
  c_i0_i1_i2.w = tmpvar_45;
  c = c_i0_i1_i2;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 15
//   opengl - ALU: 53 to 82, TEX: 1 to 7
//   d3d9 - ALU: 62 to 84, TEX: 2 to 8
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 58 ALU, 2 TEX
PARAM c[11] = { program.local[0..8],
		{ 0, 2, 1, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[9].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[9].z;
POW R1.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R1.x, R1.w, c[7], R1;
MUL R0.xyz, R1.x, R0;
DP3_SAT R0.x, R0, c[10];
MOV R0.zw, c[9];
MUL R1.y, R0.x, R0.x;
MAD R0.y, -R1.w, c[2].x, R0.z;
MAD R0.y, R0, c[3].w, R1;
MIN R1.y, R0, c[9].z;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MOV_SAT R1.x, R1;
MUL R0.xyz, R0.x, fragment.texcoord[3];
ADD R1.z, -R1.y, c[9];
ABS R1.y, R0.z;
MUL R1.y, R1, R1.z;
MAX R2.x, R0.z, R1.y;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
RSQ R2.y, R1.y;
MAD R0.xyz, R2.y, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
MOV R0.y, c[5].x;
MAD R1.w, R1, c[7].x, R0.y;
ADD R1.x, -R1, c[9].z;
MUL R1.xyz, R1.x, c[3];
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R0.y, R0.w, c[4].x;
MAX R0.x, R0, c[9];
POW R0.w, R0.x, R0.y;
MOV R0.xyz, c[1];
MUL R0.w, R0, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R0.w;
MUL R1.xyz, R1, c[0];
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
MAD R0.xyz, R1, R2.x, R0;
TEX R0.w, R0.w, texture[1], 2D;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[9].y;
MOV result.color.w, c[9].x;
END
# 58 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
"ps_3_0
; 66 ALU, 3 TEX
dcl_cube s0
dcl_2d s1
def c9, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c10, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c9.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c9, -r0
mul_pp r1.w, r0.y, c9.z
add_pp r2.x, -r0, c9.y
pow_pp r0, r2.x, c8.x
texldl r1.xyz, r1, s0
mov_pp r2.x, r0
mov_pp r0.y, c6.x
mad_pp r0.w, r2.x, c7.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r0.y, r0, c10
mov_pp_sat r0.w, r0
mul_pp r0.z, r0.y, r0.y
mov_pp r0.x, c9.y
mad_pp r0.y, -r2.x, c2.x, r0.x
mad_pp r0.y, r0, c3.w, r0.z
min_pp r1.x, r0.y, c9.y
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
add_pp r1.y, -r1.x, c9
abs_pp r1.x, r0.z
mul_pp r1.x, r1, r1.y
max_pp r1.w, r0.z, r1.x
dp3_pp r1.x, v4, v4
rsq_pp r1.x, r1.x
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c9.y
mul_pp r1.xyz, r0.w, c3
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r2.z, c10.w, r0.y
max_pp r2.y, r0.x, c9.w
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c5.x
mad_pp r2.x, r2, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.xyz, c1, r0
mul_pp r0.w, r0, r2.x
mul_pp r2.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
dp3 r0.x, v5, v5
mad_pp r1.xyz, r1, r1.w, r2
texld r0.x, r0.x, s1
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c9.x
mov_pp oC0.w, c9
"
}

SubProgram "gles " {
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 53 ALU, 1 TEX
PARAM c[11] = { program.local[0..8],
		{ 0, 2, 1, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[9].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[9].z;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
POW R1.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R0.w, R1, c[7].x, R1.x;
MUL R0.xyz, R0.w, R0;
DP3_SAT R0.x, R0, c[10];
MOV R2.xy, c[9].zwzw;
MUL R0.y, R0.x, R0.x;
MAD R0.x, -R1.w, c[2], R2;
MAD R0.x, R0, c[3].w, R0.y;
MIN R0.x, R0, c[9].z;
ADD R0.y, -R0.x, c[9].z;
ABS R0.x, fragment.texcoord[3].z;
MUL R0.y, R0.x, R0;
MOV_SAT R0.x, R0.w;
MAX R0.w, fragment.texcoord[3].z, R0.y;
ADD R1.x, -R0, c[9].z;
RSQ R1.y, R1.y;
MOV R0.xyz, fragment.texcoord[3];
MAD R0.xyz, R1.y, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
MOV R0.y, c[5].x;
MAD R1.w, R1, c[7].x, R0.y;
MUL R1.xyz, R1.x, c[3];
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R0.y, R2, c[4].x;
MAX R0.x, R0, c[9];
POW R2.x, R0.x, R0.y;
MOV R0.xyz, c[1];
MUL R1.w, R2.x, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R1.w;
MUL R1.xyz, R1, c[0];
MAD R0.xyz, R1, R0.w, R0;
MUL result.color.xyz, R0, c[9].y;
MOV result.color.w, c[9].x;
END
# 53 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
"ps_3_0
; 62 ALU, 2 TEX
dcl_cube s0
def c9, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c10, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c9.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c9, -r0
mul_pp r1.w, r0.y, c9.z
add_pp r2.x, -r0, c9.y
pow_pp r0, r2.x, c8.x
mov_pp r2.x, r0
mov_pp r0.y, c6.x
mad_pp r0.x, r2, c7, r0.y
texldl r1.xyz, r1, s0
mul_pp r1.xyz, r0.x, r1
dp3_pp_sat r0.z, r1, c10
mov_pp_sat r0.w, r0.x
mov_pp r0.y, c9
dp3_pp r1.x, v4, v4
mul_pp r0.z, r0, r0
mad_pp r0.y, -r2.x, c2.x, r0
mad_pp r0.y, r0, c3.w, r0.z
min_pp r0.y, r0, c9
add_pp r0.z, -r0.y, c9.y
abs_pp r0.y, v3.z
mul_pp r0.y, r0, r0.z
max_pp r1.w, v3.z, r0.y
rsq_pp r1.x, r1.x
mov_pp r0.xyz, v3
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c9.y
mul_pp r1.xyz, r0.w, c3
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r2.z, c10.w, r0.y
max_pp r2.y, r0.x, c9.w
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c5.x
mad_pp r2.x, r2, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r2.x
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
mad_pp r0.xyz, r1, r1.w, r0
mul_pp oC0.xyz, r0, c9.x
mov_pp oC0.w, c9
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
SetTexture 2 [_LightTextureB0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 65 ALU, 3 TEX
PARAM c[11] = { program.local[0..8],
		{ 0, 0.5, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[9].z, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[9];
DP3 R2.x, fragment.texcoord[4], fragment.texcoord[4];
POW R0.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R1.x, R0.w, c[7], R1;
MUL R0.xyz, R1.x, R0;
DP3_SAT R0.y, R0, c[10];
MOV_SAT R1.x, R1;
MUL R0.z, R0.y, R0.y;
MOV R0.x, c[9].w;
MAD R0.y, -R0.w, c[2].x, R0.x;
MAD R0.y, R0, c[3].w, R0.z;
MIN R1.y, R0, c[9].w;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
ADD R1.z, -R1.y, c[9].w;
ABS R1.y, R0.z;
MUL R1.y, R1, R1.z;
MAX R1.w, R0.z, R1.y;
RSQ R2.x, R2.x;
MAD R0.xyz, R2.x, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
RSQ R0.y, R0.x;
MOV R2.x, c[5];
ADD R1.x, -R1, c[9].w;
MUL R1.xyz, R1.x, c[3];
MUL R1.xyz, R1, c[0];
MUL R0.y, R0, R0.z;
MOV R0.x, c[10].w;
MUL R0.z, R0.x, c[4].x;
MAD R0.w, R0, c[7].x, R2.x;
MAX R0.x, R0.y, c[9];
POW R2.x, R0.x, R0.z;
MOV R0.xyz, c[1];
MUL R0.w, R2.x, R0;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R0.w;
MAD R0.xyz, R1, R1.w, R0;
RCP R0.w, fragment.texcoord[5].w;
MAD R1.xy, fragment.texcoord[5], R0.w, c[9].y;
TEX R0.w, R1, texture[1], 2D;
DP3 R1.z, fragment.texcoord[5], fragment.texcoord[5];
SLT R1.x, c[9], fragment.texcoord[5].z;
TEX R1.w, R1.z, texture[2], 2D;
MUL R0.w, R1.x, R0;
MUL R0.w, R0, R1;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[9].z;
MOV result.color.w, c[9].x;
END
# 65 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
SetTexture 2 [_LightTextureB0] 2D
"ps_3_0
; 71 ALU, 4 TEX
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c9, 0.00000000, 1.00000000, 0.50000000, 2.00000000
def c10, 6.00000000, 0.21997070, 0.70703125, 0.07098389
def c11, 128.00000000, 0, 0, 0
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c9.w, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c9, -r0
mul_pp r1.w, r0.y, c10.x
add_pp r2.x, -r0, c9.y
pow_pp r0, r2.x, c8.x
texldl r1.xyz, r1, s0
mov_pp r1.w, r0.x
mov_pp r0.y, c6.x
mad_pp r0.w, r1, c7.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r0.y, r0, c10.yzww
mov_pp_sat r0.w, r0
mul_pp r0.z, r0.y, r0.y
mov_pp r0.x, c9.y
mad_pp r0.y, -r1.w, c2.x, r0.x
mad_pp r0.y, r0, c3.w, r0.z
min_pp r1.x, r0.y, c9.y
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
add_pp r1.y, -r1.x, c9
abs_pp r1.x, r0.z
mul_pp r1.x, r1, r1.y
max_pp r2.x, r0.z, r1
dp3_pp r1.x, v4, v4
rsq_pp r1.x, r1.x
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c9.y
mul_pp r1.xyz, r0.w, c3
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
max_pp r2.y, r0.x, c9.x
mul_pp r2.z, c11.x, r0.y
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c5.x
mad_pp r1.w, r1, c7.x, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r1
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
mad_pp r1.xyz, r1, r2.x, r0
rcp r0.w, v5.w
mad r2.xy, v5, r0.w, c9.z
dp3 r0.x, v5, v5
texld r0.w, r2, s1
cmp r0.y, -v5.z, c9.x, c9
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s2
mul_pp r0.x, r0.y, r0
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c9.w
mov_pp oC0.w, c9.x
"
}

SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTextureB0] 2D
SetTexture 2 [_LightTexture0] CUBE
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 60 ALU, 3 TEX
PARAM c[11] = { program.local[0..8],
		{ 0, 2, 1, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[9].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[9].z;
POW R1.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R1.x, R1.w, c[7], R1;
MUL R0.xyz, R1.x, R0;
DP3_SAT R0.x, R0, c[10];
MOV R2.xy, c[9].zwzw;
MUL R0.z, R0.x, R0.x;
MAD R0.y, -R1.w, c[2].x, R2.x;
MAD R0.y, R0, c[3].w, R0.z;
MIN R0.w, R0.y, c[9].z;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MOV_SAT R1.x, R1;
MUL R0.xyz, R0.x, fragment.texcoord[3];
ADD R1.y, -R0.w, c[9].z;
ABS R0.w, R0.z;
MUL R0.w, R0, R1.y;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
MAX R0.w, R0.z, R0;
RSQ R1.y, R1.y;
MAD R0.xyz, R1.y, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
MOV R0.y, c[5].x;
MAD R1.w, R1, c[7].x, R0.y;
ADD R1.x, -R1, c[9].z;
MUL R1.xyz, R1.x, c[3];
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R0.y, R2, c[4].x;
MAX R0.x, R0, c[9];
POW R2.x, R0.x, R0.y;
MOV R0.xyz, c[1];
MUL R1.w, R2.x, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R1.w;
MUL R1.xyz, R1, c[0];
MAD R0.xyz, R1, R0.w, R0;
DP3 R1.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R0.w, fragment.texcoord[5], texture[2], CUBE;
TEX R1.w, R1.x, texture[1], 2D;
MUL R0.w, R1, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[9].y;
MOV result.color.w, c[9].x;
END
# 60 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTextureB0] 2D
SetTexture 2 [_LightTexture0] CUBE
"ps_3_0
; 67 ALU, 4 TEX
dcl_cube s0
dcl_2d s1
dcl_cube s2
def c9, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c10, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c9.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c9, -r0
mul_pp r1.w, r0.y, c9.z
add_pp r2.x, -r0, c9.y
pow_pp r0, r2.x, c8.x
texldl r1.xyz, r1, s0
mov_pp r2.x, r0
mov_pp r0.y, c6.x
mad_pp r0.w, r2.x, c7.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r0.y, r0, c10
mov_pp_sat r0.w, r0
mul_pp r0.z, r0.y, r0.y
mov_pp r0.x, c9.y
mad_pp r0.y, -r2.x, c2.x, r0.x
mad_pp r0.y, r0, c3.w, r0.z
min_pp r1.x, r0.y, c9.y
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
add_pp r1.y, -r1.x, c9
abs_pp r1.x, r0.z
mul_pp r1.x, r1, r1.y
max_pp r1.w, r0.z, r1.x
dp3_pp r1.y, v4, v4
rsq_pp r1.x, r1.y
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c9.y
mul_pp r1.xyz, r0.w, c3
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r2.z, c10.w, r0.y
max_pp r2.y, r0.x, c9.w
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c5.x
mad_pp r2.x, r2, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r2.x
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
mad_pp r1.xyz, r1, r1.w, r0
dp3 r0.x, v5, v5
texld r0.w, v5, s2
texld r0.x, r0.x, s1
mul r0.x, r0, r0.w
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c9.x
mov_pp oC0.w, c9
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 55 ALU, 2 TEX
PARAM c[11] = { program.local[0..8],
		{ 0, 2, 1, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[9].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[9].z;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
POW R1.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R0.w, R1, c[7].x, R1.x;
MUL R0.xyz, R0.w, R0;
DP3_SAT R0.x, R0, c[10];
MOV R2.xy, c[9].zwzw;
MUL R0.y, R0.x, R0.x;
MAD R0.x, -R1.w, c[2], R2;
MAD R0.x, R0, c[3].w, R0.y;
MIN R0.x, R0, c[9].z;
ADD R0.y, -R0.x, c[9].z;
ABS R0.x, fragment.texcoord[3].z;
MUL R0.y, R0.x, R0;
MOV_SAT R0.x, R0.w;
MAX R0.w, fragment.texcoord[3].z, R0.y;
ADD R1.x, -R0, c[9].z;
RSQ R1.y, R1.y;
MOV R0.xyz, fragment.texcoord[3];
MAD R0.xyz, R1.y, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
MOV R0.y, c[5].x;
MAD R1.w, R1, c[7].x, R0.y;
MUL R1.xyz, R1.x, c[3];
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R0.y, R2, c[4].x;
MAX R0.x, R0, c[9];
POW R2.x, R0.x, R0.y;
MOV R0.xyz, c[1];
MUL R1.w, R2.x, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R1.w;
MUL R1.xyz, R1, c[0];
MAD R0.xyz, R1, R0.w, R0;
TEX R0.w, fragment.texcoord[5], texture[1], 2D;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[9].y;
MOV result.color.w, c[9].x;
END
# 55 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
"ps_3_0
; 63 ALU, 3 TEX
dcl_cube s0
dcl_2d s1
def c9, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c10, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xy
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c9.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c9, -r0
mul_pp r1.w, r0.y, c9.z
add_pp r2.x, -r0, c9.y
pow_pp r0, r2.x, c8.x
mov_pp r2.x, r0
mov_pp r0.y, c6.x
mad_pp r0.x, r2, c7, r0.y
texldl r1.xyz, r1, s0
mul_pp r1.xyz, r0.x, r1
dp3_pp_sat r0.z, r1, c10
mov_pp_sat r0.w, r0.x
mov_pp r0.y, c9
dp3_pp r1.x, v4, v4
mul_pp r0.z, r0, r0
mad_pp r0.y, -r2.x, c2.x, r0
mad_pp r0.y, r0, c3.w, r0.z
min_pp r0.y, r0, c9
add_pp r0.z, -r0.y, c9.y
abs_pp r0.y, v3.z
mul_pp r0.y, r0, r0.z
max_pp r1.w, v3.z, r0.y
rsq_pp r1.x, r1.x
mov_pp r0.xyz, v3
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c9.y
mul_pp r1.xyz, r0.w, c3
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r2.z, c10.w, r0.y
max_pp r2.y, r0.x, c9.w
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c5.x
mad_pp r2.x, r2, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r2.x
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
mad_pp r0.xyz, r1, r1.w, r0
texld r0.w, v5, s1
mul_pp r0.xyz, r0.w, r0
mul_pp oC0.xyz, r0, c9.x
mov_pp oC0.w, c9
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_LightShadowData]
Float 3 [_EdgeAlpha]
Vector 4 [_Color]
Float 5 [_Shininess]
Float 6 [_Gloss]
Float 7 [_Reflection]
Float 8 [_FrezPow]
Float 9 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
SetTexture 2 [_LightTextureB0] 2D
SetTexture 3 [_ShadowMapTexture] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 71 ALU, 4 TEX
PARAM c[12] = { program.local[0..9],
		{ 0, 0.5, 1, 2 },
		{ 0.2199707, 0.70703125, 0.070983887, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[10].w, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[10].z;
POW R1.w, R0.w, c[9].x;
MOV R1.x, c[7];
MAD R1.x, R1.w, c[8], R1;
MUL R0.xyz, R1.x, R0;
DP3_SAT R0.y, R0, c[11];
MOV_SAT R1.x, R1;
MUL R0.z, R0.y, R0.y;
MOV R0.x, c[10].z;
MAD R0.y, -R1.w, c[3].x, R0.x;
MAD R0.y, R0, c[4].w, R0.z;
MIN R0.w, R0.y, c[10].z;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
ADD R1.y, -R0.w, c[10].z;
ABS R0.w, R0.z;
MUL R0.w, R0, R1.y;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
MAX R0.w, R0.z, R0;
RSQ R2.x, R1.y;
MAD R0.xyz, R2.x, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
RSQ R0.y, R0.x;
MOV R2.x, c[6];
ADD R1.x, -R1, c[10].z;
MUL R1.xyz, R1.x, c[4];
MUL R0.y, R0, R0.z;
MOV R0.x, c[11].w;
MUL R0.z, R0.x, c[5].x;
MAD R1.w, R1, c[8].x, R2.x;
MAX R0.x, R0.y, c[10];
POW R2.x, R0.x, R0.z;
MOV R0.xyz, c[1];
MUL R1.w, R2.x, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R1.w;
MUL R1.xyz, R1, c[0];
MAD R1.xyz, R1, R0.w, R0;
TXP R0.x, fragment.texcoord[6], texture[3], 2D;
RCP R0.y, fragment.texcoord[6].w;
MAD R0.z, -fragment.texcoord[6], R0.y, R0.x;
MOV R0.x, c[10].z;
RCP R0.y, fragment.texcoord[5].w;
CMP R0.x, R0.z, c[2], R0;
MAD R0.zw, fragment.texcoord[5].xyxy, R0.y, c[10].y;
DP3 R0.y, fragment.texcoord[5], fragment.texcoord[5];
TEX R1.w, R0.y, texture[2], 2D;
TEX R0.w, R0.zwzw, texture[1], 2D;
SLT R0.y, c[10].x, fragment.texcoord[5].z;
MUL R0.y, R0, R0.w;
MUL R0.y, R0, R1.w;
MUL R0.x, R0.y, R0;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[10].w;
MOV result.color.w, c[10].x;
END
# 71 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_LightShadowData]
Float 3 [_EdgeAlpha]
Vector 4 [_Color]
Float 5 [_Shininess]
Float 6 [_Gloss]
Float 7 [_Reflection]
Float 8 [_FrezPow]
Float 9 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
SetTexture 2 [_LightTextureB0] 2D
SetTexture 3 [_ShadowMapTexture] 2D
"ps_3_0
; 76 ALU, 5 TEX
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c10, 0.00000000, 1.00000000, 0.50000000, 2.00000000
def c11, 6.00000000, 0.21997070, 0.70703125, 0.07098389
def c12, 128.00000000, 0, 0, 0
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c10.w, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c5.x
add_pp r0.y, c10, -r0
mul_pp r1.w, r0.y, c11.x
add_pp r2.x, -r0, c10.y
pow_pp r0, r2.x, c9.x
texldl r1.xyz, r1, s0
mov_pp r2.x, r0
mov_pp r0.y, c7.x
mad_pp r0.w, r2.x, c8.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r0.y, r0, c11.yzww
mov_pp_sat r0.w, r0
mul_pp r0.z, r0.y, r0.y
mov_pp r0.x, c10.y
mad_pp r0.y, -r2.x, c3.x, r0.x
mad_pp r0.y, r0, c4.w, r0.z
min_pp r1.x, r0.y, c10.y
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
add_pp r1.y, -r1.x, c10
abs_pp r1.x, r0.z
mul_pp r1.x, r1, r1.y
max_pp r1.w, r0.z, r1.x
dp3_pp r1.y, v4, v4
rsq_pp r1.x, r1.y
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c10.y
mul_pp r1.xyz, r0.w, c4
mov_pp r0.y, c5.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
max_pp r2.y, r0.x, c10.x
mul_pp r2.z, c12.x, r0.y
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c6.x
mad_pp r2.x, r2, c8, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r2.x
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
mad_pp r1.xyz, r1, r1.w, r0
texldp r0.x, v6, s3
rcp r0.y, v6.w
mad r0.y, -v6.z, r0, r0.x
mov r0.z, c2.x
cmp r0.y, r0, c10, r0.z
rcp r0.x, v5.w
mad r2.xy, v5, r0.x, c10.z
dp3 r0.x, v5, v5
texld r0.w, r2, s1
cmp r0.z, -v5, c10.x, c10.y
mul_pp r0.z, r0, r0.w
texld r0.x, r0.x, s2
mul_pp r0.x, r0.z, r0
mul_pp r0.x, r0, r0.y
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c10.w
mov_pp oC0.w, c10.x
"
}

SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"!!GLES"
}

SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_LightShadowData]
Float 3 [_EdgeAlpha]
Vector 4 [_Color]
Float 5 [_Shininess]
Float 6 [_Gloss]
Float 7 [_Reflection]
Float 8 [_FrezPow]
Float 9 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
SetTexture 2 [_LightTextureB0] 2D
SetTexture 3 [_ShadowMapTexture] 2D
"ps_3_0
; 75 ALU, 5 TEX
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c10, 0.00000000, 1.00000000, 0.50000000, 2.00000000
def c11, 6.00000000, 0.21997070, 0.70703125, 0.07098389
def c12, 128.00000000, 0, 0, 0
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c10.w, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c5.x
add_pp r0.y, c10, -r0
mul_pp r1.w, r0.y, c11.x
add_pp r2.x, -r0, c10.y
pow_pp r0, r2.x, c9.x
texldl r1.xyz, r1, s0
mov_pp r2.x, r0
mov_pp r0.y, c7.x
mad_pp r0.w, r2.x, c8.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r0.y, r0, c11.yzww
mov_pp_sat r0.w, r0
mul_pp r0.z, r0.y, r0.y
mov_pp r0.x, c10.y
mad_pp r0.y, -r2.x, c3.x, r0.x
mad_pp r0.y, r0, c4.w, r0.z
min_pp r1.x, r0.y, c10.y
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
add_pp r1.y, -r1.x, c10
abs_pp r1.x, r0.z
mul_pp r1.x, r1, r1.y
max_pp r1.w, r0.z, r1.x
dp3_pp r1.y, v4, v4
rsq_pp r1.x, r1.y
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c10.y
mul_pp r1.xyz, r0.w, c4
mov_pp r0.y, c5.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
max_pp r2.y, r0.x, c10.x
mul_pp r2.z, c12.x, r0.y
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c6.x
mad_pp r2.x, r2, c8, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r2.x
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
mad_pp r1.xyz, r1, r1.w, r0
mov r0.x, c2
rcp r0.z, v5.w
mad r2.xy, v5, r0.z, c10.z
add r0.y, c10, -r0.x
texldp r0.x, v6, s3
mad r0.y, r0.x, r0, c2.x
dp3 r0.x, v5, v5
texld r0.w, r2, s1
cmp r0.z, -v5, c10.x, c10.y
mul_pp r0.z, r0, r0.w
texld r0.x, r0.x, s2
mul_pp r0.x, r0.z, r0
mul_pp r0.x, r0, r0.y
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c10.w
mov_pp oC0.w, c10.x
"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 55 ALU, 2 TEX
PARAM c[11] = { program.local[0..8],
		{ 0, 2, 1, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[9].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[9].z;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
POW R1.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R0.w, R1, c[7].x, R1.x;
MUL R0.xyz, R0.w, R0;
DP3_SAT R0.x, R0, c[10];
MOV R2.xy, c[9].zwzw;
MUL R0.y, R0.x, R0.x;
MAD R0.x, -R1.w, c[2], R2;
MAD R0.x, R0, c[3].w, R0.y;
MIN R0.x, R0, c[9].z;
ADD R0.y, -R0.x, c[9].z;
ABS R0.x, fragment.texcoord[3].z;
MUL R0.y, R0.x, R0;
MOV_SAT R0.x, R0.w;
MAX R0.w, fragment.texcoord[3].z, R0.y;
ADD R1.x, -R0, c[9].z;
RSQ R1.y, R1.y;
MOV R0.xyz, fragment.texcoord[3];
MAD R0.xyz, R1.y, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
MOV R0.y, c[5].x;
MAD R1.w, R1, c[7].x, R0.y;
MUL R1.xyz, R1.x, c[3];
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R0.y, R2, c[4].x;
MAX R0.x, R0, c[9];
POW R2.x, R0.x, R0.y;
MOV R0.xyz, c[1];
MUL R1.w, R2.x, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R1.w;
MUL R1.xyz, R1, c[0];
MAD R1.xyz, R1, R0.w, R0;
TXP R0.x, fragment.texcoord[5], texture[1], 2D;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[9].y;
MOV result.color.w, c[9].x;
END
# 55 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] 2D
"ps_3_0
; 63 ALU, 3 TEX
dcl_cube s0
dcl_2d s1
def c9, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c10, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c9.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c9, -r0
mul_pp r1.w, r0.y, c9.z
add_pp r2.x, -r0, c9.y
pow_pp r0, r2.x, c8.x
mov_pp r2.x, r0
mov_pp r0.y, c6.x
mad_pp r0.x, r2, c7, r0.y
texldl r1.xyz, r1, s0
mul_pp r1.xyz, r0.x, r1
dp3_pp_sat r0.z, r1, c10
mov_pp_sat r0.w, r0.x
mov_pp r0.y, c9
dp3_pp r1.x, v4, v4
mul_pp r0.z, r0, r0
mad_pp r0.y, -r2.x, c2.x, r0
mad_pp r0.y, r0, c3.w, r0.z
min_pp r0.y, r0, c9
add_pp r0.z, -r0.y, c9.y
abs_pp r0.y, v3.z
mul_pp r0.y, r0, r0.z
max_pp r1.w, v3.z, r0.y
rsq_pp r1.x, r1.x
mov_pp r0.xyz, v3
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c9.y
mul_pp r1.xyz, r0.w, c3
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r2.z, c10.w, r0.y
max_pp r2.y, r0.x, c9.w
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c5.x
mad_pp r2.x, r2, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r2.x
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
mad_pp r1.xyz, r1, r1.w, r0
texldp r0.x, v5, s1
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c9.x
mov_pp oC0.w, c9
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] 2D
SetTexture 2 [_LightTexture0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 57 ALU, 3 TEX
PARAM c[11] = { program.local[0..8],
		{ 0, 2, 1, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[9].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[9].z;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
POW R1.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R0.w, R1, c[7].x, R1.x;
MUL R0.xyz, R0.w, R0;
DP3_SAT R0.x, R0, c[10];
MOV R2.xy, c[9].zwzw;
MUL R0.y, R0.x, R0.x;
MAD R0.x, -R1.w, c[2], R2;
MAD R0.x, R0, c[3].w, R0.y;
MIN R0.x, R0, c[9].z;
ADD R0.y, -R0.x, c[9].z;
ABS R0.x, fragment.texcoord[3].z;
MUL R0.y, R0.x, R0;
MOV_SAT R0.x, R0.w;
MAX R0.w, fragment.texcoord[3].z, R0.y;
ADD R1.x, -R0, c[9].z;
RSQ R1.y, R1.y;
MOV R0.xyz, fragment.texcoord[3];
MAD R0.xyz, R1.y, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
MOV R0.y, c[5].x;
MAD R1.w, R1, c[7].x, R0.y;
MUL R1.xyz, R1.x, c[3];
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R0.y, R2, c[4].x;
MAX R0.x, R0, c[9];
POW R2.x, R0.x, R0.y;
MOV R0.xyz, c[1];
MUL R1.w, R2.x, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R1.w;
MUL R1.xyz, R1, c[0];
MAD R1.xyz, R1, R0.w, R0;
TXP R0.x, fragment.texcoord[6], texture[1], 2D;
TEX R0.w, fragment.texcoord[5], texture[2], 2D;
MUL R0.x, R0.w, R0;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[9].y;
MOV result.color.w, c[9].x;
END
# 57 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] 2D
SetTexture 2 [_LightTexture0] 2D
"ps_3_0
; 64 ALU, 4 TEX
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c9, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c10, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xy
dcl_texcoord6 v6
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c9.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c9, -r0
mul_pp r1.w, r0.y, c9.z
add_pp r2.x, -r0, c9.y
pow_pp r0, r2.x, c8.x
mov_pp r2.x, r0
mov_pp r0.y, c6.x
mad_pp r0.x, r2, c7, r0.y
texldl r1.xyz, r1, s0
mul_pp r1.xyz, r0.x, r1
dp3_pp_sat r0.z, r1, c10
mov_pp_sat r0.w, r0.x
mov_pp r0.y, c9
dp3_pp r1.x, v4, v4
mul_pp r0.z, r0, r0
mad_pp r0.y, -r2.x, c2.x, r0
mad_pp r0.y, r0, c3.w, r0.z
min_pp r0.y, r0, c9
add_pp r0.z, -r0.y, c9.y
abs_pp r0.y, v3.z
mul_pp r0.y, r0, r0.z
max_pp r1.w, v3.z, r0.y
rsq_pp r1.x, r1.x
mov_pp r0.xyz, v3
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c9.y
mul_pp r1.xyz, r0.w, c3
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r2.z, c10.w, r0.y
max_pp r2.y, r0.x, c9.w
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c5.x
mad_pp r2.x, r2, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r2.x
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
mad_pp r1.xyz, r1, r1.w, r0
texldp r0.x, v6, s1
texld r0.w, v5, s2
mul r0.x, r0.w, r0
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c9.x
mov_pp oC0.w, c9
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
Vector 1 [_LightColor0]
Vector 2 [_SpecColor]
Vector 3 [_LightShadowData]
Float 4 [_EdgeAlpha]
Vector 5 [_Color]
Float 6 [_Shininess]
Float 7 [_Gloss]
Float 8 [_Reflection]
Float 9 [_FrezPow]
Float 10 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] CUBE
SetTexture 2 [_LightTexture0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 69 ALU, 3 TEX
PARAM c[14] = { program.local[0..10],
		{ 0, 0.97000003, 1, 2 },
		{ 1, 0.0039215689, 1.53787e-005, 6.2273724e-009 },
		{ 0.2199707, 0.70703125, 0.070983887, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[11].w, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[11].z;
DP3 R2.x, fragment.texcoord[4], fragment.texcoord[4];
POW R0.w, R0.w, c[10].x;
MOV R1.x, c[8];
MAD R1.x, R0.w, c[9], R1;
MUL R0.xyz, R1.x, R0;
DP3_SAT R0.y, R0, c[13];
MOV_SAT R1.x, R1;
MUL R0.z, R0.y, R0.y;
MOV R0.x, c[11].z;
MAD R0.y, -R0.w, c[4].x, R0.x;
MAD R0.y, R0, c[5].w, R0.z;
MIN R1.y, R0, c[11].z;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
ADD R1.z, -R1.y, c[11];
ABS R1.y, R0.z;
MUL R1.y, R1, R1.z;
MAX R1.w, R0.z, R1.y;
RSQ R2.x, R2.x;
MAD R0.xyz, R2.x, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
RSQ R0.y, R0.x;
MOV R2.x, c[7];
ADD R1.x, -R1, c[11].z;
MUL R1.xyz, R1.x, c[5];
MUL R0.y, R0, R0.z;
MOV R0.x, c[13].w;
MUL R0.z, R0.x, c[6].x;
MAD R0.w, R0, c[9].x, R2.x;
MAX R0.x, R0.y, c[11];
POW R2.x, R0.x, R0.z;
MOV R0.xyz, c[2];
MUL R0.w, R2.x, R0;
MUL R0.xyz, R0, c[1];
MUL R0.xyz, R0, R0.w;
MUL R1.xyz, R1, c[1];
MAD R1.xyz, R1, R1.w, R0;
DP3 R0.w, fragment.texcoord[6], fragment.texcoord[6];
RSQ R1.w, R0.w;
TEX R0, fragment.texcoord[6], texture[1], CUBE;
DP4 R0.y, R0, c[12];
RCP R1.w, R1.w;
MUL R0.x, R1.w, c[0].w;
MAD R0.z, -R0.x, c[11].y, R0.y;
DP3 R0.y, fragment.texcoord[5], fragment.texcoord[5];
MOV R0.x, c[11].z;
CMP R0.x, R0.z, c[3], R0;
TEX R0.w, R0.y, texture[2], 2D;
MUL R0.x, R0.w, R0;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[11].w;
MOV result.color.w, c[11].x;
END
# 69 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
Vector 1 [_LightColor0]
Vector 2 [_SpecColor]
Vector 3 [_LightShadowData]
Float 4 [_EdgeAlpha]
Vector 5 [_Color]
Float 6 [_Shininess]
Float 7 [_Gloss]
Float 8 [_Reflection]
Float 9 [_FrezPow]
Float 10 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] CUBE
SetTexture 2 [_LightTexture0] 2D
"ps_3_0
; 75 ALU, 4 TEX
dcl_cube s0
dcl_cube s1
dcl_2d s2
def c11, 1.00000000, 0.00392157, 0.00001538, 0.00000001
def c12, 0.97000003, 2.00000000, 6.00000000, 0.00000000
def c13, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c12.y, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c6.x
add_pp r0.y, c11.x, -r0
mul_pp r1.w, r0.y, c12.z
add_pp r2.x, -r0, c11
pow_pp r0, r2.x, c10.x
texldl r1.xyz, r1, s0
mov_pp r1.w, r0.x
mov_pp r0.y, c8.x
mad_pp r0.w, r1, c9.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r0.y, r0, c13
mov_pp_sat r0.w, r0
mul_pp r0.z, r0.y, r0.y
mov_pp r0.x, c11
mad_pp r0.y, -r1.w, c4.x, r0.x
mad_pp r0.y, r0, c5.w, r0.z
min_pp r1.x, r0.y, c11
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
add_pp r1.y, -r1.x, c11.x
abs_pp r1.x, r0.z
mul_pp r1.x, r1, r1.y
max_pp r2.x, r0.z, r1
dp3_pp r1.x, v4, v4
rsq_pp r1.x, r1.x
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c11.x
mul_pp r1.xyz, r0.w, c5
mov_pp r0.y, c6.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r1.xyz, r1, c1
mul_pp r2.z, c13.w, r0.y
max_pp r2.y, r0.x, c12.w
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c7.x
mad_pp r1.w, r1, c9.x, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c1
mul_pp r0.w, r0, r1
mul_pp r0.xyz, c2, r0
mul_pp r0.xyz, r0, r0.w
dp3 r0.w, v6, v6
rsq r1.w, r0.w
mad_pp r1.xyz, r1, r2.x, r0
texld r0, v6, s1
dp4 r0.y, r0, c11
rcp r1.w, r1.w
mul r0.x, r1.w, c0.w
mad r0.y, -r0.x, c12.x, r0
mov r0.z, c3.x
dp3 r0.x, v5, v5
cmp r0.y, r0, c11.x, r0.z
texld r0.x, r0.x, s2
mul r0.x, r0, r0.y
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c12.y
mov_pp oC0.w, c12
"
}

SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
Vector 1 [_LightColor0]
Vector 2 [_SpecColor]
Vector 3 [_LightShadowData]
Float 4 [_EdgeAlpha]
Vector 5 [_Color]
Float 6 [_Shininess]
Float 7 [_Gloss]
Float 8 [_Reflection]
Float 9 [_FrezPow]
Float 10 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] CUBE
SetTexture 2 [_LightTextureB0] 2D
SetTexture 3 [_LightTexture0] CUBE
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 71 ALU, 4 TEX
PARAM c[14] = { program.local[0..10],
		{ 0, 0.97000003, 1, 2 },
		{ 1, 0.0039215689, 1.53787e-005, 6.2273724e-009 },
		{ 0.2199707, 0.70703125, 0.070983887, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[11].w, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[11].z;
POW R1.w, R0.w, c[10].x;
MOV R1.x, c[8];
MAD R1.x, R1.w, c[9], R1;
MUL R0.xyz, R1.x, R0;
DP3_SAT R0.y, R0, c[13];
MOV_SAT R1.x, R1;
MUL R0.z, R0.y, R0.y;
MOV R0.x, c[11].z;
MAD R0.y, -R1.w, c[4].x, R0.x;
MAD R0.y, R0, c[5].w, R0.z;
MIN R0.w, R0.y, c[11].z;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
ADD R1.y, -R0.w, c[11].z;
ABS R0.w, R0.z;
MUL R0.w, R0, R1.y;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
MAX R0.w, R0.z, R0;
RSQ R2.x, R1.y;
MAD R0.xyz, R2.x, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
RSQ R0.y, R0.x;
MOV R2.x, c[7];
ADD R1.x, -R1, c[11].z;
MUL R1.xyz, R1.x, c[5];
MUL R0.y, R0, R0.z;
MOV R0.x, c[13].w;
MUL R0.z, R0.x, c[6].x;
MAD R1.w, R1, c[9].x, R2.x;
MAX R0.x, R0.y, c[11];
POW R2.x, R0.x, R0.z;
MOV R0.xyz, c[2];
MUL R1.w, R2.x, R1;
MUL R0.xyz, R0, c[1];
MUL R0.xyz, R0, R1.w;
MUL R1.xyz, R1, c[1];
MAD R0.xyz, R1, R0.w, R0;
TEX R1, fragment.texcoord[6], texture[1], CUBE;
DP3 R0.w, fragment.texcoord[6], fragment.texcoord[6];
DP4 R1.y, R1, c[12];
RSQ R0.w, R0.w;
RCP R1.x, R0.w;
MUL R1.x, R1, c[0].w;
MAD R1.x, -R1, c[11].y, R1.y;
MOV R0.w, c[11].z;
CMP R1.y, R1.x, c[3].x, R0.w;
DP3 R1.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R0.w, fragment.texcoord[5], texture[3], CUBE;
TEX R1.w, R1.x, texture[2], 2D;
MUL R0.w, R1, R0;
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[11].w;
MOV result.color.w, c[11].x;
END
# 71 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
Vector 1 [_LightColor0]
Vector 2 [_SpecColor]
Vector 3 [_LightShadowData]
Float 4 [_EdgeAlpha]
Vector 5 [_Color]
Float 6 [_Shininess]
Float 7 [_Gloss]
Float 8 [_Reflection]
Float 9 [_FrezPow]
Float 10 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] CUBE
SetTexture 2 [_LightTextureB0] 2D
SetTexture 3 [_LightTexture0] CUBE
"ps_3_0
; 76 ALU, 5 TEX
dcl_cube s0
dcl_cube s1
dcl_2d s2
dcl_cube s3
def c11, 1.00000000, 0.00392157, 0.00001538, 0.00000001
def c12, 0.97000003, 2.00000000, 6.00000000, 0.00000000
def c13, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c12.y, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c6.x
add_pp r0.y, c11.x, -r0
mul_pp r1.w, r0.y, c12.z
add_pp r2.x, -r0, c11
pow_pp r0, r2.x, c10.x
texldl r1.xyz, r1, s0
mov_pp r2.x, r0
mov_pp r0.y, c8.x
mad_pp r0.w, r2.x, c9.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r0.y, r0, c13
mov_pp_sat r0.w, r0
mul_pp r0.z, r0.y, r0.y
mov_pp r0.x, c11
mad_pp r0.y, -r2.x, c4.x, r0.x
mad_pp r0.y, r0, c5.w, r0.z
min_pp r1.x, r0.y, c11
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
add_pp r1.y, -r1.x, c11.x
abs_pp r1.x, r0.z
mul_pp r1.x, r1, r1.y
max_pp r1.w, r0.z, r1.x
dp3_pp r1.y, v4, v4
rsq_pp r1.x, r1.y
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c11.x
mul_pp r1.xyz, r0.w, c5
mov_pp r0.y, c6.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r2.z, c13.w, r0.y
max_pp r2.y, r0.x, c12.w
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c7.x
mad_pp r2.x, r2, c9, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c1
mul_pp r0.w, r0, r2.x
mul_pp r0.xyz, c2, r0
mul_pp r0.xyz, r0, r0.w
mul_pp r1.xyz, r1, c1
mad_pp r1.xyz, r1, r1.w, r0
texld r0, v6, s1
dp4 r0.y, r0, c11
dp3 r1.w, v6, v6
rsq r1.w, r1.w
rcp r0.x, r1.w
mul r0.x, r0, c0.w
mad r0.x, -r0, c12, r0.y
mov r0.z, c3.x
cmp r0.y, r0.x, c11.x, r0.z
dp3 r0.x, v5, v5
texld r0.w, v5, s3
texld r0.x, r0.x, s2
mul r0.x, r0, r0.w
mul r0.x, r0, r0.y
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c12.y
mov_pp oC0.w, c12
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_LightShadowData]
Vector 3 [_ShadowOffsets0]
Vector 4 [_ShadowOffsets1]
Vector 5 [_ShadowOffsets2]
Vector 6 [_ShadowOffsets3]
Float 7 [_EdgeAlpha]
Vector 8 [_Color]
Float 9 [_Shininess]
Float 10 [_Gloss]
Float 11 [_Reflection]
Float 12 [_FrezPow]
Float 13 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
SetTexture 2 [_LightTextureB0] 2D
SetTexture 3 [_ShadowMapTexture] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 82 ALU, 7 TEX
PARAM c[17] = { program.local[0..13],
		{ 0, 0.5, 1, 0.25 },
		{ 2, 0.2199707, 0.70703125, 0.070983887 },
		{ 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[15].x, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[14].z;
DP3 R2.x, fragment.texcoord[4], fragment.texcoord[4];
POW R1.w, R0.w, c[13].x;
MOV R1.x, c[11];
MAD R0.w, R1, c[12].x, R1.x;
MUL R0.xyz, R0.w, R0;
DP3_SAT R0.y, R0, c[15].yzww;
MUL R0.z, R0.y, R0.y;
MOV R0.x, c[14].z;
MAD R0.y, -R1.w, c[7].x, R0.x;
MAD R0.y, R0, c[8].w, R0.z;
MIN R1.x, R0.y, c[14].z;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
ADD R1.y, -R1.x, c[14].z;
ABS R1.x, R0.z;
MUL R1.y, R1.x, R1;
MOV_SAT R1.x, R0.w;
MAX R0.w, R0.z, R1.y;
RSQ R2.x, R2.x;
MAD R0.xyz, R2.x, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
RSQ R0.y, R0.x;
MOV R2.x, c[10];
ADD R1.x, -R1, c[14].z;
MUL R1.xyz, R1.x, c[8];
MAD R1.w, R1, c[12].x, R2.x;
MUL R0.y, R0, R0.z;
MOV R0.x, c[16];
MUL R0.z, R0.x, c[9].x;
MAX R0.x, R0.y, c[14];
POW R2.x, R0.x, R0.z;
MUL R2.x, R2, R1.w;
MOV R0.xyz, c[1];
MUL R0.xyz, R0, c[0];
RCP R1.w, fragment.texcoord[6].w;
MUL R2.xyz, R0, R2.x;
MAD R0.xy, fragment.texcoord[6], R1.w, c[6];
MUL R1.xyz, R1, c[0];
MAD R1.xyz, R1, R0.w, R2;
TEX R0.x, R0, texture[3], 2D;
MAD R2.xy, fragment.texcoord[6], R1.w, c[5];
MOV R0.w, R0.x;
TEX R0.x, R2, texture[3], 2D;
MAD R2.xy, fragment.texcoord[6], R1.w, c[4];
MOV R0.z, R0.x;
TEX R0.x, R2, texture[3], 2D;
MAD R2.xy, fragment.texcoord[6], R1.w, c[3];
MOV R0.y, R0.x;
TEX R0.x, R2, texture[3], 2D;
MAD R0, -fragment.texcoord[6].z, R1.w, R0;
MOV R2.x, c[14].z;
CMP R0, R0, c[2].x, R2.x;
DP4 R0.x, R0, c[14].w;
RCP R1.w, fragment.texcoord[5].w;
MAD R0.zw, fragment.texcoord[5].xyxy, R1.w, c[14].y;
DP3 R0.y, fragment.texcoord[5], fragment.texcoord[5];
TEX R1.w, R0.y, texture[2], 2D;
TEX R0.w, R0.zwzw, texture[1], 2D;
SLT R0.y, c[14].x, fragment.texcoord[5].z;
MUL R0.y, R0, R0.w;
MUL R0.y, R0, R1.w;
MUL R0.x, R0.y, R0;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[15].x;
MOV result.color.w, c[14].x;
END
# 82 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_LightShadowData]
Vector 3 [_ShadowOffsets0]
Vector 4 [_ShadowOffsets1]
Vector 5 [_ShadowOffsets2]
Vector 6 [_ShadowOffsets3]
Float 7 [_EdgeAlpha]
Vector 8 [_Color]
Float 9 [_Shininess]
Float 10 [_Gloss]
Float 11 [_Reflection]
Float 12 [_FrezPow]
Float 13 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
SetTexture 2 [_LightTextureB0] 2D
SetTexture 3 [_ShadowMapTexture] 2D
"ps_3_0
; 84 ALU, 8 TEX
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c14, 0.00000000, 1.00000000, 0.50000000, 0.25000000
def c15, 2.00000000, 6.00000000, 128.00000000, 0
def c16, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c15.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c9.x
add_pp r0.y, c14, -r0
mul_pp r1.w, r0.y, c15.y
add_pp r2.x, -r0, c14.y
pow_pp r0, r2.x, c13.x
texldl r1.xyz, r1, s0
mov_pp r1.w, r0.x
mov_pp r0.y, c11.x
mad_pp r0.w, r1, c12.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r0.y, r0, c16
mov_pp_sat r0.w, r0
mul_pp r0.z, r0.y, r0.y
mov_pp r0.x, c14.y
mad_pp r0.y, -r1.w, c7.x, r0.x
mad_pp r0.y, r0, c8.w, r0.z
min_pp r1.x, r0.y, c14.y
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
add_pp r1.y, -r1.x, c14
abs_pp r1.x, r0.z
mul_pp r1.x, r1, r1.y
max_pp r2.w, r0.z, r1.x
dp3_pp r1.x, v4, v4
rsq_pp r1.x, r1.x
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c14.y
mul_pp r1.xyz, r0.w, c8
mov_pp r0.y, c9.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r2.y, c15.z, r0
max_pp r2.x, r0, c14
pow_pp r0, r2.x, r2.y
mov_pp r0.y, c10.x
mad_pp r1.w, r1, c12.x, r0.y
mov_pp r0.w, r0.x
mul_pp r0.w, r0, r1
mov_pp r0.xyz, c0
mul_pp r0.xyz, c1, r0
rcp r1.w, v6.w
mul_pp r2.xyz, r0, r0.w
mad r0.xy, v6, r1.w, c6
texld r0.x, r0, s3
mul_pp r1.xyz, r1, c0
mad_pp r1.xyz, r1, r2.w, r2
mad r2.xy, v6, r1.w, c5
mov r0.w, r0.x
texld r0.x, r2, s3
mad r2.xy, v6, r1.w, c4
mov r0.z, r0.x
texld r0.x, r2, s3
mad r2.xy, v6, r1.w, c3
mov r0.y, r0.x
texld r0.x, r2, s3
mad r0, -v6.z, r1.w, r0
mov r2.x, c2
cmp r0, r0, c14.y, r2.x
dp4_pp r0.y, r0, c14.w
rcp r1.w, v5.w
mad r2.xy, v5, r1.w, c14.z
dp3 r0.x, v5, v5
texld r0.w, r2, s1
cmp r0.z, -v5, c14.x, c14.y
mul_pp r0.z, r0, r0.w
texld r0.x, r0.x, s2
mul_pp r0.x, r0.z, r0
mul_pp r0.x, r0, r0.y
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c15.x
mov_pp oC0.w, c14.x
"
}

SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"!!GLES"
}

SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_LightShadowData]
Vector 3 [_ShadowOffsets0]
Vector 4 [_ShadowOffsets1]
Vector 5 [_ShadowOffsets2]
Vector 6 [_ShadowOffsets3]
Float 7 [_EdgeAlpha]
Vector 8 [_Color]
Float 9 [_Shininess]
Float 10 [_Gloss]
Float 11 [_Reflection]
Float 12 [_FrezPow]
Float 13 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
SetTexture 2 [_LightTextureB0] 2D
SetTexture 3 [_ShadowMapTexture] 2D
"ps_3_0
; 84 ALU, 8 TEX
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c14, 0.00000000, 1.00000000, 0.50000000, 0.25000000
def c15, 2.00000000, 6.00000000, 128.00000000, 0
def c16, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c15.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c9.x
add_pp r0.y, c14, -r0
mul_pp r1.w, r0.y, c15.y
add_pp r2.x, -r0, c14.y
pow_pp r0, r2.x, c13.x
texldl r1.xyz, r1, s0
mov_pp r1.w, r0.x
mov_pp r0.y, c11.x
mad_pp r2.x, r1.w, c12, r0.y
mul_pp r0.xyz, r2.x, r1
dp3_pp_sat r0.y, r0, c16
dp3_pp r1.y, v4, v4
mul_pp r0.z, r0.y, r0.y
mov_pp r0.x, c14.y
mad_pp r0.y, -r1.w, c7.x, r0.x
mad_pp r0.y, r0, c8.w, r0.z
min_pp r0.w, r0.y, c14.y
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
add_pp r1.x, -r0.w, c14.y
abs_pp r0.w, r0.z
mul_pp r0.w, r0, r1.x
mov_pp_sat r1.x, r2
max_pp r0.w, r0.z, r0
rsq_pp r1.y, r1.y
mad_pp r0.xyz, r1.y, v4, r0
dp3_pp r0.x, r0, r0
add_pp r1.x, -r1, c14.y
mul_pp r1.xyz, r1.x, c8
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mov_pp r0.y, c9.x
mul_pp r1.xyz, r1, c0
mul_pp r0.y, c15.z, r0
max_pp r0.x, r0, c14
pow_pp r2, r0.x, r0.y
mov_pp r0.x, c10
mad_pp r0.y, r1.w, c12.x, r0.x
mov_pp r0.x, r2
mov_pp r2.xyz, c0
rcp r1.w, v6.w
mul_pp r2.w, r0.x, r0.y
mad r0.xyz, v6, r1.w, c6
mul_pp r2.xyz, c1, r2
mul_pp r2.xyz, r2, r2.w
mad_pp r2.xyz, r1, r0.w, r2
mad r1.xyz, v6, r1.w, c4
texld r0.x, r0, s3
mov_pp r0.w, r0.x
mad r0.xyz, v6, r1.w, c5
texld r0.x, r0, s3
texld r1.x, r1, s3
mov_pp r0.z, r0.x
mov_pp r0.y, r1.x
mad r1.xyz, v6, r1.w, c3
mov r0.x, c2
add r1.w, c14.y, -r0.x
texld r0.x, r1, s3
mad r0, r0, r1.w, c2.x
dp4_pp r0.y, r0, c14.w
rcp r1.x, v5.w
mad r1.xy, v5, r1.x, c14.z
dp3 r0.x, v5, v5
texld r0.w, r1, s1
cmp r0.z, -v5, c14.x, c14.y
mul_pp r0.z, r0, r0.w
texld r0.x, r0.x, s2
mul_pp r0.x, r0.z, r0
mul_pp r0.x, r0, r0.y
mul_pp r0.xyz, r0.x, r2
mul_pp oC0.xyz, r0, c15.x
mov_pp oC0.w, c14.x
"
}

SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_LightPositionRange]
Vector 1 [_LightColor0]
Vector 2 [_SpecColor]
Vector 3 [_LightShadowData]
Float 4 [_EdgeAlpha]
Vector 5 [_Color]
Float 6 [_Shininess]
Float 7 [_Gloss]
Float 8 [_Reflection]
Float 9 [_FrezPow]
Float 10 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] CUBE
SetTexture 2 [_LightTexture0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 80 ALU, 6 TEX
PARAM c[15] = { program.local[0..10],
		{ 0, 0.97000003, 0.0078125, -0.0078125 },
		{ 1, 0.0039215689, 1.53787e-005, 6.2273724e-009 },
		{ 0.25, 2, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[13].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[12].x;
DP3 R2.x, fragment.texcoord[4], fragment.texcoord[4];
POW R0.w, R0.w, c[10].x;
MOV R1.x, c[8];
MAD R1.x, R0.w, c[9], R1;
MUL R0.xyz, R1.x, R0;
DP3_SAT R0.y, R0, c[14];
MOV_SAT R1.x, R1;
MUL R0.z, R0.y, R0.y;
MOV R0.x, c[12];
MAD R0.y, -R0.w, c[4].x, R0.x;
MAD R0.y, R0, c[5].w, R0.z;
MIN R1.y, R0, c[12].x;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
ADD R1.z, -R1.y, c[12].x;
ABS R1.y, R0.z;
MUL R1.y, R1, R1.z;
MAX R1.w, R0.z, R1.y;
RSQ R2.x, R2.x;
MAD R0.xyz, R2.x, fragment.texcoord[4], R0;
ADD R1.x, -R1, c[12];
MUL R1.xyz, R1.x, c[5];
DP3 R0.y, R0, R0;
MOV R2.x, c[7];
MAD R0.x, R0.w, c[9], R2;
RSQ R0.w, R0.y;
MOV R2.xyz, c[2];
MUL R0.z, R0.w, R0;
MOV R0.y, c[13].z;
MUL R0.w, R0.y, c[6].x;
MAX R0.y, R0.z, c[11].x;
POW R0.y, R0.y, R0.w;
MUL R0.w, R0.y, R0.x;
MUL R2.xyz, R2, c[1];
MUL R2.xyz, R2, R0.w;
MUL R1.xyz, R1, c[1];
MAD R2.xyz, R1, R1.w, R2;
ADD R0.xyz, fragment.texcoord[6], c[11].zwww;
TEX R0, R0, texture[1], CUBE;
DP4 R3.w, R0, c[12];
ADD R0.xyz, fragment.texcoord[6], c[11].wzww;
TEX R0, R0, texture[1], CUBE;
DP4 R3.z, R0, c[12];
ADD R1.xyz, fragment.texcoord[6], c[11].wwzw;
TEX R1, R1, texture[1], CUBE;
DP4 R3.y, R1, c[12];
ADD R0.xyz, fragment.texcoord[6], c[11].z;
TEX R0, R0, texture[1], CUBE;
DP3 R1.x, fragment.texcoord[6], fragment.texcoord[6];
RSQ R1.x, R1.x;
DP4 R3.x, R0, c[12];
RCP R0.x, R1.x;
MUL R0.x, R0, c[0].w;
MOV R1.x, c[12];
MAD R0, -R0.x, c[11].y, R3;
CMP R0, R0, c[3].x, R1.x;
DP4 R0.x, R0, c[13].x;
DP3 R1.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R0.w, R1.x, texture[2], 2D;
MUL R0.x, R0.w, R0;
MUL R0.xyz, R0.x, R2;
MUL result.color.xyz, R0, c[13].y;
MOV result.color.w, c[11].x;
END
# 80 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_LightPositionRange]
Vector 1 [_LightColor0]
Vector 2 [_SpecColor]
Vector 3 [_LightShadowData]
Float 4 [_EdgeAlpha]
Vector 5 [_Color]
Float 6 [_Shininess]
Float 7 [_Gloss]
Float 8 [_Reflection]
Float 9 [_FrezPow]
Float 10 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] CUBE
SetTexture 2 [_LightTexture0] 2D
"ps_3_0
; 82 ALU, 7 TEX
dcl_cube s0
dcl_cube s1
dcl_2d s2
def c11, 0.00781250, -0.00781250, 0.97000003, 0.25000000
def c12, 1.00000000, 0.00392157, 0.00001538, 0.00000001
def c13, 2.00000000, 6.00000000, 0.00000000, 128.00000000
def c14, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c13.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c6.x
add_pp r0.y, c12.x, -r0
mul_pp r1.w, r0.y, c13.y
add_pp r2.x, -r0, c12
pow_pp r0, r2.x, c10.x
texldl r1.xyz, r1, s0
mov_pp r2.x, r0
mov_pp r0.y, c8.x
mad_pp r0.w, r2.x, c9.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r0.y, r0, c14
mov_pp_sat r0.w, r0
mul_pp r0.z, r0.y, r0.y
mov_pp r0.x, c12
mad_pp r0.y, -r2.x, c4.x, r0.x
mad_pp r0.y, r0, c5.w, r0.z
min_pp r1.x, r0.y, c12
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
add_pp r1.y, -r1.x, c12.x
abs_pp r1.x, r0.z
mul_pp r1.x, r1, r1.y
max_pp r1.w, r0.z, r1.x
dp3_pp r1.x, v4, v4
rsq_pp r1.x, r1.x
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c12.x
mul_pp r1.xyz, r0.w, c5
mov_pp r0.y, c6.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r2.z, c13.w, r0.y
max_pp r2.y, r0.x, c13.z
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c7.x
mad_pp r0.y, r2.x, c9.x, r0
mul_pp r0.w, r0.x, r0.y
mov_pp r2.xyz, c1
mul_pp r2.xyz, c2, r2
mul_pp r2.xyz, r2, r0.w
mul_pp r1.xyz, r1, c1
mad_pp r2.xyz, r1, r1.w, r2
add r0.xyz, v6, c11.xyyw
texld r0, r0, s1
dp4 r3.w, r0, c12
add r0.xyz, v6, c11.yxyw
texld r0, r0, s1
dp4 r3.z, r0, c12
add r1.xyz, v6, c11.yyxw
texld r1, r1, s1
dp4 r3.y, r1, c12
add r0.xyz, v6, c11.x
texld r0, r0, s1
dp3 r1.x, v6, v6
rsq r1.x, r1.x
dp4 r3.x, r0, c12
rcp r0.x, r1.x
mul r0.x, r0, c0.w
mad r0, -r0.x, c11.z, r3
mov r1.x, c3
cmp r1, r0, c12.x, r1.x
dp3 r0.x, v5, v5
dp4_pp r0.y, r1, c11.w
texld r0.x, r0.x, s2
mul r0.x, r0, r0.y
mul_pp r0.xyz, r0.x, r2
mul_pp oC0.xyz, r0, c13.x
mov_pp oC0.w, c13.z
"
}

SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_LightPositionRange]
Vector 1 [_LightColor0]
Vector 2 [_SpecColor]
Vector 3 [_LightShadowData]
Float 4 [_EdgeAlpha]
Vector 5 [_Color]
Float 6 [_Shininess]
Float 7 [_Gloss]
Float 8 [_Reflection]
Float 9 [_FrezPow]
Float 10 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] CUBE
SetTexture 2 [_LightTextureB0] 2D
SetTexture 3 [_LightTexture0] CUBE
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 82 ALU, 7 TEX
PARAM c[15] = { program.local[0..10],
		{ 0, 0.97000003, 0.0078125, -0.0078125 },
		{ 1, 0.0039215689, 1.53787e-005, 6.2273724e-009 },
		{ 0.25, 2, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[13].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[12].x;
POW R2.w, R0.w, c[10].x;
MOV R1.x, c[8];
MAD R4.x, R2.w, c[9], R1;
MUL R0.xyz, R4.x, R0;
DP3_SAT R0.y, R0, c[14];
MOV R0.x, c[12];
MAD R0.x, -R2.w, c[4], R0;
MUL R0.y, R0, R0;
MAD R0.y, R0.x, c[5].w, R0;
MIN R0.y, R0, c[12].x;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MUL R2.xyz, R0.x, fragment.texcoord[3];
ADD R1.x, -R0.y, c[12];
ABS R0.w, R2.z;
MUL R1.x, R0.w, R1;
MAX R4.y, R2.z, R1.x;
ADD R0.xyz, fragment.texcoord[6], c[11].zwww;
TEX R0, R0, texture[1], CUBE;
DP4 R3.w, R0, c[12];
ADD R0.xyz, fragment.texcoord[6], c[11].wzww;
TEX R0, R0, texture[1], CUBE;
DP4 R3.z, R0, c[12];
ADD R1.xyz, fragment.texcoord[6], c[11].wwzw;
TEX R1, R1, texture[1], CUBE;
DP4 R3.y, R1, c[12];
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
RSQ R1.w, R1.y;
MAD R2.xyz, R1.w, fragment.texcoord[4], R2;
DP3 R2.x, R2, R2;
RSQ R2.y, R2.x;
ADD R0.xyz, fragment.texcoord[6], c[11].z;
TEX R0, R0, texture[1], CUBE;
DP3 R1.x, fragment.texcoord[6], fragment.texcoord[6];
MOV R1.w, c[7].x;
MUL R2.y, R2, R2.z;
MOV R2.x, c[13].z;
MUL R2.z, R2.x, c[6].x;
RSQ R1.x, R1.x;
DP4 R3.x, R0, c[12];
RCP R0.x, R1.x;
MUL R0.x, R0, c[0].w;
MOV R1.x, c[12];
MAD R0, -R0.x, c[11].y, R3;
CMP R0, R0, c[3].x, R1.x;
DP4 R0.y, R0, c[13].x;
MOV_SAT R1.x, R4;
ADD R1.x, -R1, c[12];
MUL R1.xyz, R1.x, c[5];
MAD R1.w, R2, c[9].x, R1;
MAX R2.x, R2.y, c[11];
POW R2.w, R2.x, R2.z;
MOV R2.xyz, c[2];
MUL R1.w, R2, R1;
MUL R2.xyz, R2, c[1];
MUL R2.xyz, R2, R1.w;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
MUL R1.xyz, R1, c[1];
MAD R1.xyz, R1, R4.y, R2;
TEX R0.w, fragment.texcoord[5], texture[3], CUBE;
TEX R1.w, R0.x, texture[2], 2D;
MUL R0.x, R1.w, R0.w;
MUL R0.x, R0, R0.y;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[13].y;
MOV result.color.w, c[11].x;
END
# 82 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_LightPositionRange]
Vector 1 [_LightColor0]
Vector 2 [_SpecColor]
Vector 3 [_LightShadowData]
Float 4 [_EdgeAlpha]
Vector 5 [_Color]
Float 6 [_Shininess]
Float 7 [_Gloss]
Float 8 [_Reflection]
Float 9 [_FrezPow]
Float 10 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] CUBE
SetTexture 2 [_LightTextureB0] 2D
SetTexture 3 [_LightTexture0] CUBE
"ps_3_0
; 84 ALU, 8 TEX
dcl_cube s0
dcl_cube s1
dcl_2d s2
dcl_cube s3
def c11, 0.00781250, -0.00781250, 0.97000003, 0.25000000
def c12, 1.00000000, 0.00392157, 0.00001538, 0.00000001
def c13, 2.00000000, 6.00000000, 0.00000000, 128.00000000
def c14, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c13.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c6.x
add_pp r0.y, c12.x, -r0
mul_pp r1.w, r0.y, c13.y
add_pp r2.x, -r0, c12
pow_pp r0, r2.x, c10.x
texldl r1.xyz, r1, s0
mov_pp r2.w, r0.x
mov_pp r0.y, c8.x
mad_pp r4.x, r2.w, c9, r0.y
mul_pp r0.xyz, r4.x, r1
dp3_pp_sat r0.y, r0, c14
mov_pp r0.x, c12
mad_pp r0.x, -r2.w, c4, r0
mul_pp r0.y, r0, r0
mad_pp r0.y, r0.x, c5.w, r0
min_pp r0.y, r0, c12.x
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r2.xyz, r0.x, v3
add_pp r1.x, -r0.y, c12
abs_pp r0.w, r2.z
mul_pp r1.x, r0.w, r1
max_pp r4.y, r2.z, r1.x
add r0.xyz, v6, c11.xyyw
texld r0, r0, s1
dp4 r3.w, r0, c12
add r0.xyz, v6, c11.yxyw
texld r0, r0, s1
dp4 r3.z, r0, c12
add r1.xyz, v6, c11.yyxw
texld r1, r1, s1
dp4 r3.y, r1, c12
dp3 r0.w, v6, v6
rsq r1.x, r0.w
add r0.xyz, v6, c11.x
texld r0, r0, s1
mov_pp_sat r1.w, r4.x
dp4 r3.x, r0, c12
rcp r1.x, r1.x
mul r0.x, r1, c0.w
mad r0, -r0.x, c11.z, r3
mov r1.x, c3
cmp r0, r0, c12.x, r1.x
dp4_pp r0.y, r0, c11.w
dp3_pp r1.y, v4, v4
rsq_pp r1.x, r1.y
mad_pp r1.xyz, r1.x, v4, r2
dp3_pp r1.x, r1, r1
add_pp r1.w, -r1, c12.x
mul_pp r2.xyz, r1.w, c5
mov_pp r1.y, c6.x
rsq_pp r1.x, r1.x
mul_pp r1.x, r1, r1.z
dp3 r0.x, v5, v5
mul_pp r3.y, c13.w, r1
max_pp r3.x, r1, c13.z
pow_pp r1, r3.x, r3.y
mov_pp r1.y, c7.x
mad_pp r2.w, r2, c9.x, r1.y
mov_pp r1.w, r1.x
mov_pp r1.xyz, c1
mul_pp r1.w, r1, r2
mul_pp r1.xyz, c2, r1
mul_pp r1.xyz, r1, r1.w
mul_pp r2.xyz, r2, c1
mad_pp r1.xyz, r2, r4.y, r1
texld r0.w, v5, s3
texld r0.x, r0.x, s2
mul r0.x, r0, r0.w
mul r0.x, r0, r0.y
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c13.x
mov_pp oC0.w, c13.z
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES"
}

}
	}

#LINE 24

	
}

SubShader { // Shader Model 2

	// Front Faces pass
	
	//Tags {"Queue"="Geometry" "RenderType"="Opaque" "IgnoreProjector"="False" }
	 zwrite on Cull Back Ztest Lequal
	 Blend off
	 colormask RGBA
	
		
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardBase" }
Program "vp" {
// Vertex combos: 6
//   opengl - ALU: 30 to 91
//   d3d9 - ALU: 31 to 94
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
"!!ARBvp1.0
# 54 ALU
PARAM c[23] = { { 1 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[13].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[21];
DP4 R3.y, R1, c[20];
DP4 R3.x, R1, c[19];
ADD R2.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R3.xyz, R0.x, c[22];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[4].xyz, R2, R3;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[14];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[13].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[13].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[3].y, R2, R1;
MUL result.texcoord[2], R0, c[13].w;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 54 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
"vs_2_0
; 57 ALU
def c22, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r1.xyz, v2, c12.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c22.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c20
dp4 r3.y, r1, c19
dp4 r3.x, r1, c18
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c21
mov r3, c8
mov r0.xyz, v1
add oT4.xyz, r1, r2
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c14, r0
mov r0, c9
dp4 r1.y, c14, r0
dp4 r1.x, c14, r3
mov r0.xyz, c13
mov r0.w, c22.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c12.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 oT3.y, r2, r1
mul oT2, r0, c12.w
dp3 oT3.z, v2, r1
dp3 oT3.x, v1, r1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  mat3 tmpvar_19;
  tmpvar_19[0] = _Object2World[0].xyz;
  tmpvar_19[1] = _Object2World[1].xyz;
  tmpvar_19[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = (tmpvar_19 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_22;
  mediump vec4 normal;
  normal = tmpvar_21;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAr, normal);
  x1.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAg, normal);
  x1.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAb, normal);
  x1.z = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBr, tmpvar_26);
  x2.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBg, tmpvar_26);
  x2.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBb, tmpvar_26);
  x2.z = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (unity_SHC.xyz * vC);
  x3 = tmpvar_31;
  tmpvar_22 = ((x1 + x2) + x3);
  shlight = tmpvar_22;
  tmpvar_7 = shlight;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
}



#endif
#ifdef FRAGMENT

varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp float _Metalics;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_16);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + tmpvar_17), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec4 tmpvar_20;
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD3;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_21;
  tmpvar_21 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  NdotL = tmpvar_21;
  lowp float tmpvar_22;
  tmpvar_22 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_18)));
  mediump vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * _LightColor0.xyz) * (tmpvar_22 * 2.0));
  c_i0_i1.xyz = tmpvar_23;
  c_i0_i1.w = tmpvar_18;
  tmpvar_20 = c_i0_i1;
  c = tmpvar_20;
  c.xyz = (c.xyz + (tmpvar_19 * xlv_TEXCOORD4));
  c.xyz = (c.xyz + mix (CubeTex, (CubeTex * xlat_mutable__Color.xyz), vec3(((1.0 - tmpvar_17) * _Metalics))));
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_LightmapST]
"!!ARBvp1.0
# 30 ALU
PARAM c[17] = { { 1 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[14];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[13].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[13].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[13].w;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 30 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 14 [unity_LightmapST]
"vs_2_0
; 31 ALU
def c15, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, v1.w, r0
mov r0.xyz, c13
mov r0.w, c15.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c12.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c12.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c12.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c12.w
mad oT3.xy, v3, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * -((((_World2Object * tmpvar_6).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_11;
  tmpvar_11.xyz = (tmpvar_10 * v_i0_i1.xyz);
  tmpvar_11.w = tmpvar_8.x;
  highp vec4 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * unity_Scale.w);
  tmpvar_3 = tmpvar_12;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_10 * v_i0_i1_i2.xyz);
  tmpvar_13.w = tmpvar_8.y;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_4 = tmpvar_14;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_10 * v_i0_i1_i2_i3.xyz);
  tmpvar_15.w = tmpvar_8.z;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_5 = tmpvar_16;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform sampler2D unity_Lightmap;
uniform lowp float _Metalics;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_16);
  c = vec4(0.0, 0.0, 0.0, 0.0);
  c.xyz = ((xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0))) * (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz));
  c.w = min ((xlat_mutable__Color.w + tmpvar_17), 1.0);
  c.xyz = (c.xyz + mix (CubeTex, (CubeTex * xlat_mutable__Color.xyz), vec3(((1.0 - tmpvar_17) * _Metalics))));
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
"!!ARBvp1.0
# 60 ALU
PARAM c[24] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[14].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[19];
DP4 R2.y, R0, c[18];
DP4 R2.x, R0, c[17];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[22];
DP4 R3.y, R1, c[21];
DP4 R3.x, R1, c[20];
ADD R2.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R3.xyz, R0.x, c[23];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[4].xyz, R2, R3;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[16];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP4 R1.z, R0, c[11];
MOV R0.xyz, c[15];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[14].w, -vertex.position;
DP3 result.texcoord[3].y, R2, R1;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[14].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[14].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[3].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].y;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
ADD result.texcoord[5].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
END
# 60 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
"vs_2_0
; 63 ALU
def c24, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r1.xyz, v2, c14.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c24.x
dp4 r2.z, r0, c19
dp4 r2.y, r0, c18
dp4 r2.x, r0, c17
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c22
dp4 r3.y, r1, c21
dp4 r3.x, r1, c20
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c23
mov r3, c8
mov r0.xyz, v1
add oT4.xyz, r1, r2
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c16, r0
mov r0, c9
dp4 r1.y, c16, r0
dp4 r1.x, c16, r3
mov r0.xyz, c15
mov r0.w, c24.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c14.w, -v0
dp3 oT3.y, r2, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp3 oT3.z, v2, r1
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c24.y
dp3 oT3.x, v1, r1
mov r1.x, r2
mul r1.y, r2, c12.x
mad oT5.xy, r2.z, c13.zwzw, r1
mov oPos, r0
mov oT5.zw, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_3 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_4 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_5 = tmpvar_19;
  mat3 tmpvar_20;
  tmpvar_20[0] = _Object2World[0].xyz;
  tmpvar_20[1] = _Object2World[1].xyz;
  tmpvar_20[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_13 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = (tmpvar_20 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_23;
  mediump vec4 normal;
  normal = tmpvar_22;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAr, normal);
  x1.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAg, normal);
  x1.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAb, normal);
  x1.z = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBr, tmpvar_27);
  x2.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBg, tmpvar_27);
  x2.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBb, tmpvar_27);
  x2.z = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_31;
  highp vec3 tmpvar_32;
  tmpvar_32 = (unity_SHC.xyz * vC);
  x3 = tmpvar_32;
  tmpvar_23 = ((x1 + x2) + x3);
  shlight = tmpvar_23;
  tmpvar_7 = shlight;
  highp vec4 o_i0;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_8 * 0.5);
  o_i0 = tmpvar_33;
  highp vec2 tmpvar_34;
  tmpvar_34.x = tmpvar_33.x;
  tmpvar_34.y = (tmpvar_33.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_34 + tmpvar_33.w);
  o_i0.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform sampler2D _ShadowMapTexture;
uniform lowp float _Metalics;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_16);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + tmpvar_17), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  lowp float tmpvar_20;
  tmpvar_20 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  mediump vec4 tmpvar_21;
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD3;
  mediump float atten_i0;
  atten_i0 = tmpvar_20;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_22;
  tmpvar_22 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  NdotL = tmpvar_22;
  lowp float tmpvar_23;
  tmpvar_23 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_18)));
  mediump vec3 tmpvar_24;
  tmpvar_24 = ((tmpvar_19 * _LightColor0.xyz) * ((tmpvar_23 * atten_i0) * 2.0));
  c_i0_i1.xyz = tmpvar_24;
  c_i0_i1.w = tmpvar_18;
  tmpvar_21 = c_i0_i1;
  c = tmpvar_21;
  c.xyz = (c.xyz + (tmpvar_19 * xlv_TEXCOORD4));
  c.xyz = (c.xyz + mix (CubeTex, (CubeTex * xlat_mutable__Color.xyz), vec3(((1.0 - tmpvar_17) * _Metalics))));
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_LightmapST]
"!!ARBvp1.0
# 36 ALU
PARAM c[18] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[15];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[14].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP4 R1.w, vertex.position, c[4];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[14].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[14].w;
DP3 R0.y, R1, c[7];
DP4 R1.z, vertex.position, c[3];
DP3 R0.w, -R2, c[7];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R2.xyz, R1.xyww, c[0].y;
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[14].w;
MOV R0.x, R2;
MUL R0.y, R2, c[13].x;
ADD result.texcoord[5].xy, R0, R2.z;
MOV result.position, R1;
MOV result.texcoord[5].zw, R1;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[17], c[17].zwzw;
END
# 36 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 16 [unity_LightmapST]
"vs_2_0
; 37 ALU
def c17, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, v1.w, r0
mov r0.xyz, c15
mov r0.w, c17.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c14.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp4 r1.w, v0, c3
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c14.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c14.w
dp3 r0.y, r1, c6
dp4 r1.z, v0, c2
dp3 r0.w, -r2, c6
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r2.xyz, r1.xyww, c17.y
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c14.w
mov r0.x, r2
mul r0.y, r2, c12.x
mad oT5.xy, r2.z, c13.zwzw, r0
mov oPos, r1
mov oT5.zw, r1
mad oT3.xy, v3, c16, c16.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * -((((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_10;
  tmpvar_10[0] = tmpvar_1.xyz;
  tmpvar_10[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_10[2] = tmpvar_2;
  mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_10[0].x;
  tmpvar_11[0].y = tmpvar_10[1].x;
  tmpvar_11[0].z = tmpvar_10[2].x;
  tmpvar_11[1].x = tmpvar_10[0].y;
  tmpvar_11[1].y = tmpvar_10[1].y;
  tmpvar_11[1].z = tmpvar_10[2].y;
  tmpvar_11[2].x = tmpvar_10[0].z;
  tmpvar_11[2].y = tmpvar_10[1].z;
  tmpvar_11[2].z = tmpvar_10[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_12;
  tmpvar_12.xyz = (tmpvar_11 * v_i0_i1.xyz);
  tmpvar_12.w = tmpvar_9.x;
  highp vec4 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * unity_Scale.w);
  tmpvar_3 = tmpvar_13;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_11 * v_i0_i1_i2.xyz);
  tmpvar_14.w = tmpvar_9.y;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_11 * v_i0_i1_i2_i3.xyz);
  tmpvar_16.w = tmpvar_9.z;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  highp vec4 o_i0;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_6 * 0.5);
  o_i0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19.x = tmpvar_18.x;
  tmpvar_19.y = (tmpvar_18.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_19 + tmpvar_18.w);
  o_i0.zw = tmpvar_6.zw;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform sampler2D unity_Lightmap;
uniform sampler2D _ShadowMapTexture;
uniform lowp float _Metalics;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_16);
  c = vec4(0.0, 0.0, 0.0, 0.0);
  c.xyz = ((xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0))) * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz), vec3((texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x * 2.0))));
  c.w = min ((xlat_mutable__Color.w + tmpvar_17), 1.0);
  c.xyz = (c.xyz + mix (CubeTex, (CubeTex * xlat_mutable__Color.xyz), vec3(((1.0 - tmpvar_17) * _Metalics))));
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
"!!ARBvp1.0
# 85 ALU
PARAM c[31] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..30] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[13].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[17];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[16];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[18];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[19];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[21];
MAD R1.xyz, R0.x, c[20], R1;
MAD R0.xyz, R0.z, c[22], R1;
MAD R1.xyz, R0.w, c[23], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[29];
DP4 R3.y, R0, c[28];
DP4 R3.x, R0, c[27];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[26];
DP4 R2.y, R4, c[25];
DP4 R2.x, R4, c[24];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[30];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
ADD result.texcoord[4].xyz, R3, R1;
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[14];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[13].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[13].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[3].y, R2, R1;
MUL result.texcoord[2], R0, c[13].w;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 85 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
"vs_2_0
; 88 ALU
def c30, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r3.xyz, v2, c12.w
dp4 r0.x, v0, c5
add r1, -r0.x, c16
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c15
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c30.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c17
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c18
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c30.x
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c30.y
mul r0, r0, r1
mul r1.xyz, r0.y, c20
mad r1.xyz, r0.x, c19, r1
mad r0.xyz, r0.z, c21, r1
mad r1.xyz, r0.w, c22, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c28
dp4 r3.y, r0, c27
dp4 r3.x, r0, c26
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c29
dp4 r2.z, r4, c25
dp4 r2.y, r4, c24
dp4 r2.x, r4, c23
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r3, c8
mov r0.xyz, v1
add oT4.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c14, r0
mov r0, c9
dp4 r1.y, c14, r0
dp4 r1.x, c14, r3
mov r0.xyz, c13
mov r0.w, c30.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c12.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 oT3.y, r2, r1
mul oT2, r0, c12.w
dp3 oT3.z, v2, r1
dp3 oT3.x, v1, r1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec3 unity_LightColor3;
uniform highp vec3 unity_LightColor2;
uniform highp vec3 unity_LightColor1;
uniform highp vec3 unity_LightColor0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_3 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  mat3 tmpvar_19;
  tmpvar_19[0] = _Object2World[0].xyz;
  tmpvar_19[1] = _Object2World[1].xyz;
  tmpvar_19[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = tmpvar_20;
  mediump vec3 tmpvar_23;
  mediump vec4 normal;
  normal = tmpvar_22;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAr, normal);
  x1.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAg, normal);
  x1.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAb, normal);
  x1.z = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBr, tmpvar_27);
  x2.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBg, tmpvar_27);
  x2.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBb, tmpvar_27);
  x2.z = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_31;
  highp vec3 tmpvar_32;
  tmpvar_32 = (unity_SHC.xyz * vC);
  x3 = tmpvar_32;
  tmpvar_23 = ((x1 + x2) + x3);
  shlight = tmpvar_23;
  tmpvar_7 = shlight;
  highp vec3 tmpvar_33;
  tmpvar_33 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosX0 - tmpvar_33.x);
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosY0 - tmpvar_33.y);
  highp vec4 tmpvar_36;
  tmpvar_36 = (unity_4LightPosZ0 - tmpvar_33.z);
  highp vec4 tmpvar_37;
  tmpvar_37 = (((tmpvar_34 * tmpvar_34) + (tmpvar_35 * tmpvar_35)) + (tmpvar_36 * tmpvar_36));
  highp vec4 tmpvar_38;
  tmpvar_38 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_34 * tmpvar_20.x) + (tmpvar_35 * tmpvar_20.y)) + (tmpvar_36 * tmpvar_20.z)) * inversesqrt (tmpvar_37))) * 1.0/((1.0 + (tmpvar_37 * unity_4LightAtten0))));
  highp vec3 tmpvar_39;
  tmpvar_39 = (tmpvar_7 + ((((unity_LightColor0 * tmpvar_38.x) + (unity_LightColor1 * tmpvar_38.y)) + (unity_LightColor2 * tmpvar_38.z)) + (unity_LightColor3 * tmpvar_38.w)));
  tmpvar_7 = tmpvar_39;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
}



#endif
#ifdef FRAGMENT

varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp float _Metalics;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_16);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + tmpvar_17), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec4 tmpvar_20;
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD3;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_21;
  tmpvar_21 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  NdotL = tmpvar_21;
  lowp float tmpvar_22;
  tmpvar_22 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_18)));
  mediump vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * _LightColor0.xyz) * (tmpvar_22 * 2.0));
  c_i0_i1.xyz = tmpvar_23;
  c_i0_i1.w = tmpvar_18;
  tmpvar_20 = c_i0_i1;
  c = tmpvar_20;
  c.xyz = (c.xyz + (tmpvar_19 * xlv_TEXCOORD4));
  c.xyz = (c.xyz + mix (CubeTex, (CubeTex * xlat_mutable__Color.xyz), vec3(((1.0 - tmpvar_17) * _Metalics))));
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
"!!ARBvp1.0
# 91 ALU
PARAM c[32] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..31] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[14].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[18];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[17];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[19];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[20];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[22];
MAD R1.xyz, R0.x, c[21], R1;
MAD R0.xyz, R0.z, c[23], R1;
MAD R1.xyz, R0.w, c[24], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[30];
DP4 R3.y, R0, c[29];
DP4 R3.x, R0, c[28];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[27];
DP4 R2.y, R4, c[26];
DP4 R2.x, R4, c[25];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[31];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
ADD result.texcoord[4].xyz, R3, R1;
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[16];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP4 R1.z, R0, c[11];
MOV R0.xyz, c[15];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[14].w, -vertex.position;
DP3 result.texcoord[3].y, R2, R1;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[14].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[14].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[3].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].z;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
ADD result.texcoord[5].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
END
# 91 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
"vs_2_0
; 94 ALU
def c32, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r3.xyz, v2, c14.w
dp4 r0.x, v0, c5
add r1, -r0.x, c18
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c17
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c32.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c19
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c20
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c32.x
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c32.y
mul r0, r0, r1
mul r1.xyz, r0.y, c22
mad r1.xyz, r0.x, c21, r1
mad r0.xyz, r0.z, c23, r1
mad r1.xyz, r0.w, c24, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c30
dp4 r3.y, r0, c29
dp4 r3.x, r0, c28
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c31
dp4 r2.z, r4, c27
dp4 r2.y, r4, c26
dp4 r2.x, r4, c25
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r3, c8
mov r0.xyz, v1
add oT4.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c16, r0
mov r0, c9
dp4 r1.y, c16, r0
dp4 r1.x, c16, r3
mov r0.xyz, c15
mov r0.w, c32.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c14.w, -v0
dp3 oT3.y, r2, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp3 oT3.z, v2, r1
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c32.z
dp3 oT3.x, v1, r1
mov r1.x, r2
mul r1.y, r2, c12.x
mad oT5.xy, r2.z, c13.zwzw, r1
mov oPos, r0
mov oT5.zw, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec3 unity_LightColor3;
uniform highp vec3 unity_LightColor2;
uniform highp vec3 unity_LightColor1;
uniform highp vec3 unity_LightColor0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_3 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_4 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_5 = tmpvar_19;
  mat3 tmpvar_20;
  tmpvar_20[0] = _Object2World[0].xyz;
  tmpvar_20[1] = _Object2World[1].xyz;
  tmpvar_20[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_20 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_13 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_21;
  mediump vec3 tmpvar_24;
  mediump vec4 normal;
  normal = tmpvar_23;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAr, normal);
  x1.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAg, normal);
  x1.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHAb, normal);
  x1.z = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBr, tmpvar_28);
  x2.x = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBg, tmpvar_28);
  x2.y = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = dot (unity_SHBb, tmpvar_28);
  x2.z = tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_SHC.xyz * vC);
  x3 = tmpvar_33;
  tmpvar_24 = ((x1 + x2) + x3);
  shlight = tmpvar_24;
  tmpvar_7 = shlight;
  highp vec3 tmpvar_34;
  tmpvar_34 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosX0 - tmpvar_34.x);
  highp vec4 tmpvar_36;
  tmpvar_36 = (unity_4LightPosY0 - tmpvar_34.y);
  highp vec4 tmpvar_37;
  tmpvar_37 = (unity_4LightPosZ0 - tmpvar_34.z);
  highp vec4 tmpvar_38;
  tmpvar_38 = (((tmpvar_35 * tmpvar_35) + (tmpvar_36 * tmpvar_36)) + (tmpvar_37 * tmpvar_37));
  highp vec4 tmpvar_39;
  tmpvar_39 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_35 * tmpvar_21.x) + (tmpvar_36 * tmpvar_21.y)) + (tmpvar_37 * tmpvar_21.z)) * inversesqrt (tmpvar_38))) * 1.0/((1.0 + (tmpvar_38 * unity_4LightAtten0))));
  highp vec3 tmpvar_40;
  tmpvar_40 = (tmpvar_7 + ((((unity_LightColor0 * tmpvar_39.x) + (unity_LightColor1 * tmpvar_39.y)) + (unity_LightColor2 * tmpvar_39.z)) + (unity_LightColor3 * tmpvar_39.w)));
  tmpvar_7 = tmpvar_40;
  highp vec4 o_i0;
  highp vec4 tmpvar_41;
  tmpvar_41 = (tmpvar_8 * 0.5);
  o_i0 = tmpvar_41;
  highp vec2 tmpvar_42;
  tmpvar_42.x = tmpvar_41.x;
  tmpvar_42.y = (tmpvar_41.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_42 + tmpvar_41.w);
  o_i0.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform sampler2D _ShadowMapTexture;
uniform lowp float _Metalics;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_16);
  lowp float tmpvar_18;
  tmpvar_18 = min ((xlat_mutable__Color.w + tmpvar_17), 1.0);
  lowp vec3 tmpvar_19;
  tmpvar_19 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  lowp float tmpvar_20;
  tmpvar_20 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  mediump vec4 tmpvar_21;
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD3;
  mediump float atten_i0;
  atten_i0 = tmpvar_20;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_22;
  tmpvar_22 = dot (vec3(0.0, 0.0, 1.0), lightDir);
  NdotL = tmpvar_22;
  lowp float tmpvar_23;
  tmpvar_23 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_18)));
  mediump vec3 tmpvar_24;
  tmpvar_24 = ((tmpvar_19 * _LightColor0.xyz) * ((tmpvar_23 * atten_i0) * 2.0));
  c_i0_i1.xyz = tmpvar_24;
  c_i0_i1.w = tmpvar_18;
  tmpvar_21 = c_i0_i1;
  c = tmpvar_21;
  c.xyz = (c.xyz + (tmpvar_19 * xlv_TEXCOORD4));
  c.xyz = (c.xyz + mix (CubeTex, (CubeTex * xlat_mutable__Color.xyz), vec3(((1.0 - tmpvar_17) * _Metalics))));
  gl_FragData[0] = c;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 4
//   opengl - ALU: 37 to 45, TEX: 1 to 3
//   d3d9 - ALU: 41 to 47, TEX: 1 to 3
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
Float 6 [_Metalics]
SetTexture 0 [_Cube] CUBE
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 43 ALU, 1 TEX
PARAM c[9] = { program.local[0..6],
		{ 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[7].x, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R0.x, R2, R0;
ABS R0.x, R0;
ADD R0.x, -R0, c[7].y;
POW R0.z, R0.x, c[5].x;
MOV R0.y, c[3].x;
MAD R0.x, R0.z, c[4], R0.y;
MOV R0.y, c[7];
MAD R0.y, -R0.z, c[1].x, R0;
TEX R1.xyz, R2, texture[0], CUBE;
MUL R1.xyz, R1, R0.x;
DP3_SAT R0.w, R1, c[8];
MUL R0.w, R0, R0;
ADD R0.z, -R0.w, c[7].y;
MAD R0.y, R0, c[2].w, R0.w;
MIN R0.w, R0.y, c[7].y;
MAD R2.xyz, R1, c[2], -R1;
MUL R0.z, R0, c[6].x;
MAD R2.xyz, R0.z, R2, R1;
MOV_SAT R0.x, R0;
ADD R0.z, -R0.x, c[7].y;
MUL R1.xyz, R0.z, c[2];
ADD R0.y, -R0.w, c[7];
ABS R0.x, fragment.texcoord[3].z;
MUL R0.x, R0, R0.y;
MAX R1.w, fragment.texcoord[3].z, R0.x;
MUL R0.xyz, R1, c[0];
MUL R1.xyz, R1, fragment.texcoord[4];
MUL R0.xyz, R1.w, R0;
MAD R0.xyz, R0, c[7].x, R1;
ADD result.color.xyz, R0, R2;
MOV result.color.w, R0;
END
# 43 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
Float 6 [_Metalics]
SetTexture 0 [_Cube] CUBE
"ps_2_0
; 46 ALU, 1 TEX
dcl_cube s0
def c7, 2.00000000, 1.00000000, 0, 0
def c8, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
dcl t4.xyz
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r2.xyz, -r1, c7.x, r2
dp3 r1.x, r2, r2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r2
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
add_pp r0.x, -r0, c7.y
mov_pp r3.x, c3
mov_pp r0.y, c7
texld r2, r1, s0
pow_pp r1.x, r0.x, c5.x
mov_pp r0.x, r1.x
mad_pp r1.x, r0, c4, r3
mul_pp r4.xyz, r2, r1.x
dp3_pp_sat r2.x, r4, c8
mul_pp r3.x, r2, r2
mad_pp r0.x, -r0, c1, r0.y
mad_pp r0.x, r0, c2.w, r3
min_pp r0.x, r0, c7.y
mad_pp r2.x, -r2, r2, c7.y
mad_pp r3.xyz, r4, c2, -r4
mul_pp r2.x, r2, c6
mad_pp r2.xyz, r2.x, r3, r4
mov_pp_sat r3.x, r1
add_pp r3.x, -r3, c7.y
add_pp r1.x, -r0, c7.y
abs_pp r4.x, t3.z
mul_pp r1.x, r4, r1
mul_pp r3.xyz, r3.x, c2
mul_pp r4.xyz, r3, c0
max_pp r1.x, t3.z, r1
mov_pp r0.w, r0.x
mul_pp r3.xyz, r3, t4
mul_pp r1.xyz, r1.x, r4
mad_pp r1.xyz, r1, c7.x, r3
add_pp r0.xyz, r1, r2
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [unity_Lightmap] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 37 ALU, 2 TEX
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 8 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R2.x, fragment.texcoord[0].z;
MOV R2.y, fragment.texcoord[1].z;
MOV R2.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].w;
MOV R0.z, fragment.texcoord[2].w;
MOV R0.y, fragment.texcoord[1].w;
DP3 R0.w, R2, R0;
MUL R1.xyz, R2, R0.w;
MAD R0.xyz, -R1, c[6].x, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R0;
DP3 R1.w, R3, R2;
ABS R1.w, R1;
ADD R1.w, -R1, c[6].y;
POW R1.w, R1.w, c[4].x;
MOV R2.x, c[2];
MAD R2.w, R1, c[3].x, R2.x;
TEX R1.xyz, R3, texture[0], CUBE;
TEX R0, fragment.texcoord[3], texture[1], 2D;
MUL R1.xyz, R2.w, R1;
DP3_SAT R2.x, R1, c[7];
MUL R3.x, R2, R2;
ADD R3.y, -R3.x, c[6];
MAD R2.xyz, R1, c[1], -R1;
MUL R3.y, R3, c[5].x;
MAD R2.xyz, R3.y, R2, R1;
MOV R1.x, c[6].y;
MAD R1.z, -R1.w, c[0].x, R1.x;
MOV_SAT R1.y, R2.w;
MAD R1.w, R1.z, c[1], R3.x;
ADD R1.x, -R1.y, c[6].y;
MUL R1.xyz, R1.x, c[1];
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[6].z, R2;
MIN result.color.w, R1, c[6].y;
END
# 37 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [unity_Lightmap] 2D
"ps_2_0
; 41 ALU, 2 TEX
dcl_cube s0
dcl_2d s1
def c6, 2.00000000, 0.21997070, 0.70703125, 0.07098389
def c7, 8.00000000, 1.00000000, 0, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xy
texld r4, t3, s1
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r2.xyz, -r1, c6.x, r2
dp3 r1.x, r2, r2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r2
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
add_pp r0.x, -r0, c7.y
mov_pp r0.y, c7
texld r2, r1, s0
pow_pp r1.x, r0.x, c4.x
mov_pp r0.x, c2
mad_pp r0.x, r1.x, c3, r0
mul_pp r5.xyz, r0.x, r2
mov_pp_sat r0.x, r0
mad_pp r1.x, -r1.x, c0, r0.y
add_pp r0.x, -r0, c7.y
mov r2.x, c6.y
mov r2.z, c6.w
mov r2.y, c6.z
dp3_pp_sat r2.x, r5, r2
mad_pp r3.x, -r2, r2, c7.y
mul_pp r2.x, r2, r2
mad_pp r1.x, r1, c1.w, r2
min_pp r0.w, r1.x, c7.y
mad_pp r6.xyz, r5, c1, -r5
mul_pp r3.x, r3, c5
mad_pp r3.xyz, r3.x, r6, r5
mul_pp r0.xyz, r0.x, c1
mul_pp r1.xyz, r4.w, r4
mul_pp r0.xyz, r1, r0
mad_pp r0.xyz, r0, c7.x, r3
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
Float 6 [_Metalics]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 45 ALU, 2 TEX
PARAM c[9] = { program.local[0..6],
		{ 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R1.x, fragment.texcoord[5], texture[1], 2D;
MOV R1.y, fragment.texcoord[0].z;
MOV R1.z, fragment.texcoord[1];
MOV R1.w, fragment.texcoord[2].z;
MOV R2.x, fragment.texcoord[0].w;
MOV R2.z, fragment.texcoord[2].w;
MOV R2.y, fragment.texcoord[1].w;
DP3 R0.x, R1.yzww, R2;
MUL R0.xyz, R1.yzww, R0.x;
MAD R0.xyz, -R0, c[7].x, R2;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R0;
DP3 R0.w, R2, R1.yzww;
ABS R0.w, R0;
ADD R0.w, -R0, c[7].y;
POW R0.w, R0.w, c[5].x;
MOV R1.y, c[3].x;
MAD R1.y, R0.w, c[4].x, R1;
TEX R0.xyz, R2, texture[0], CUBE;
MUL R2.xyz, R0, R1.y;
DP3_SAT R0.y, R2, c[8];
MUL R0.y, R0, R0;
ADD R1.z, -R0.y, c[7].y;
MOV R0.x, c[7].y;
MAD R0.x, -R0.w, c[1], R0;
MAD R0.x, R0, c[2].w, R0.y;
MIN R0.w, R0.x, c[7].y;
MAD R0.xyz, R2, c[2], -R2;
MUL R1.z, R1, c[6].x;
MAD R2.xyz, R1.z, R0, R2;
MOV_SAT R0.z, R1.y;
ADD R0.y, -R0.w, c[7];
ABS R0.x, fragment.texcoord[3].z;
MUL R0.x, R0, R0.y;
MAX R1.y, fragment.texcoord[3].z, R0.x;
ADD R0.y, -R0.z, c[7];
MUL R0.xyz, R0.y, c[2];
MUL R1.w, R1.y, R1.x;
MUL R1.xyz, R0, c[0];
MUL R0.xyz, R0, fragment.texcoord[4];
MUL R1.xyz, R1.w, R1;
MAD R0.xyz, R1, c[7].x, R0;
ADD result.color.xyz, R0, R2;
MOV result.color.w, R0;
END
# 45 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
Float 6 [_Metalics]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] 2D
"ps_2_0
; 47 ALU, 2 TEX
dcl_cube s0
dcl_2d s1
def c7, 2.00000000, 1.00000000, 0, 0
def c8, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
dcl t4.xyz
dcl t5
texldp r3, t5, s1
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r2.xyz, -r1, c7.x, r2
dp3 r1.x, r2, r2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r2
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
add_pp r0.x, -r0, c7.y
mov_pp r4.x, c3
mov_pp r0.y, c7
texld r2, r1, s0
pow_pp r1.x, r0.x, c5.x
mov_pp r0.x, r1.x
mad_pp r1.x, r0, c4, r4
mul_pp r5.xyz, r2, r1.x
dp3_pp_sat r2.x, r5, c8
mul_pp r4.x, r2, r2
mad_pp r0.x, -r0, c1, r0.y
mad_pp r0.x, r0, c2.w, r4
min_pp r0.x, r0, c7.y
mad_pp r2.x, -r2, r2, c7.y
mad_pp r4.xyz, r5, c2, -r5
mul_pp r2.x, r2, c6
mad_pp r5.xyz, r2.x, r4, r5
add_pp r4.x, -r0, c7.y
abs_pp r2.x, t3.z
mul_pp r2.x, r2, r4
mov_pp_sat r4.x, r1
max_pp r1.x, t3.z, r2
add_pp r2.x, -r4, c7.y
mul_pp r1.x, r1, r3
mul_pp r2.xyz, r2.x, c2
mul_pp r3.xyz, r2, c0
mov_pp r0.w, r0.x
mul_pp r2.xyz, r2, t4
mul_pp r1.xyz, r1.x, r3
mad_pp r1.xyz, r1, c7.x, r2
add_pp r0.xyz, r1, r5
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] 2D
SetTexture 2 [unity_Lightmap] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 40 ALU, 3 TEX
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 8 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TXP R3.x, fragment.texcoord[5], texture[1], 2D;
MOV R1.y, fragment.texcoord[1].z;
MOV R1.z, fragment.texcoord[2];
MOV R1.x, fragment.texcoord[0].z;
MOV R0.x, fragment.texcoord[0].w;
MOV R0.z, fragment.texcoord[2].w;
MOV R0.y, fragment.texcoord[1].w;
DP3 R0.w, R1, R0;
MUL R2.xyz, R1, R0.w;
MAD R2.xyz, -R2, c[6].x, R0;
DP3 R0.x, R2, R2;
RSQ R0.x, R0.x;
MUL R3.yzw, R0.x, R2.xxyz;
DP3 R1.x, R3.yzww, R1;
ABS R1.x, R1;
ADD R1.y, -R1.x, c[6];
POW R1.w, R1.y, c[4].x;
MOV R1.x, c[2];
MAD R2.w, R1, c[3].x, R1.x;
TEX R2.xyz, R3.yzww, texture[0], CUBE;
TEX R0, fragment.texcoord[3], texture[2], 2D;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, R2.w, R2;
DP3_SAT R2.x, R1, c[7];
MUL R3.y, R2.x, R2.x;
ADD R3.z, -R3.y, c[6].y;
MAD R2.xyz, R1, c[1], -R1;
MUL R3.z, R3, c[5].x;
MAD R1.xyz, R3.z, R2, R1;
MOV R2.y, c[6];
MAD R1.w, -R1, c[0].x, R2.y;
MOV_SAT R2.x, R2.w;
ADD R2.x, -R2, c[6].y;
MAD R1.w, R1, c[1], R3.y;
MUL R2.xyz, R2.x, c[1];
MUL R0.w, R3.x, c[6].x;
MUL R0.xyz, R0, c[6].z;
MIN R0.xyz, R0, R0.w;
MAD result.color.xyz, R2, R0, R1;
MIN result.color.w, R1, c[6].y;
END
# 40 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_ShadowMapTexture] 2D
SetTexture 2 [unity_Lightmap] 2D
"ps_2_0
; 41 ALU, 3 TEX
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c6, 2.00000000, 8.00000000, 1.00000000, 0
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xy
dcl t5
texldp r5, t5, s1
texld r4, t3, s2
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r2.xyz, -r1, c6.x, r2
dp3 r1.x, r2, r2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r2
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.z
mov_pp r3.x, c2
mov_pp r0.z, c6
texld r2, r1, s0
pow_pp r1.x, r0.x, c4.x
mov_pp r0.x, r1.x
mad_pp r1.x, r0, c3, r3
mul_pp r6.xyz, r1.x, r2
dp3_pp_sat r2.x, r6, c7
mad_pp r3.x, -r2, r2, c6.z
mov_pp_sat r1.x, r1
add_pp r1.x, -r1, c6.z
mad_pp r0.x, -r0, c0, r0.z
mul_pp r2.x, r2, r2
mad_pp r0.x, r0, c1.w, r2
min_pp r0.w, r0.x, c6.z
mul_pp r2.xyz, r4.w, r4
mad_pp r7.xyz, r6, c1, -r6
mul_pp r3.x, r3, c5
mad_pp r3.xyz, r3.x, r7, r6
mul_pp r1.xyz, r1.x, c1
mul_pp r0.x, r5, c6
mul_pp r2.xyz, r2, c6.y
min_pp r0.xyz, r2, r0.x
mad_pp r0.xyz, r1, r0, r3
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"!!GLES"
}

}
	}
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardAdd" }
		ZWrite Off Blend One One Fog { Color (0,0,0,0) }
Program "vp" {
// Vertex combos: 5
//   opengl - ALU: 36 to 45
//   d3d9 - ALU: 39 to 48
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"!!ARBvp1.0
# 44 ALU
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[19];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R3.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[18];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 44 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_2_0
; 47 ALU
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r1, c10
dp4 r3.z, c18, r1
mov r1, c9
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r3.y, c18, r1
mul r1.xyz, v1.w, r0
dp4 r3.x, c18, r2
mad r3.xyz, r3, c16.w, -v0
mov r0.xyz, c17
mov r0.w, c19.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c16.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c16.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c16.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c16.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT3.y, r1, r3
dp3 oT3.z, v2, r3
dp3 oT3.x, v1, r3
dp4 oT4.z, r0, c14
dp4 oT4.y, r0, c13
dp4 oT4.x, r0, c12
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * -((((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_10;
  tmpvar_10[0] = tmpvar_1.xyz;
  tmpvar_10[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_10[2] = tmpvar_2;
  mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_10[0].x;
  tmpvar_11[0].y = tmpvar_10[1].x;
  tmpvar_11[0].z = tmpvar_10[2].x;
  tmpvar_11[1].x = tmpvar_10[0].y;
  tmpvar_11[1].y = tmpvar_10[1].y;
  tmpvar_11[1].z = tmpvar_10[2].y;
  tmpvar_11[2].x = tmpvar_10[0].z;
  tmpvar_11[2].y = tmpvar_10[1].z;
  tmpvar_11[2].z = tmpvar_10[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_12;
  tmpvar_12.xyz = (tmpvar_11 * v_i0_i1.xyz);
  tmpvar_12.w = tmpvar_9.x;
  highp vec4 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * unity_Scale.w);
  tmpvar_3 = tmpvar_13;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_11 * v_i0_i1_i2.xyz);
  tmpvar_14.w = tmpvar_9.y;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_11 * v_i0_i1_i2_i3.xyz);
  tmpvar_16.w = tmpvar_9.z;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_11 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_6 = tmpvar_18;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_18;
  tmpvar_18 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec3 tmpvar_19;
  tmpvar_19 = normalize (xlv_TEXCOORD3);
  lightDir = tmpvar_19;
  highp vec2 tmpvar_20;
  tmpvar_20 = vec2(dot (xlv_TEXCOORD4, xlv_TEXCOORD4));
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_LightTexture0, tmpvar_20);
  mediump vec4 tmpvar_22;
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump float atten;
  atten = tmpvar_21.w;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_23;
  tmpvar_23 = dot (vec3(0.0, 0.0, 1.0), lightDir_i0);
  NdotL = tmpvar_23;
  lowp float tmpvar_24;
  tmpvar_24 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_17)));
  mediump vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_18 * _LightColor0.xyz) * ((tmpvar_24 * atten) * 2.0));
  c_i0_i1.xyz = tmpvar_25;
  c_i0_i1.w = tmpvar_17;
  tmpvar_22 = c_i0_i1;
  c = tmpvar_22;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
"!!ARBvp1.0
# 36 ALU
PARAM c[16] = { { 1 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[14];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[13].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[13].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[3].y, R2, R1;
MUL result.texcoord[2], R0, c[13].w;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 36 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
"vs_2_0
; 39 ALU
def c15, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r3, c8
mov r0, c10
dp4 r1.z, c14, r0
mov r0, c9
dp4 r1.y, c14, r0
dp4 r1.x, c14, r3
mov r0.xyz, c13
mov r0.w, c15.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c12.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 oT3.y, r2, r1
mul oT2, r0, c12.w
dp3 oT3.z, v2, r1
dp3 oT3.x, v1, r1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * -((((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_10;
  tmpvar_10[0] = tmpvar_1.xyz;
  tmpvar_10[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_10[2] = tmpvar_2;
  mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_10[0].x;
  tmpvar_11[0].y = tmpvar_10[1].x;
  tmpvar_11[0].z = tmpvar_10[2].x;
  tmpvar_11[1].x = tmpvar_10[0].y;
  tmpvar_11[1].y = tmpvar_10[1].y;
  tmpvar_11[1].z = tmpvar_10[2].y;
  tmpvar_11[2].x = tmpvar_10[0].z;
  tmpvar_11[2].y = tmpvar_10[1].z;
  tmpvar_11[2].z = tmpvar_10[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_12;
  tmpvar_12.xyz = (tmpvar_11 * v_i0_i1.xyz);
  tmpvar_12.w = tmpvar_9.x;
  highp vec4 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * unity_Scale.w);
  tmpvar_3 = tmpvar_13;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_11 * v_i0_i1_i2.xyz);
  tmpvar_14.w = tmpvar_9.y;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_11 * v_i0_i1_i2_i3.xyz);
  tmpvar_16.w = tmpvar_9.z;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_18;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_18;
  tmpvar_18 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  lightDir = xlv_TEXCOORD3;
  mediump vec4 tmpvar_19;
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_20;
  tmpvar_20 = dot (vec3(0.0, 0.0, 1.0), lightDir_i0);
  NdotL = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_17)));
  mediump vec3 tmpvar_22;
  tmpvar_22 = ((tmpvar_18 * _LightColor0.xyz) * (tmpvar_21 * 2.0));
  c_i0_i1.xyz = tmpvar_22;
  c_i0_i1.w = tmpvar_17;
  tmpvar_19 = c_i0_i1;
  c = tmpvar_19;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"!!ARBvp1.0
# 45 ALU
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[19];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R3.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[18];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP4 result.texcoord[4].w, R0, c[16];
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 45 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_2_0
; 48 ALU
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r1, c10
dp4 r3.z, c18, r1
mov r1, c9
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r3.y, c18, r1
mul r1.xyz, v1.w, r0
dp4 r3.x, c18, r2
mad r3.xyz, r3, c16.w, -v0
mov r0.xyz, c17
mov r0.w, c19.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c16.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c16.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c16.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c16.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT3.y, r1, r3
dp3 oT3.z, v2, r3
dp3 oT3.x, v1, r3
dp4 oT4.w, r0, c15
dp4 oT4.z, r0, c14
dp4 oT4.y, r0, c13
dp4 oT4.x, r0, c12
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * -((((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_10;
  tmpvar_10[0] = tmpvar_1.xyz;
  tmpvar_10[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_10[2] = tmpvar_2;
  mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_10[0].x;
  tmpvar_11[0].y = tmpvar_10[1].x;
  tmpvar_11[0].z = tmpvar_10[2].x;
  tmpvar_11[1].x = tmpvar_10[0].y;
  tmpvar_11[1].y = tmpvar_10[1].y;
  tmpvar_11[1].z = tmpvar_10[2].y;
  tmpvar_11[2].x = tmpvar_10[0].z;
  tmpvar_11[2].y = tmpvar_10[1].z;
  tmpvar_11[2].z = tmpvar_10[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_12;
  tmpvar_12.xyz = (tmpvar_11 * v_i0_i1.xyz);
  tmpvar_12.w = tmpvar_9.x;
  highp vec4 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * unity_Scale.w);
  tmpvar_3 = tmpvar_13;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_11 * v_i0_i1_i2.xyz);
  tmpvar_14.w = tmpvar_9.y;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_11 * v_i0_i1_i2_i3.xyz);
  tmpvar_16.w = tmpvar_9.z;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_11 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_6 = tmpvar_18;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_18;
  tmpvar_18 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec3 tmpvar_19;
  tmpvar_19 = normalize (xlv_TEXCOORD3);
  lightDir = tmpvar_19;
  lowp float tmpvar_20;
  tmpvar_20 = texture2D (_LightTexture0, ((xlv_TEXCOORD4.xy / xlv_TEXCOORD4.w) + 0.5)).w;
  lowp float tmpvar_21;
  highp vec3 LightCoord_i0;
  LightCoord_i0 = xlv_TEXCOORD4.xyz;
  highp vec2 tmpvar_22;
  tmpvar_22 = vec2(dot (LightCoord_i0, LightCoord_i0));
  tmpvar_21 = texture2D (_LightTextureB0, tmpvar_22).w;
  mediump vec4 tmpvar_23;
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump float atten;
  atten = ((float((xlv_TEXCOORD4.z > 0.0)) * tmpvar_20) * tmpvar_21);
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_24;
  tmpvar_24 = dot (vec3(0.0, 0.0, 1.0), lightDir_i0);
  NdotL = tmpvar_24;
  lowp float tmpvar_25;
  tmpvar_25 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_17)));
  mediump vec3 tmpvar_26;
  tmpvar_26 = ((tmpvar_18 * _LightColor0.xyz) * ((tmpvar_25 * atten) * 2.0));
  c_i0_i1.xyz = tmpvar_26;
  c_i0_i1.w = tmpvar_17;
  tmpvar_23 = c_i0_i1;
  c = tmpvar_23;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"!!ARBvp1.0
# 44 ALU
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[19];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R3.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[18];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 44 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_2_0
; 47 ALU
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r1, c10
dp4 r3.z, c18, r1
mov r1, c9
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r3.y, c18, r1
mul r1.xyz, v1.w, r0
dp4 r3.x, c18, r2
mad r3.xyz, r3, c16.w, -v0
mov r0.xyz, c17
mov r0.w, c19.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c16.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c16.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c16.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c16.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT3.y, r1, r3
dp3 oT3.z, v2, r3
dp3 oT3.x, v1, r3
dp4 oT4.z, r0, c14
dp4 oT4.y, r0, c13
dp4 oT4.x, r0, c12
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * -((((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_10;
  tmpvar_10[0] = tmpvar_1.xyz;
  tmpvar_10[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_10[2] = tmpvar_2;
  mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_10[0].x;
  tmpvar_11[0].y = tmpvar_10[1].x;
  tmpvar_11[0].z = tmpvar_10[2].x;
  tmpvar_11[1].x = tmpvar_10[0].y;
  tmpvar_11[1].y = tmpvar_10[1].y;
  tmpvar_11[1].z = tmpvar_10[2].y;
  tmpvar_11[2].x = tmpvar_10[0].z;
  tmpvar_11[2].y = tmpvar_10[1].z;
  tmpvar_11[2].z = tmpvar_10[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_12;
  tmpvar_12.xyz = (tmpvar_11 * v_i0_i1.xyz);
  tmpvar_12.w = tmpvar_9.x;
  highp vec4 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * unity_Scale.w);
  tmpvar_3 = tmpvar_13;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_11 * v_i0_i1_i2.xyz);
  tmpvar_14.w = tmpvar_9.y;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_11 * v_i0_i1_i2_i3.xyz);
  tmpvar_16.w = tmpvar_9.z;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_11 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_6 = tmpvar_18;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform sampler2D _LightTextureB0;
uniform samplerCube _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_18;
  tmpvar_18 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  mediump vec3 tmpvar_19;
  tmpvar_19 = normalize (xlv_TEXCOORD3);
  lightDir = tmpvar_19;
  highp vec2 tmpvar_20;
  tmpvar_20 = vec2(dot (xlv_TEXCOORD4, xlv_TEXCOORD4));
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_LightTextureB0, tmpvar_20);
  lowp vec4 tmpvar_22;
  tmpvar_22 = textureCube (_LightTexture0, xlv_TEXCOORD4);
  mediump vec4 tmpvar_23;
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump float atten;
  atten = (tmpvar_21.w * tmpvar_22.w);
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_24;
  tmpvar_24 = dot (vec3(0.0, 0.0, 1.0), lightDir_i0);
  NdotL = tmpvar_24;
  lowp float tmpvar_25;
  tmpvar_25 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_17)));
  mediump vec3 tmpvar_26;
  tmpvar_26 = ((tmpvar_18 * _LightColor0.xyz) * ((tmpvar_25 * atten) * 2.0));
  c_i0_i1.xyz = tmpvar_26;
  c_i0_i1.w = tmpvar_17;
  tmpvar_23 = c_i0_i1;
  c = tmpvar_23;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"!!ARBvp1.0
# 42 ALU
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[19];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[18];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[17].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[17].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 42 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_2_0
; 45 ALU
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r3, c8
mov r0, c10
dp4 r1.z, c18, r0
mov r0, c9
dp4 r1.y, c18, r0
dp4 r1.x, c18, r3
mov r0.xyz, c17
mov r0.w, c19.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c16.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c16.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c16.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c16.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT3.y, r2, r1
dp3 oT3.z, v2, r1
dp3 oT3.x, v1, r1
dp4 oT4.y, r0, c13
dp4 oT4.x, r0, c12
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * -((((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_10;
  tmpvar_10[0] = tmpvar_1.xyz;
  tmpvar_10[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_10[2] = tmpvar_2;
  mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_10[0].x;
  tmpvar_11[0].y = tmpvar_10[1].x;
  tmpvar_11[0].z = tmpvar_10[2].x;
  tmpvar_11[1].x = tmpvar_10[0].y;
  tmpvar_11[1].y = tmpvar_10[1].y;
  tmpvar_11[1].z = tmpvar_10[2].y;
  tmpvar_11[2].x = tmpvar_10[0].z;
  tmpvar_11[2].y = tmpvar_10[1].z;
  tmpvar_11[2].z = tmpvar_10[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_12;
  tmpvar_12.xyz = (tmpvar_11 * v_i0_i1.xyz);
  tmpvar_12.w = tmpvar_9.x;
  highp vec4 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * unity_Scale.w);
  tmpvar_3 = tmpvar_13;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_11 * v_i0_i1_i2.xyz);
  tmpvar_14.w = tmpvar_9.y;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_11 * v_i0_i1_i2_i3.xyz);
  tmpvar_16.w = tmpvar_9.z;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_18;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
lowp vec4 xlat_mutable__Color;
uniform lowp vec4 _Color;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _EdgeAlpha;
uniform samplerCube _Cube;
void main ()
{
  xlat_mutable__Color = _Color;
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD0.w;
  tmpvar_5.y = xlv_TEXCOORD1.w;
  tmpvar_5.z = xlv_TEXCOORD2.w;
  tmpvar_1 = tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.xyz;
  tmpvar_2 = tmpvar_6;
  lowp vec3 tmpvar_7;
  tmpvar_7 = xlv_TEXCOORD1.xyz;
  tmpvar_3 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD2.xyz;
  tmpvar_4 = tmpvar_8;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_9.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_9.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize (reflect (tmpvar_1, tmpvar_9));
  worldRefl = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_2, vec3(0.0, 0.0, 1.0));
  tmpvar_11.y = dot (tmpvar_3, vec3(0.0, 0.0, 1.0));
  tmpvar_11.z = dot (tmpvar_4, vec3(0.0, 0.0, 1.0));
  worldNormal = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_13;
  tmpvar_13 = pow ((1.0 - tmpvar_12), _FrezFalloff);
  frez = tmpvar_13;
  xlat_mutable__Color.w = (_Color.w * (1.0 - (frez * _EdgeAlpha)));
  lowp float tmpvar_14;
  tmpvar_14 = (frez * _FrezPow);
  frez = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (_Reflection + tmpvar_14);
  float tmpvar_16;
  tmpvar_16 = clamp (dot ((textureCube (_Cube, worldRefl).xyz * tmpvar_15), vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_17;
  tmpvar_17 = min ((xlat_mutable__Color.w + (tmpvar_16 * tmpvar_16)), 1.0);
  lowp vec3 tmpvar_18;
  tmpvar_18 = (xlat_mutable__Color.xyz * (1.0 - clamp (tmpvar_15, 0.0, 1.0)));
  lightDir = xlv_TEXCOORD3;
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_LightTexture0, xlv_TEXCOORD4);
  mediump vec4 tmpvar_20;
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump float atten;
  atten = tmpvar_19.w;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_21;
  tmpvar_21 = dot (vec3(0.0, 0.0, 1.0), lightDir_i0);
  NdotL = tmpvar_21;
  lowp float tmpvar_22;
  tmpvar_22 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_17)));
  mediump vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_18 * _LightColor0.xyz) * ((tmpvar_22 * atten) * 2.0));
  c_i0_i1.xyz = tmpvar_23;
  c_i0_i1.w = tmpvar_17;
  tmpvar_20 = c_i0_i1;
  c = tmpvar_20;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 5
//   opengl - ALU: 37 to 49, TEX: 1 to 3
//   d3d9 - ALU: 39 to 50, TEX: 1 to 3
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 43 ALU, 2 TEX
PARAM c[8] = { program.local[0..5],
		{ 0, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[6].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R0.x, R2, R0;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
ABS R0.x, R0;
ADD R0.x, -R0, c[6].z;
POW R0.y, R0.x, c[5].x;
MOV R0.z, c[3].x;
MAD R0.x, R0.y, c[4], R0.z;
MOV R0.z, c[6];
MAD R0.y, -R0, c[1].x, R0.z;
MOV result.color.w, c[6].x;
TEX R1.xyz, R2, texture[0], CUBE;
TEX R0.w, R0.w, texture[1], 2D;
MUL R1.xyz, R1, R0.x;
DP3_SAT R1.x, R1, c[7];
MUL R1.x, R1, R1;
MAD R0.y, R0, c[2].w, R1.x;
MIN R0.z, R0.y, c[6];
DP3 R0.y, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.y, R0.y;
MUL R1.x, R0.y, fragment.texcoord[3].z;
MOV_SAT R0.x, R0;
ADD R0.y, -R0.x, c[6].z;
ABS R0.x, R1;
ADD R0.z, -R0, c[6];
MUL R1.y, R0.x, R0.z;
MUL R0.xyz, R0.y, c[2];
MUL R2.xyz, R0, c[0];
MAX R1.x, R1, R1.y;
MUL R0.x, R1, R0.w;
MUL R0.xyz, R0.x, R2;
MUL result.color.xyz, R0, c[6].y;
END
# 43 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
"ps_2_0
; 45 ALU, 2 TEX
dcl_cube s0
dcl_2d s1
def c6, 2.00000000, 1.00000000, 0.00000000, 0
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
dcl t4.xyz
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r3.xyz, -r1, c6.x, r2
dp3 r1.x, r3, r3
rsq r1.x, r1.x
mul r1.xyz, r1.x, r3
dp3_pp r0.x, r1, r0
dp3 r2.x, t4, t4
mov r3.xy, r2.x
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
mov_pp r0.y, c6
mov_pp r0.w, c6.z
texld r2, r1, s0
texld r3, r3, s1
pow_pp r1.x, r0.x, c5.x
mov_pp r0.x, c3
mad_pp r0.x, r1.x, c4, r0
mul_pp r2.xyz, r2, r0.x
dp3_pp_sat r2.x, r2, c7
mad_pp r1.x, -r1.x, c1, r0.y
mul_pp r2.x, r2, r2
mad_pp r1.x, r1, c2.w, r2
dp3_pp r2.x, t3, t3
rsq_pp r2.x, r2.x
mul_pp r0.z, r2.x, t3
min_pp r1.x, r1, c6.y
abs_pp r2.x, r0.z
add_pp r1.x, -r1, c6.y
mul_pp r1.x, r2, r1
mov_pp_sat r0.x, r0
add_pp r2.x, -r0, c6.y
max_pp r0.x, r0.z, r1
mul_pp r1.xyz, r2.x, c2
mul_pp r1.xyz, r1, c0
mul_pp r0.x, r0, r3
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c6.x
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "POINT" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 37 ALU, 1 TEX
PARAM c[8] = { program.local[0..5],
		{ 0, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[6].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R0.x, R2, R0;
ABS R0.x, R0;
ADD R0.x, -R0, c[6].z;
POW R0.z, R0.x, c[5].x;
MOV R0.y, c[3].x;
MAD R0.x, R0.z, c[4], R0.y;
MOV R0.y, c[6].z;
MAD R0.y, -R0.z, c[1].x, R0;
MOV_SAT R0.z, R0.x;
ADD R0.z, -R0, c[6];
MOV result.color.w, c[6].x;
TEX R1.xyz, R2, texture[0], CUBE;
MUL R1.xyz, R1, R0.x;
DP3_SAT R0.w, R1, c[7];
MUL R1.xyz, R0.z, c[2];
MUL R0.w, R0, R0;
MAD R0.y, R0, c[2].w, R0.w;
MIN R0.x, R0.y, c[6].z;
ADD R0.y, -R0.x, c[6].z;
ABS R0.x, fragment.texcoord[3].z;
MUL R0.x, R0, R0.y;
MUL R1.xyz, R1, c[0];
MAX R0.x, fragment.texcoord[3].z, R0;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[6].y;
END
# 37 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
"ps_2_0
; 39 ALU, 1 TEX
dcl_cube s0
def c6, 2.00000000, 1.00000000, 0.00000000, 0
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r2.xyz, -r1, c6.x, r2
dp3 r1.x, r2, r2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r2
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
mov_pp r0.y, c6
mov_pp r0.w, c6.z
texld r2, r1, s0
pow_pp r1.x, r0.x, c5.x
mov_pp r0.x, c3
mad_pp r0.x, r1.x, c4, r0
mul_pp r2.xyz, r2, r0.x
dp3_pp_sat r2.x, r2, c7
mad_pp r1.x, -r1.x, c1, r0.y
mul_pp r2.x, r2, r2
mad_pp r1.x, r1, c2.w, r2
mov_pp_sat r0.x, r0
add_pp r2.x, -r0, c6.y
min_pp r1.x, r1, c6.y
add_pp r0.x, -r1, c6.y
abs_pp r1.x, t3.z
mul_pp r0.x, r1, r0
mul_pp r2.xyz, r2.x, c2
mul_pp r1.xyz, r2, c0
max_pp r0.x, t3.z, r0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c6.x
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
SetTexture 2 [_LightTextureB0] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 49 ALU, 3 TEX
PARAM c[8] = { program.local[0..5],
		{ 0, 2, 1, 0.5 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
RCP R1.w, fragment.texcoord[4].w;
MAD R3.xy, fragment.texcoord[4], R1.w, c[6].w;
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
MOV R1.y, fragment.texcoord[1].z;
MOV R1.z, fragment.texcoord[2];
MOV R1.x, fragment.texcoord[0].z;
MOV R0.x, fragment.texcoord[0].w;
MOV R0.z, fragment.texcoord[2].w;
MOV R0.y, fragment.texcoord[1].w;
DP3 R0.w, R1, R0;
MUL R2.xyz, R1, R0.w;
MAD R0.xyz, -R2, c[6].y, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R0;
DP3 R1.x, R2, R1;
ABS R1.x, R1;
ADD R1.x, -R1, c[6].z;
POW R1.y, R1.x, c[5].x;
MOV R1.z, c[3].x;
MAD R1.x, R1.y, c[4], R1.z;
MOV result.color.w, c[6].x;
TEX R0.xyz, R2, texture[0], CUBE;
TEX R0.w, R3, texture[1], 2D;
TEX R1.w, R1.w, texture[2], 2D;
MUL R0.xyz, R0, R1.x;
DP3_SAT R0.y, R0, c[7];
MOV R0.x, c[6].z;
MAD R0.x, -R1.y, c[1], R0;
MUL R0.y, R0, R0;
MAD R0.y, R0.x, c[2].w, R0;
MIN R0.y, R0, c[6].z;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
SLT R1.y, c[6].x, fragment.texcoord[4].z;
MUL R0.w, R1.y, R0;
ADD R0.z, -R0.y, c[6];
MUL R0.x, R0, fragment.texcoord[3].z;
ABS R0.y, R0.x;
MUL R0.y, R0, R0.z;
MOV_SAT R1.x, R1;
ADD R0.z, -R1.x, c[6];
MAX R1.x, R0, R0.y;
MUL R0.xyz, R0.z, c[2];
MUL R2.xyz, R0, c[0];
MUL R0.w, R0, R1;
MUL R0.x, R1, R0.w;
MUL R0.xyz, R0.x, R2;
MUL result.color.xyz, R0, c[6].y;
END
# 49 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
SetTexture 2 [_LightTextureB0] 2D
"ps_2_0
; 50 ALU, 3 TEX
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c6, 2.00000000, 1.00000000, 0.00000000, 0.50000000
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
dcl t4
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r2.xyz, -r1, c6.x, r2
dp3 r1.x, r2, r2
rsq r1.x, r1.x
mul r3.xyz, r1.x, r2
dp3_pp r0.x, r3, r0
rcp r1.x, t4.w
mad r4.xy, t4, r1.x, c6.w
dp3 r2.x, t4, t4
mov r2.xy, r2.x
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
mov_pp r0.y, c6
mov_pp r0.w, c6.z
texld r1, r3, s0
texld r2, r2, s2
texld r4, r4, s1
pow_pp r3.x, r0.x, c5.x
mov_pp r0.x, c3
mad_pp r0.x, r3.x, c4, r0
mul_pp r1.xyz, r1, r0.x
dp3_pp_sat r1.x, r1, c7
mad_pp r3.x, -r3.x, c1, r0.y
mul_pp r1.x, r1, r1
mad_pp r1.x, r3, c2.w, r1
dp3_pp r3.x, t3, t3
rsq_pp r3.x, r3.x
mul_pp r0.z, r3.x, t3
min_pp r1.x, r1, c6.y
abs_pp r3.x, r0.z
add_pp r1.x, -r1, c6.y
mul_pp r1.x, r3, r1
mov_pp_sat r0.x, r0
add_pp r3.x, -r0, c6.y
max_pp r0.x, r0.z, r1
mul_pp r3.xyz, r3.x, c2
cmp r1.x, -t4.z, c6.z, c6.y
mul_pp r1.x, r1, r4.w
mul_pp r1.x, r1, r2
mul_pp r2.xyz, r3, c0
mul_pp r0.x, r0, r1
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c6.x
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTextureB0] 2D
SetTexture 2 [_LightTexture0] CUBE
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 45 ALU, 3 TEX
PARAM c[8] = { program.local[0..5],
		{ 0, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.w, fragment.texcoord[4], texture[2], CUBE;
MOV R1.y, fragment.texcoord[1].z;
MOV R1.z, fragment.texcoord[2];
MOV R1.x, fragment.texcoord[0].z;
MOV R0.x, fragment.texcoord[0].w;
MOV R0.z, fragment.texcoord[2].w;
MOV R0.y, fragment.texcoord[1].w;
DP3 R0.w, R1, R0;
MUL R2.xyz, R1, R0.w;
MAD R0.xyz, -R2, c[6].y, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R0;
DP3 R1.x, R2, R1;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
ABS R1.x, R1;
ADD R1.x, -R1, c[6].z;
POW R1.y, R1.x, c[5].x;
MOV R1.z, c[3].x;
MAD R1.x, R1.y, c[4], R1.z;
MOV result.color.w, c[6].x;
TEX R0.xyz, R2, texture[0], CUBE;
TEX R0.w, R0.w, texture[1], 2D;
MUL R0.xyz, R0, R1.x;
DP3_SAT R0.y, R0, c[7];
MOV R0.x, c[6].z;
MAD R0.x, -R1.y, c[1], R0;
MUL R0.y, R0, R0;
MAD R0.y, R0.x, c[2].w, R0;
MIN R0.y, R0, c[6].z;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
ADD R0.z, -R0.y, c[6];
MUL R0.x, R0, fragment.texcoord[3].z;
ABS R0.y, R0.x;
MUL R0.y, R0, R0.z;
MOV_SAT R1.x, R1;
ADD R0.z, -R1.x, c[6];
MAX R1.x, R0, R0.y;
MUL R0.xyz, R0.z, c[2];
MUL R2.xyz, R0, c[0];
MUL R0.w, R0, R1;
MUL R0.x, R1, R0.w;
MUL R0.xyz, R0.x, R2;
MUL result.color.xyz, R0, c[6].y;
END
# 45 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTextureB0] 2D
SetTexture 2 [_LightTexture0] CUBE
"ps_2_0
; 46 ALU, 3 TEX
dcl_cube s0
dcl_2d s1
dcl_cube s2
def c6, 2.00000000, 1.00000000, 0.00000000, 0
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
dcl t4.xyz
mov_pp r2.x, t0.z
mov_pp r2.y, t1.z
mov_pp r2.z, t2
mov r1.x, t0.w
mov r1.z, t2.w
mov r1.y, t1.w
dp3 r0.x, r2, r1
mul r0.xyz, r2, r0.x
mad r3.xyz, -r0, c6.x, r1
dp3 r0.x, r3, r3
rsq r1.x, r0.x
mul r3.xyz, r1.x, r3
dp3 r0.x, t4, t4
mov r0.xy, r0.x
texld r4, r0, s1
texld r0, t4, s2
texld r1, r3, s0
dp3_pp r0.x, r3, r2
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
pow_pp r2.x, r0.x, c5.x
mov_pp r0.x, c3
mad_pp r0.x, r2.x, c4, r0
mov_pp r0.y, c6
mul_pp r1.xyz, r1, r0.x
dp3_pp_sat r1.x, r1, c7
mad_pp r2.x, -r2.x, c1, r0.y
mul_pp r1.x, r1, r1
mad_pp r1.x, r2, c2.w, r1
dp3_pp r2.x, t3, t3
rsq_pp r2.x, r2.x
mul_pp r0.z, r2.x, t3
min_pp r1.x, r1, c6.y
abs_pp r2.x, r0.z
add_pp r1.x, -r1, c6.y
mul_pp r1.x, r2, r1
mov_pp_sat r0.x, r0
add_pp r2.x, -r0, c6.y
max_pp r0.x, r0.z, r1
mul_pp r2.xyz, r2.x, c2
mul r1.x, r4, r0.w
mul_pp r2.xyz, r2, c0
mul_pp r0.x, r0, r1
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c6.x
mov_pp r0.w, c6.z
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 39 ALU, 2 TEX
PARAM c[8] = { program.local[0..5],
		{ 0, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[6].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R0.x, R2, R0;
ABS R0.x, R0;
ADD R0.x, -R0, c[6].z;
POW R0.y, R0.x, c[5].x;
MOV R0.z, c[3].x;
MAD R0.x, R0.y, c[4], R0.z;
MOV R0.z, c[6];
MAD R0.y, -R0, c[1].x, R0.z;
MOV result.color.w, c[6].x;
TEX R1.xyz, R2, texture[0], CUBE;
TEX R0.w, fragment.texcoord[4], texture[1], 2D;
MUL R1.xyz, R1, R0.x;
DP3_SAT R1.x, R1, c[7];
MUL R1.x, R1, R1;
MAD R0.y, R0, c[2].w, R1.x;
MOV_SAT R0.x, R0;
ADD R0.z, -R0.x, c[6];
MUL R1.xyz, R0.z, c[2];
MIN R0.y, R0, c[6].z;
ADD R0.y, -R0, c[6].z;
ABS R0.x, fragment.texcoord[3].z;
MUL R0.x, R0, R0.y;
MAX R0.x, fragment.texcoord[3].z, R0;
MUL R1.xyz, R1, c[0];
MUL R0.x, R0, R0.w;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[6].y;
END
# 39 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE
SetTexture 1 [_LightTexture0] 2D
"ps_2_0
; 40 ALU, 2 TEX
dcl_cube s0
dcl_2d s1
def c6, 2.00000000, 1.00000000, 0.00000000, 0
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
dcl t4.xy
mov_pp r1.x, t0.z
mov_pp r1.y, t1.z
mov_pp r1.z, t2
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r0.x, r1, r2
mul r0.xyz, r1, r0.x
mad r2.xyz, -r0, c6.x, r2
dp3 r0.x, r2, r2
rsq r0.x, r0.x
mul r3.xyz, r0.x, r2
texld r0, t4, s1
texld r2, r3, s0
dp3_pp r0.x, r3, r1
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
pow_pp r1.x, r0.x, c5.x
mov_pp r0.x, c3
mad_pp r0.x, r1.x, c4, r0
mov_pp r0.y, c6
mul_pp r2.xyz, r2, r0.x
dp3_pp_sat r2.x, r2, c7
mad_pp r1.x, -r1.x, c1, r0.y
mul_pp r2.x, r2, r2
mad_pp r1.x, r1, c2.w, r2
min_pp r1.x, r1, c6.y
mov_pp_sat r0.x, r0
abs_pp r2.x, t3.z
add_pp r1.x, -r1, c6.y
mul_pp r1.x, r2, r1
add_pp r2.x, -r0, c6.y
max_pp r0.x, t3.z, r1
mul_pp r0.x, r0, r0.w
mul_pp r1.xyz, r2.x, c2
mul_pp r1.xyz, r1, c0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c6.x
mov_pp r0.w, c6.z
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES"
}

}
	}

#LINE 46

	
}
	Fallback "Diffuse"
}

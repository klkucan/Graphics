﻿#if !defined(NORMALS_RENDERING_PASS)
#define NORMALS_RENDERING_PASS

#include "UnityCG.cginc"

struct appdata
{
	float4 vertex : POSITION;
	fixed2 uv : TEXCOORD0;
};

struct v2f
{
	float4 vertex : SV_POSITION;
	fixed2 uv : TEXCOORD0;
};

sampler2D _NormalMap;
float4 _NormalMap_ST;

v2f NormalsRenderingVertex(appdata v)
{
    v2f o;
    o.vertex = UnityObjectToClipPos(v.vertex);
    o.uv = TRANSFORM_TEX(v.uv, _NormalMap);
    return o;
}

float4 NormalsRenderingFragment(v2f i) : SV_Target
{
	float4 normalMap = tex2D(_NormalMap, i.uv);
	return normalMap;
}
#endif
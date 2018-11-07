﻿Shader "2D Lighting/Sprite Lighting"
{
	Properties
	{
		_MainTex ("Diffuse", 2D) = "white" {}
		_MaskTex("Mask", 2D) = "Black" {}
		_NormalMap("Normal Map", 2D) = "Black" {}
		_SpecularMultiplier("Specular Multiplier", Float) = 1
		_RimMultiplier("Rim Multiplier", Float) = 1
		_AmbientMultiplier("Ambient Multiplier", Float) = 1
	}
	SubShader
	{
		Tags { "RenderType"="Transparent" }
		Blend SrcAlpha OneMinusSrcAlpha
		Cull Off
		ZWrite Off

		Pass
		{
			Tags { "LightMode" = "CombinedShapeLight" }
			CGPROGRAM
			#pragma vertex CombinedShapeLightVertex
			#pragma fragment CombinedShapeLightFragment
			#pragma multi_compile USE_SPECULAR_TEXTURE __
			#pragma multi_compile USE_AMBIENT_TEXTURE __
			#pragma multi_compile USE_RIM_TEXTURE  __

			#pragma multi_compile USE_POINT_LIGHTS __
			#pragma multi_compile USE_POINT_LIGHT_COOKIES __ 

			#include "Include/CombinedShapeLightPass.cginc"
			ENDCG
		}

		Pass
		{
			Tags { "LightMode" = "NormalsRendering"}
			CGPROGRAM
			#pragma vertex NormalsRenderingVertex
			#pragma fragment NormalsRenderingFragment

			#include "Include/NormalsRenderingPass.cginc"
			ENDCG
		}
	}
}

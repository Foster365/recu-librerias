// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Lava Shader"
{
	Properties
	{
		_LavaFlowmapTexture("Lava Flowmap Texture", 2D) = "white" {}
		_Speed("Speed", Float) = 1
		_DiffuseTexture("Diffuse Texture", 2D) = "white" {}
		_LavaFlowmapTiling("Lava Flowmap Tiling", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _DiffuseTexture;
		uniform float _LavaFlowmapTiling;
		uniform sampler2D _LavaFlowmapTexture;
		uniform float4 _LavaFlowmapTexture_ST;
		uniform float _Speed;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 temp_cast_0 = (_LavaFlowmapTiling).xx;
			float2 uv_TexCoord15 = i.uv_texcoord * temp_cast_0;
			float2 uv_LavaFlowmapTexture = i.uv_texcoord * _LavaFlowmapTexture_ST.xy + _LavaFlowmapTexture_ST.zw;
			float2 blendOpSrc16 = uv_TexCoord15;
			float2 blendOpDest16 = (tex2D( _LavaFlowmapTexture, uv_LavaFlowmapTexture )).rg;
			float temp_output_1_0_g1 = ( _Time.y * _Speed );
			float FlowmapTimeA18 = -(0.0 + (( ( temp_output_1_0_g1 - floor( ( temp_output_1_0_g1 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
			float2 lerpResult17 = lerp( uv_TexCoord15 , ( saturate( ( 1.0 - ( ( 1.0 - blendOpDest16) / max( blendOpSrc16, 0.00001) ) ) )) , 0);
			float2 FlowmapA21 = lerpResult17;
			float4 DiffuseMap27 = tex2D( _DiffuseTexture, FlowmapA21 );
			o.Albedo = DiffuseMap27.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
0;73;1920;928;4172.222;754.6266;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;19;-3538.738,267.0817;Inherit;False;1448.524;413.1508;Comment;7;8;10;9;11;12;13;18;Flowmap Time A;0.2988856,0,0.6415094,1;0;0
Node;AmplifyShaderEditor.SimpleTimeNode;8;-3488.738,356.3779;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-3485.962,475.7985;Inherit;False;Property;_Speed;Speed;1;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-3240.173,381.3728;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;11;-3049.936,379.9842;Inherit;False;Sawtooth Wave;-1;;1;289adb816c3ac6d489f255fc3caf5016;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;22;-3787.631,-670.2098;Inherit;False;1662.301;434.5804;UV's manipulating;8;1;2;15;16;17;20;21;31;Flowmap A;0.9433962,0.8378463,0.2803489,1;0;0
Node;AmplifyShaderEditor.TFHCRemapNode;12;-2820.363,426.2326;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-3585,-597;Inherit;False;Property;_LavaFlowmapTiling;Lava Flowmap Tiling;3;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;13;-2513.091,376.4513;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-3737.631,-492.4635;Inherit;True;Property;_LavaFlowmapTexture;Lava Flowmap Texture;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;2;-3398.739,-465.6294;Inherit;True;True;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;15;-3370.682,-620.2098;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;18;-2317.214,317.0817;Inherit;False;FlowmapTimeA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;16;-3092.572,-456.0469;Inherit;False;ColorBurn;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;20;-2845.237,-407.0479;Inherit;False;18;FlowmapTimeA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;17;-2576.19,-614.6276;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;21;-2349.33,-575.8228;Inherit;True;FlowmapA;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;28;-1536.616,-683.3353;Inherit;False;999.6552;463.5763;Comment;4;27;24;25;23;Diffuse Map;1,1,1,1;0;0
Node;AmplifyShaderEditor.TexturePropertyNode;23;-1430.862,-583.3353;Inherit;True;Property;_DiffuseTexture;Diffuse Texture;2;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode;25;-1413.145,-335.7591;Inherit;False;21;FlowmapA;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;24;-1136.309,-512.559;Inherit;True;Property;_TextureSample0;Texture Sample 0;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;27;-760.9613,-522.7516;Inherit;False;DiffuseMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;29;-273.7356,-18.26183;Inherit;False;27;DiffuseMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-1270.996,701.35;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5;-1097.996,596.35;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;-1450.104,355.214;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Lava Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;9;0;8;0
WireConnection;9;1;10;0
WireConnection;11;1;9;0
WireConnection;12;0;11;0
WireConnection;13;0;12;0
WireConnection;2;0;1;0
WireConnection;15;0;31;0
WireConnection;18;0;13;0
WireConnection;16;0;15;0
WireConnection;16;1;2;0
WireConnection;17;0;15;0
WireConnection;17;1;16;0
WireConnection;17;2;20;0
WireConnection;21;0;17;0
WireConnection;24;0;23;0
WireConnection;24;1;25;0
WireConnection;27;0;24;0
WireConnection;5;0;6;0
WireConnection;5;1;3;0
WireConnection;0;0;29;0
ASEEND*/
//CHKSM=65823689244ABE57630A6DB9A59E698F92A78C0E
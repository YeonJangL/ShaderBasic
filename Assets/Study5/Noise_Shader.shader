// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Noise_Shader"
{
	Properties
	{
		_ccc("ccc", 2D) = "white" {}
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_UVDistortion_Intence("UVDistortion_Intence", Range( 0 , 10)) = 10
		_c("c", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull Off
		ZWrite Off
		Blend One One
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _c;
		uniform sampler2D _ccc;
		uniform sampler2D _TextureSample0;
		uniform float _UVDistortion_Intence;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 appendResult23 = (float2(1.0 , 1.0));
			float2 appendResult18 = (float2(0.0 , 0.0));
			float2 panner4 = ( 1.0 * _Time.y * float2( 0.1,0.2 ) + i.uv_texcoord);
			float4 tex2DNode3 = tex2D( _ccc, panner4 );
			float cos8 = cos( -0.4 * _Time.y );
			float sin8 = sin( -0.4 * _Time.y );
			float2 rotator8 = mul( i.uv_texcoord - float2( 0,0 ) , float2x2( cos8 , -sin8 , sin8 , cos8 )) + float2( 0,0 );
			float4 tex2DNode7 = tex2D( _TextureSample0, rotator8 );
			o.Emission = tex2D( _c, ( ( ( i.uv_texcoord * appendResult23 ) + appendResult18 ) + ( ( ( tex2DNode3.r * tex2DNode7.g ) * ( tex2DNode3.g * tex2DNode7.b ) ) * _UVDistortion_Intence ) ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16700
970;26;946;658;381.6229;1087.09;3.04497;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-1148.585,90.8002;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;-1153.336,447.2307;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;4;-803.649,116.0951;Float;True;3;0;FLOAT2;0.1,0.2;False;2;FLOAT2;0.1,0.2;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;8;-822.7473,480.4753;Float;True;3;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0,0;False;2;FLOAT;-0.4;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;7;-491.0202,460.7437;Float;True;Property;_TextureSample0;Texture Sample 0;2;0;Create;True;0;0;False;0;114dcd02af08a464a8b8a6bd0dbb77a0;114dcd02af08a464a8b8a6bd0dbb77a0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;25;285.8376,-617.7853;Float;True;Constant;_Scale_V;Scale_V;5;0;Create;True;0;0;False;0;1;0;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;-465.6137,116.0954;Float;True;Property;_ccc;ccc;1;0;Create;True;0;0;False;0;114dcd02af08a464a8b8a6bd0dbb77a0;114dcd02af08a464a8b8a6bd0dbb77a0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;24;297.1007,-919.0452;Float;True;Constant;_Float0;Float 0;5;0;Create;True;0;0;False;0;1;0;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;14;612.1538,-983.15;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;20;238.8791,-82.5715;Float;True;Constant;_Move_Y;Move_Y;5;0;Create;True;0;0;False;0;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;23;620.5117,-662.0297;Float;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-66.10094,464.1094;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;19;239.5019,-342.7692;Float;True;Constant;_Move_X;Move_X;5;0;Create;True;0;0;False;0;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-71.00568,113.4214;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;18;594.8527,-6.852591;Float;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;258.3086,273.177;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;212.4144,747.451;Float;True;Property;_UVDistortion_Intence;UVDistortion_Intence;3;0;Create;True;0;0;False;0;10;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;973.3718,-802.5743;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;614.9233,451.1402;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;17;858.4113,-166.2515;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;15;1172.511,336.206;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;16;1473.755,370.2811;Float;True;Property;_c;c;4;0;Create;True;0;0;False;0;23a009e5043560c4ab0211947f130e04;23a009e5043560c4ab0211947f130e04;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;2;1921.355,253.234;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;Noise_Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;False;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;4;1;False;-1;1;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;4;0;5;0
WireConnection;8;0;6;0
WireConnection;7;1;8;0
WireConnection;3;1;4;0
WireConnection;23;0;24;0
WireConnection;23;1;25;0
WireConnection;10;0;3;2
WireConnection;10;1;7;3
WireConnection;9;0;3;1
WireConnection;9;1;7;2
WireConnection;18;0;19;0
WireConnection;18;1;20;0
WireConnection;11;0;9;0
WireConnection;11;1;10;0
WireConnection;22;0;14;0
WireConnection;22;1;23;0
WireConnection;13;0;11;0
WireConnection;13;1;12;0
WireConnection;17;0;22;0
WireConnection;17;1;18;0
WireConnection;15;0;17;0
WireConnection;15;1;13;0
WireConnection;16;1;15;0
WireConnection;2;2;16;0
ASEEND*/
//CHKSM=A4A4595334ADF3CF60DB8522DF726F920A055C1B
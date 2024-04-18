// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Light"
{
	Properties
	{
		_fff("fff", 2D) = "white" {}
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_a("a", 2D) = "white" {}
		_TextureSample1("Texture Sample 1", 2D) = "white" {}
		_Clouds("Clouds", 2D) = "white" {}
		_Final_Intence("Final_Intence", Range( 0 , 10)) = 7.510925
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

		uniform sampler2D _TextureSample0;
		uniform sampler2D _fff;
		uniform sampler2D _Clouds;
		uniform sampler2D _a;
		uniform sampler2D _TextureSample1;
		uniform float _Final_Intence;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 panner5 = ( 1.0 * _Time.y * float2( 0.1,0 ) + i.uv_texcoord);
			float2 panner8 = ( 1.0 * _Time.y * float2( -0.2,0.01 ) + i.uv_texcoord);
			float2 panner10 = ( 1.0 * _Time.y * float2( 0,0.05 ) + i.uv_texcoord);
			float2 panner13 = ( 1.0 * _Time.y * float2( -0.01,0 ) + i.uv_texcoord);
			float2 panner15 = ( 1.0 * _Time.y * float2( 0.012,0 ) + i.uv_texcoord);
			o.Emission = ( ( tex2D( _TextureSample0, panner5 ).r * tex2D( _fff, panner8 ).g * tex2D( _Clouds, panner10 ).r ) * ( tex2D( _a, panner13 ) * tex2D( _TextureSample1, panner15 ) ) * _Final_Intence ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16700
943;127;946;658;1071.712;28.42317;1.982894;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;-1383.362,-53.92487;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;11;-1395.556,-386.5311;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;7;-1374.391,270.6154;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;12;-1366.997,583.479;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;14;-1364.445,930.8034;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;8;-1096.373,276.501;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.2,0.01;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;13;-1088.979,589.3646;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.01,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;5;-1107.538,-48.03931;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;10;-1122.977,-352.4418;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0.05;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;15;-1086.427,936.689;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0.012,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;2;-788.6249,466.0419;Float;True;Property;_a;a;3;0;Create;True;0;0;False;0;041458656676d554d9f32e94b09b5894;041458656676d554d9f32e94b09b5894;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-782.3586,-343.0238;Float;True;Property;_Clouds;Clouds;5;0;Create;True;0;0;False;0;12090db3ab432e643a985e0052313bec;12090db3ab432e643a985e0052313bec;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-783.8387,-74.52431;Float;True;Property;_TextureSample0;Texture Sample 0;2;0;Create;True;0;0;False;0;0d5f7cf6465138b4fab574e08a3e4959;0d5f7cf6465138b4fab574e08a3e4959;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-776.7971,179.2718;Float;True;Property;_fff;fff;1;0;Create;True;0;0;False;0;0d5f7cf6465138b4fab574e08a3e4959;0d5f7cf6465138b4fab574e08a3e4959;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;16;-786.0725,813.3663;Float;True;Property;_TextureSample1;Texture Sample 1;4;0;Create;True;0;0;False;0;041458656676d554d9f32e94b09b5894;041458656676d554d9f32e94b09b5894;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-372.367,385.4145;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-353.8862,-31.90981;Float;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-365.1435,709.8857;Float;False;Property;_Final_Intence;Final_Intence;6;0;Create;True;0;0;False;0;7.510925;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;-89.47691,278.2966;Float;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;230.8119,182.0206;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;Light;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;False;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;4;1;False;-1;1;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;8;0;7;0
WireConnection;13;0;12;0
WireConnection;5;0;6;0
WireConnection;10;0;11;0
WireConnection;15;0;14;0
WireConnection;2;1;13;0
WireConnection;3;1;10;0
WireConnection;4;1;5;0
WireConnection;1;1;8;0
WireConnection;16;1;15;0
WireConnection;17;0;2;0
WireConnection;17;1;16;0
WireConnection;9;0;4;1
WireConnection;9;1;1;2
WireConnection;9;2;3;1
WireConnection;18;0;9;0
WireConnection;18;1;17;0
WireConnection;18;2;19;0
WireConnection;0;2;18;0
ASEEND*/
//CHKSM=C9BDC42F94EB418BDE54C5643EB98773BE187F22
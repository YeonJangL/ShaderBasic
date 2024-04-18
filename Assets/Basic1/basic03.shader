// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "basic03"
{
	Properties
	{
		_Clouds("Clouds", 2D) = "white" {}
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_c("c", 2D) = "white" {}
		_d("d", 2D) = "white" {}
		_Float0("Float 0", Range( 0 , 100)) = 100
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
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Clouds;
		uniform sampler2D _TextureSample0;
		uniform sampler2D _c;
		uniform sampler2D _d;
		uniform float _Float0;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 panner5 = ( 1.0 * _Time.y * float2( 0.1,0.2 ) + i.uv_texcoord);
			float4 tex2DNode1 = tex2D( _Clouds, panner5 );
			float2 panner8 = ( 1.0 * _Time.y * float2( -0.1,-0.15 ) + i.uv_texcoord);
			float4 tex2DNode6 = tex2D( _TextureSample0, panner8 );
			float cos13 = cos( 1.0 * _Time.y );
			float sin13 = sin( 1.0 * _Time.y );
			float2 rotator13 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos13 , -sin13 , sin13 , cos13 )) + float2( 0.5,0.5 );
			float cos15 = cos( -1.0 * _Time.y );
			float sin15 = sin( -1.0 * _Time.y );
			float2 rotator15 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos15 , -sin15 , sin15 , cos15 )) + float2( 0.5,0.5 );
			o.Emission = ( ( ( ( tex2DNode1.r * tex2DNode6.g ) * ( tex2DNode1.g * tex2DNode6.r ) ) * ( tex2D( _c, rotator13 ) * tex2D( _d, rotator15 ) ) ) * _Float0 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16700
953;101;946;658;678.4079;-63.4961;2.507853;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;4;-1238.687,2.69825;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;7;-1237.529,314.3101;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;8;-938.6617,344.4288;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.1,-0.15;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;5;-939.8195,32.817;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,0.2;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;12;-967.9943,650.0485;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;14;-961.7693,1025.595;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RotatorNode;15;-658.8424,1054.643;Float;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;-1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;13;-662.6521,679.0961;Float;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1;-585.5408,44.96772;Float;True;Property;_Clouds;Clouds;1;0;Create;True;0;0;False;0;12090db3ab432e643a985e0052313bec;12090db3ab432e643a985e0052313bec;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;6;-585.3471,350.2195;Float;True;Property;_TextureSample0;Texture Sample 0;2;0;Create;True;0;0;False;0;12090db3ab432e643a985e0052313bec;12090db3ab432e643a985e0052313bec;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-219.6013,691.4011;Float;True;Property;_c;c;3;0;Create;True;0;0;False;0;23a009e5043560c4ab0211947f130e04;23a009e5043560c4ab0211947f130e04;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-132.5536,125.6238;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-133.4555,397.5908;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;-215.2114,955.8356;Float;True;Property;_d;d;4;0;Create;True;0;0;False;0;d8a4409e0b4e2ca4189ec148b0a82950;d8a4409e0b4e2ca4189ec148b0a82950;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;191.0768,249.5139;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;194.6552,812.1525;Float;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;514.4299,541.9504;Float;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;18;500.3207,850.9295;Float;True;Property;_Float0;Float 0;5;0;Create;True;0;0;False;0;100;0;0;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;842.4393,651.0644;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1154.49,554.929;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;basic03;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;0;False;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;4;1;False;-1;1;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;8;0;7;0
WireConnection;5;0;4;0
WireConnection;15;0;14;0
WireConnection;13;0;12;0
WireConnection;1;1;5;0
WireConnection;6;1;8;0
WireConnection;2;1;13;0
WireConnection;9;0;1;1
WireConnection;9;1;6;2
WireConnection;10;0;1;2
WireConnection;10;1;6;1
WireConnection;3;1;15;0
WireConnection;11;0;9;0
WireConnection;11;1;10;0
WireConnection;16;0;2;0
WireConnection;16;1;3;0
WireConnection;17;0;11;0
WireConnection;17;1;16;0
WireConnection;19;0;17;0
WireConnection;19;1;18;0
WireConnection;0;2;19;0
ASEEND*/
//CHKSM=6879C7D6316BF3A7E811C91A2DF9968D7DCBEAD9
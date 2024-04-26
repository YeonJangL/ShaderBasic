// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ShorckWave"
{
	Properties
	{
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_TextureSample2("Texture Sample 2", 2D) = "white" {}
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
		uniform sampler2D _TextureSample2;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float cos19 = cos( 0.2 * _Time.y );
			float sin19 = sin( 0.2 * _Time.y );
			float2 rotator19 = mul( ( 0.5 + ( 0.88 * ( i.uv_texcoord + -0.5 ) ) ) - float2( 0.5,0.5 ) , float2x2( cos19 , -sin19 , sin19 , cos19 )) + float2( 0.5,0.5 );
			float cos28 = cos( -0.1 * _Time.y );
			float sin28 = sin( -0.1 * _Time.y );
			float2 rotator28 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos28 , -sin28 , sin28 , cos28 )) + float2( 0.5,0.5 );
			float clampResult34 = clamp( length( ( i.uv_texcoord + -0.5 ) ) , 0.0 , 1.0 );
			float4 color38 = IsGammaSpace() ? float4(0.2691349,0.9056604,0.4882322,0) : float4(0.0588757,0.7986599,0.2033103,0);
			o.Emission = ( tex2D( _TextureSample0, rotator19 ) * tex2D( _TextureSample2, ( 0.5 + ( 0.88 * ( rotator28 + -0.5 ) ) ) ) * pow( ( 1.0 - clampResult34 ) , 2.54 ) * color38 * 5.0 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16700
917;76;946;658;986.4769;-495.5042;2.969972;True;False
Node;AmplifyShaderEditor.RangedFloatNode;32;-576.9005,2741.519;Float;True;Constant;_Float11;Float 11;5;0;Create;True;0;0;False;0;-0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1815.98,1165.323;Float;True;Constant;_Float2;Float 2;3;0;Create;True;0;0;False;0;-0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;21;-2054.486,1772.551;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;12;-1828.033,912.2734;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;30;-655.6582,2398.075;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;16;-1480.792,900.5643;Float;False;Constant;_Float3;Float 3;3;0;Create;True;0;0;False;0;0.88;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;28;-1752.662,1739.999;Float;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;-0.1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;31;-274.0287,2524.426;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1506.012,2058.758;Float;True;Constant;_Float8;Float 8;3;0;Create;True;0;0;False;0;-0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;13;-1511.716,1056.874;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-1201.429,1080.974;Float;True;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1111.162,928.0176;Float;False;Constant;_Float4;Float 4;3;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LengthOpNode;33;43.63257,2551.775;Float;True;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-1170.824,1793.999;Float;False;Constant;_Float9;Float 9;3;0;Create;True;0;0;False;0;0.88;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;22;-1201.748,1950.309;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ClampOpNode;34;285.0552,2549.101;Float;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-891.4611,1974.409;Float;True;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;26;-801.1941,1821.453;Float;False;Constant;_Float10;Float 10;3;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;15;-891.1409,1062.899;Float;True;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;25;-581.173,1956.334;Float;True;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;35;557.0342,2558.014;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;37;577.2717,2844.297;Float;True;Constant;_Power_Exp;Power_Exp;5;0;Create;True;0;0;False;0;2.54;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;19;-641.6093,972.0787;Float;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;0.2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PowerNode;36;823.1512,2551.211;Float;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;27;-261.2709,1875.689;Float;True;Property;_TextureSample2;Texture Sample 2;4;0;Create;True;0;0;False;0;61f5c8720ce861843a4e3d2c508c483d;61f5c8720ce861843a4e3d2c508c483d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;38;542.7462,1863.599;Float;False;Constant;_Color0;Color 0;5;0;Create;True;0;0;False;0;0.2691349,0.9056604,0.4882322,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;39;579.4686,2106.481;Float;True;Constant;_Final_Intance;Final_Intance;5;0;Create;True;0;0;False;0;5;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;18;-340.4055,988.4925;Float;True;Property;_TextureSample0;Texture Sample 0;3;0;Create;True;0;0;False;0;61f5c8720ce861843a4e3d2c508c483d;61f5c8720ce861843a4e3d2c508c483d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;797.1586,1409.806;Float;True;5;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;4;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3;-1498.475,237.9694;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-1532.396,14.22664;Float;False;Constant;_AMA;AMA;3;0;Create;True;0;0;False;0;0.1;0;0.1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-1028.99,29.71428;Float;False;Constant;_Float1;Float 1;3;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1872.091,553.5664;Float;True;Constant;_Float0;Float 0;3;0;Create;True;0;0;False;0;-0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;-1887.109,211.1405;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;-1177.564,238.8149;Float;True;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5;-878.2047,239.9074;Float;True;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;2;-581.6569,254.0757;Float;True;Property;_shock;shock;2;0;Create;True;0;0;False;0;61f5c8720ce861843a4e3d2c508c483d;61f5c8720ce861843a4e3d2c508c483d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;630.8359,1013.088;Float;True;Property;_draw;draw;1;0;Create;True;0;0;False;0;dfef7088c537d1c4e8aeea67cb2156b5;dfef7088c537d1c4e8aeea67cb2156b5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1325.648,1357.195;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;ShorckWave;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;False;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;4;1;False;-1;1;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;28;0;21;0
WireConnection;31;0;30;0
WireConnection;31;1;32;0
WireConnection;13;0;12;0
WireConnection;13;1;10;0
WireConnection;14;0;16;0
WireConnection;14;1;13;0
WireConnection;33;0;31;0
WireConnection;22;0;28;0
WireConnection;22;1;20;0
WireConnection;34;0;33;0
WireConnection;23;0;24;0
WireConnection;23;1;22;0
WireConnection;15;0;17;0
WireConnection;15;1;14;0
WireConnection;25;0;26;0
WireConnection;25;1;23;0
WireConnection;35;0;34;0
WireConnection;19;0;15;0
WireConnection;36;0;35;0
WireConnection;36;1;37;0
WireConnection;27;1;25;0
WireConnection;18;1;19;0
WireConnection;29;0;18;0
WireConnection;29;1;27;0
WireConnection;29;2;36;0
WireConnection;29;3;38;0
WireConnection;29;4;39;0
WireConnection;3;0;6;0
WireConnection;3;1;7;0
WireConnection;4;0;8;0
WireConnection;4;1;3;0
WireConnection;5;0;9;0
WireConnection;5;1;4;0
WireConnection;2;1;5;0
WireConnection;0;2;29;0
ASEEND*/
//CHKSM=1707A81714D5C33F12A076D9B50ED8057850727E
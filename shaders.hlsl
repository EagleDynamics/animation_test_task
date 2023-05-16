cbuffer constants : register(b0)
{
    float4x4 modelViewProj;
};

struct VS_Input {
    float3 pos : POSITION;
    float3 normal : NORMAL;
};

struct VS_Output {
    float4 pos : SV_POSITION;
    float3 normal : NORMAL;
};

VS_Output vs_main(VS_Input input)
{
    VS_Output output;
    output.pos = mul(float4(input.pos, 1.0f), modelViewProj);
    output.normal = input.normal;
    return output;
}

float4 ps_main(VS_Output input) : SV_Target
{
	float3 dir = float3(1, 1, 1);
	float color = clamp(dot(dir, input.normal), 0, 1);
    return float4(color, color, color, 1);
}

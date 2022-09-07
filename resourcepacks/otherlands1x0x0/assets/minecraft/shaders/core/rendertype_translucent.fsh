#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec4 normal;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if ( color.a <= 190.0/255.0 ) {
    if ( color.a >= 170.0/255.0 ) {
	color.r = color.r * 2.0;
	color.g = color.g * 2.0;
	color.b = color.b * 2.0;
	}
}
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}

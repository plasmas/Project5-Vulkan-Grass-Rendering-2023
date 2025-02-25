#version 450
#extension GL_ARB_separate_shader_objects : enable

#define TESSELATION_LEVEL 7.0;

layout(vertices = 1) out;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare tessellation control shader inputs and outputs
layout(location = 0) in vec4 v0_in[];
layout(location = 1) in vec4 v1_in[];
layout(location = 2) in vec4 v2_in[];
layout(location = 3) in vec4 up_in[];

layout(location = 0) out vec4 v0_out[];
layout(location = 1) out vec4 v1_out[];
layout(location = 2) out vec4 v2_out[];
layout(location = 3) out vec4 up_out[];

void main() {
	// Don't move the origin location of the patch
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

	// TODO: Write any shader outputs
    v0_out[gl_InvocationID] = v0_in[gl_InvocationID];
    v1_out[gl_InvocationID] = v1_in[gl_InvocationID];
    v2_out[gl_InvocationID] = v2_in[gl_InvocationID];
    up_out[gl_InvocationID] = up_in[gl_InvocationID];

	// TODO: Set level of tesselation
    gl_TessLevelInner[0] = TESSELATION_LEVEL;
    gl_TessLevelInner[1] = TESSELATION_LEVEL;
    gl_TessLevelOuter[0] = TESSELATION_LEVEL;
    gl_TessLevelOuter[1] = TESSELATION_LEVEL;
    gl_TessLevelOuter[2] = TESSELATION_LEVEL;
    gl_TessLevelOuter[3] = TESSELATION_LEVEL;
}

shader_type canvas_item;

uniform sampler2D mask_texture;
uniform vec2 mask_position = vec2(0,0);
uniform float mask_scale = 1.0;

void fragment() {
	float mask_alpha = texture(mask_texture, (UV + mask_position) * mask_scale).a;
	COLOR.a *= mask_alpha;
}

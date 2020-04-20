/// @description  Shade
if (index != 0) {
	var previous_shader = shader_current();
	shader_set(shader);
	texture_set_stage(sampled_id, texture);
	shader_set_uniform_f(u_coords, coords[0], coords[1], coords[2], coords[3]);
	shader_set_uniform_f(u_size, size[0], size[1]);
	shader_set_uniform_f(u_index, index);
	shader_set_uniform_f(u_tolerance, tolerance);
	with (GlowingSpheresLaserSphere) {
		draw_self();
	}
	with (GlowingSpheresLargeSphere) {
		draw_self();
	}
	with (GlowingSpheresWallBumper) {
		if (timer > 0) {
			draw_self();
		}
	}
	shader_reset();
	if (previous_shader != -1) {
	    shader_set(previous_shader);
	}
}
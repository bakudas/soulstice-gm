/// @description Movement logic
// Get the input
var x_input = (keyboard_check(vk_right) - keyboard_check(vk_left)) * acceleration_;

// Vector variables
var vector2_x = 0;
var vector2_y = 1;

// Horizontal movement
velocity_[vector2_x] = clamp(velocity_[vector2_x]+x_input, -max_velocity_[vector2_x], max_velocity_[vector2_x]);

// Friction
if x_input == 0 {
	velocity_[vector2_x] = lerp(velocity_[vector2_x], 0, .3);
}

// Gravity
velocity_[vector2_y] += gravity_;

// Move and contact tiles
move_and_contact_tiles(collision_tile_map_id_, 16, velocity_);

// Jumping
var on_ground = tile_collide_at_points(collision_tile_map_id_, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom]);
if on_ground {
	// Jumping
	if keyboard_check_pressed(vk_up) {
		velocity_[vector2_y] = -jump_speed_;
		image_index = spr_kal_jump;
	}
} else {
	// Control jump height
	if keyboard_check_released(vk_up) && velocity_[vector2_y] <= -(jump_speed_/3) {
		velocity_[vector2_y] = -(jump_speed_/3);
	}
}

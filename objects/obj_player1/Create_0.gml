/// @description Movement variables
velocity_ = [0, 0];
gravity_ = 0.9;
jump_speed_ = 10;
max_velocity_ = [2, 6];
acceleration_ = 1.1;

// Get the tilemap id
var layer_id = layer_get_id("CollisionTiles");
collision_tile_map_id_ = layer_tilemap_get_id(layer_id);
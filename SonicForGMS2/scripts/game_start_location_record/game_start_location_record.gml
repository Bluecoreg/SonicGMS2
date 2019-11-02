/// @description  game_start_location_record(ox, oy, [epoch], [location])
/// @param ox
/// @param  oy
/// @param  [epoch]
/// @param  [location]
/**
 * @description Creates a custom spawn point for the player instance (or overrites an existing one)
 * @argument {real} ox spawn x-position
 * @argument {real} oy spawn y-position
 * @argument {real} epoch (Optional) spawn zone time in frames
 * @argument {real} location (Optional) room index to spawn into
 */

var epoch = game_clock_get_step();
var location = room;
switch (argument_count) {
case 4: location = argument[3];
case 3: epoch = argument[2];
default:
    var oy = argument[1];
    var ox = argument[0];
}

instance_destroy(PlayerEntrance);
with (instance_create(ox, oy, PlayerEntrance)) {
    self.location = location;
    self.epoch = epoch;
}

/// @description  game_pc_lower_collision_solid(character, radius)
/// @param character
/// @param  radius
// ---------------------------------------------------------------
/*  
**  Finds the first solid intersecting the lower half of the
**  player's virtual mask.
**
**  Arguments:
**      character   Real; character instance index
**      radius      Real; distance in pixels to extend the mask
**                  (downward)
**
**  Returns:
**      Real; index of whichever instance was found, or noone
*/
// ---------------------------------------------------------------
var character = argument0;
var radius = argument1;
// ---------------------------------------------------------------

var result = noone;

with (character) {
    var total = ds_list_size(local_solids);
    var ind;
    for (var n = 0; n < total; ++n) {
        ind = local_solids[| n];
        if (instance_exists(ind)) {
            if (ind.top_solid and game_pc_lower_in_shape(self, ind, radius)) {
                result = ind;
                break;
            }
        }
    }
}

return result;

/// @description  game_player_set_lives(player, amount)
/// @param player
/// @param  amount

var player = argument0;
var amount = argument1;

with (player) {
    var count = life_count;
    life_count = clamp(amount, 0, MAX_LIFE_COUNT);
    if (life_count != count) {
        with (display) {
            post_lives.label = string(other.life_count);
        }
    }
}


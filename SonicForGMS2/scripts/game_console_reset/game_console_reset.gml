/// @description Resets the game (stats, options, etc.) without closing the game program
// save the game
game_save_write_all();
game_console_show_message("GAME SAVED");

// reset stats
game_zone_check_point_clear();
with (GamePlayer) {
    game_player_set_score(self, 0);
    game_player_set_rings(self, 0);
    lives_via_rings = 0;
}

// return to title screen
room_goto(SplashScreenRoom);
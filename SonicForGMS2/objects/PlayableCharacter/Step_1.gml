/// @description Count
if (game_is_running())
{
    if (on_the_ground and control_lock_time > 0)
	{
        --control_lock_time;
    }
    if (recovery_time > 0)
	{
        --recovery_time;
    }

    if (superspeed_time > 0)
	{
        --superspeed_time;
        if (superspeed_time <= 0)
		{
            game_pc_refresh_physics(self);
        }
    }

    if (invincibility_time > 0)
	{
        --invincibility_time;
        if (invincibility_time <= 0)
		{
            instance_destroy(invincibility_effect);
            invincibility_effect = noone;
			if (not superform)
			{
	            with (shield)
				{
	                visible = true;
	            }
			}
        }
    }

    if (remaining_air_time > 0)
	{
        --remaining_air_time;
        switch (remaining_air_time)
		{
        case 1500:
        case 1200:
        case 900: // drown warning (player 1 only)
            if (owner.index == 0) 
			{
                game_pc_play_sound(self, DrownWarningSound);
            }
            break;

        case 720: // drown music (player 1 only)
            if (owner.index == 0)
			{
                drowning_music = game_audio_enqueue_music(DrowningMusic, 2);
            }
            break;

        case 0: // drown
            game_pc_perform(self, player_is_drowning);
            game_pc_play_sound(self, DrownSound);
            break;
        }
    }

    if (superform and superform_time > 0)
	{
        --superform_time;
        if (superform_time <= 0)
		{
            game_player_change_rings(owner, -1);
            if (owner.rings > 0)
			{
                superform_time = room_speed;
            }
			else
			{
                game_pc_lose_super(self);
            }
        }
    }
}
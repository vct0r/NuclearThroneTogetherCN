#define step
with (Player) if (button_pressed(index, "horn"))
	{
	if race_id != 6 && race_id <= 15 && race_id != 14 && (bskin = 0 || bskin = 1)
		{
		sound_play(asset_get_index("sndMutant" + string(race_id) + "Cnfm"))
		}
	else if race_id != 6
		{
		sound_play(snd_wrld)
		}
	}
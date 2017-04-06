#define step
with (Player) if race_id = 2 if (button_released(index, "spec"))
	{
	if skill_get(5)
	if instance_exists(CrystalShield)
	if !instance_exists(CrystalShieldDisappear)
	if position_meeting(mouse_x[index], mouse_y[index],Floor)
	if !position_meeting(mouse_x[index], mouse_y[index],Wall)
		{
		sound_play(sndCrystalTB)
		with (CrystalShield)
			{
			if other.bskin = 0
				{
				sprite_index = sprCrystTrail
				}
			if other.bskin = 1
				{
				sprite_index = sprCrystTrailB
				}
			instance_destroy()
			}
		x=mouse_x[index]
		y=mouse_y[index]
		with instance_create(x,y,CrystalShieldDisappear)
			{if other.bskin = 1
				{
				image_index = sprShieldBDisappear
				}}
		
		}
	}

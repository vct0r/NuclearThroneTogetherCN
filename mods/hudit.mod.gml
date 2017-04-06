#define init
for(var index = 0; index < maxp; index += 1)
{
	global.xpBarX[index] = 4;
	global.xpBarY[index] = 4;
	global.hpBarX[index] = 22;
	global.hpBarY[index] = 7;
	global.wepX[index] = 24;
	global.wepY[index] = 16;
	global.bwepX[index] = 68;
	global.bwepY[index] = 16;
	global.bulletX[index] = 2;
	global.bulletY[index] = 32;
	global.shellX[index] = 12;
	global.shellY[index] = 32;
	global.boltX[index] = 22;
	global.boltY[index] = 32;
	global.exploX[index] = 32;
	global.exploY[index] = 32;
	global.energyX[index] = 42;
	global.energyY[index] = 32;
	global.lowAmmoX[index] = 54;
	global.lowAmmoY[index] = 34;
	global.lowHealthX[index] = 110;
	global.lowHealthY[index] = 7;
}

#define step
with(Player)
{
	player_set_show_hud(index, index, 0);
	with(Player)
	{
		player_set_show_hud(index, other.index, 0);
	}
	
	if(button_check(index, "talk"))
	{
		reload = max(reload, 2);
		can_shoot = 0;
		clicked = 0;
		if(button_pressed(index, "fire"))
		{
			if(mouse_x[index] >= view_xview[index]+global.xpBarX[index]-4
			&& mouse_x[index] < view_yview[index]+global.xpBarX[index]+4
			&& mouse_y[index] >= view_xview[index]+global.xpBarY[index]-4
			&& mouse_y[index] < view_yview[index]+global.xpBarY[index]+4)
			{
				while(button_check(index, "fire"))
				{
					global.xpBarX[index] = mouse_x[index]-view_xview[index];
					global.xpBarY[index] = mouse_y[index]-view_yview[index];
					wait(1);
				}
			}
			else if(mouse_x[index] >= view_xview[index]+global.hpBarX[index]-4
			&& mouse_x[index] < view_yview[index]+global.hpBarX[index]+4
			&& mouse_y[index] >= view_xview[index]+global.hpBarY[index]-4
			&& mouse_y[index] < view_yview[index]+global.hpBarY[index]+4)
			{
				while(button_check(index, "fire"))
				{
					global.hpBarX[index] = mouse_x[index]-view_xview[index];
					global.hpBarY[index] = mouse_y[index]-view_yview[index];
					wait(1);
				}
			}
			else if(mouse_x[index] >= view_xview[index]+global.wepX[index]-4
			&& mouse_x[index] < view_yview[index]+global.wepX[index]+4
			&& mouse_y[index] >= view_xview[index]+global.wepY[index]-4
			&& mouse_y[index] < view_yview[index]+global.wepY[index]+4)
			{
				while(button_check(index, "fire"))
				{
					global.wepX[index] = mouse_x[index]-view_xview[index];
					global.wepY[index] = mouse_y[index]-view_yview[index];
					wait(1);
				}
			}
			else if(mouse_x[index] >= view_xview[index]+global.bwepX[index]-4
			&& mouse_x[index] < view_yview[index]+global.bwepX[index]+4
			&& mouse_y[index] >= view_xview[index]+global.bwepY[index]-4
			&& mouse_y[index] < view_yview[index]+global.bwepY[index]+4)
			{
				while(button_check(index, "fire"))
				{
					global.bwepX[index] = mouse_x[index]-view_xview[index];
					global.bwepY[index] = mouse_y[index]-view_yview[index];
					wait(1);
				}
			}
			else if(mouse_x[index] >= view_xview[index]+global.bulletX[index]-4
			&& mouse_x[index] < view_yview[index]+global.bulletX[index]+4
			&& mouse_y[index] >= view_xview[index]+global.bulletY[index]-4
			&& mouse_y[index] < view_yview[index]+global.bulletY[index]+4)
			{
				while(button_check(index, "fire"))
				{
					global.bulletX[index] = mouse_x[index]-view_xview[index];
					global.bulletY[index] = mouse_y[index]-view_yview[index];
					wait(1);
				}
			}
			else if(mouse_x[index] >= view_xview[index]+global.shellX[index]-4
			&& mouse_x[index] < view_yview[index]+global.shellX[index]+4
			&& mouse_y[index] >= view_xview[index]+global.shellY[index]-4
			&& mouse_y[index] < view_yview[index]+global.shellY[index]+4)
			{
				while(button_check(index, "fire"))
				{
					global.shellX[index] = mouse_x[index]-view_xview[index];
					global.shellY[index] = mouse_y[index]-view_yview[index];
					wait(1);
				}
			}
			else if(mouse_x[index] >= view_xview[index]+global.boltX[index]-4
			&& mouse_x[index] < view_yview[index]+global.boltX[index]+4
			&& mouse_y[index] >= view_xview[index]+global.boltY[index]-4
			&& mouse_y[index] < view_yview[index]+global.boltY[index]+4)
			{
				while(button_check(index, "fire"))
				{
					global.boltX[index] = mouse_x[index]-view_xview[index];
					global.boltY[index] = mouse_y[index]-view_yview[index];
					wait(1);
				}
			}
			else if(mouse_x[index] >= view_xview[index]+global.exploX[index]-4
			&& mouse_x[index] < view_yview[index]+global.exploX[index]+4
			&& mouse_y[index] >= view_xview[index]+global.exploY[index]-4
			&& mouse_y[index] < view_yview[index]+global.exploY[index]+4)
			{
				while(button_check(index, "fire"))
				{
					global.exploX[index] = mouse_x[index]-view_xview[index];
					global.exploY[index] = mouse_y[index]-view_yview[index];
					wait(1);
				}
			}
			else if(mouse_x[index] >= view_xview[index]+global.energyX[index]-4
			&& mouse_x[index] < view_yview[index]+global.energyX[index]+4
			&& mouse_y[index] >= view_xview[index]+global.energyY[index]-4
			&& mouse_y[index] < view_yview[index]+global.energyY[index]+4)
			{
				while(button_check(index, "fire"))
				{
					global.energyX[index] = mouse_x[index]-view_xview[index];
					global.energyY[index] = mouse_y[index]-view_yview[index];
					wait(1);
				}
			}
			else if(mouse_x[index] >= view_xview[index]+global.lowAmmoX[index]-4
			&& mouse_x[index] < view_yview[index]+global.lowAmmoX[index]+4
			&& mouse_y[index] >= view_xview[index]+global.lowAmmoY[index]-4
			&& mouse_y[index] < view_yview[index]+global.lowAmmoY[index]+4)
			{
				while(button_check(index, "fire"))
				{
					global.lowAmmoX[index] = mouse_x[index]-view_xview[index];
					global.lowAmmoY[index] = mouse_y[index]-view_yview[index];
					wait(1);
				}
			}
			else if(mouse_x[index] >= view_xview[index]+global.lowHealthX[index]-4
			&& mouse_x[index] < view_yview[index]+global.lowHealthX[index]+4
			&& mouse_y[index] >= view_xview[index]+global.lowHealthY[index]-4
			&& mouse_y[index] < view_yview[index]+global.lowHealthY[index]+4)
			{
				while(button_check(index, "fire"))
				{
					global.lowHealthX[index] = mouse_x[index]-view_xview[index];
					global.lowHealthY[index] = mouse_y[index]-view_yview[index];
					wait(1);
				}
			}
		}
	}
}

#define draw_gui
with(Player)
{
	// set clientside
	with(Player)
	{
		draw_set_visible(index, 0);
	}
	draw_set_visible(index, 1);
	
	// xp bar
	draw_sprite(sprExpBar, 0, 0+global.xpBarX[index], 0+global.xpBarY[index]);

	// hp bar
	draw_sprite(sprHealthBar, 2, 0+global.hpBarX[index]-2, 0+global.hpBarY[index]-3);

	if(maxhealth > 0)
	{
		//draw_sprite_ext(sprHealthFill, 2, 0+global.hpBarX[index], 0+global.hpBarY[index], max(0, 84*(lsthealth/maxhealth)), 1, 0, c_white, 1);
		//draw_sprite_ext(sprHealthFill, 1, 0+global.hpBarX[index], 0+global.hpBarY[index], max(0, 84*(my_health/maxhealth)), 1, 0, c_white, 1);
		
		draw_set_color(merge_color(player_get_color(index), c_black, 0.5));
		draw_rectangle(0+global.hpBarX[index], 0+global.hpBarY[index], 0+global.hpBarX[index]+max(0, 84*(lsthealth/maxhealth))-1, 0+global.hpBarY[index]+7, 0);
		draw_set_color(player_get_color(index));
		draw_rectangle(0+global.hpBarX[index], 0+global.hpBarY[index], 0+global.hpBarX[index]+max(0, 84*(my_health/maxhealth))-1, 0+global.hpBarY[index]+7, 0);
		draw_set_color(c_white);
		
		if(((sprite_index == spr_hurt
		  && image_index < 1
		  && !instance_exists(Portal))
		 || lsthealth < my_health)
		&& !instance_exists(GenCont) 
		&& !instance_exists(LevCont))
		{
			draw_sprite_ext(sprHealthFill, 0, 0+global.hpBarX[index], 0+global.hpBarY[index], max(0, 84*(my_health/maxhealth)), 1, 0, c_white, 1);
		}
	}
	
	// hp text
	draw_set_halign(fa_center);
	if((!((sprite_index == spr_hurt
		&& image_index < 1 
		&& !instance_exists(Portal))
	   || lsthealth < my_health)
	|| sin(wave) > 0)
	|| instance_exists(GenCont)
	|| instance_exists(LevCont))
	{
		draw_set_color(c_black);
		draw_text(0+global.hpBarX[index]+1+44, 0+global.hpBarY[index]+1, string(round(my_health))+"/"+string(maxhealth));
		draw_text(0+global.hpBarX[index]+1+45, 0+global.hpBarY[index]+1, string(round(my_health))+"/"+string(maxhealth));
		draw_text(0+global.hpBarX[index]+1+45, 0+global.hpBarY[index], string(round(my_health))+"/"+string(maxhealth));
		draw_set_color(c_white);
		draw_text(0+global.hpBarX[index]+1+44, 0+global.hpBarY[index], string(round(my_health))+"/"+string(maxhealth));
	}
	
	// bwep
	if(bwep != "")
	{
		var spr, col, wid;
		spr = weapon_get_sprt(bwep);
		wid = 16;
		if(weapon_get_type(bwep) == 0)
		{
			wid = 32;
		}
		col = c_dkgray;
		if(race == "steroids")
		{
			col = c_white;
		}
		if(col == c_white
		|| instance_exists(GenCont)
		|| instance_exists(LevCont))
		{
			draw_sprite_part_ext(spr, 1, sprite_get_xoffset(spr), sprite_get_yoffset(spr)-8, wid, 14, 0+global.bwepX[index]-1, 0+global.bwepY[index], 1, 1, col, 1);
			draw_sprite_part_ext(spr, 1, sprite_get_xoffset(spr), sprite_get_yoffset(spr)-8, wid, 14, 0+global.bwepX[index]+1, 0+global.bwepY[index], 1, 1, col, 1);
			draw_sprite_part_ext(spr, 1, sprite_get_xoffset(spr), sprite_get_yoffset(spr)-8, wid, 14, 0+global.bwepX[index], 0+global.bwepY[index]-1, 1, 1, col, 1);
			draw_sprite_part_ext(spr, 1, sprite_get_xoffset(spr), sprite_get_yoffset(spr)-8, wid, 14, 0+global.bwepX[index], 0+global.bwepY[index]+1, 1, 1, col, 1);
		}
		
		draw_sprite_part_ext(spr, 1, sprite_get_xoffset(spr), sprite_get_yoffset(spr)-8, wid, 14, 0+global.bwepX[index], 0+global.bwepY[index], 1, 1, c_black, 1);
		draw_sprite_part_ext(spr, 1, sprite_get_xoffset(spr), sprite_get_yoffset(spr)-8, max(0, wid*min(weapon_get_load(bwep), breload/weapon_get_load(bwep))), 14, 0+global.bwepX[index], 0+global.bwepY[index], 1, 1, c_white, 0.2);
		
		if(weapon_get_type(bwep) != 0)
		{
			draw_set_halign(fa_left);
			draw_set_color(c_black);
			draw_text(0+global.bwepX[index]+18, 0+global.bwepY[index]+6, string(ammo[weapon_get_type(bwep)]));
			draw_text(0+global.bwepX[index]+19, 0+global.bwepY[index]+6, string(ammo[weapon_get_type(bwep)]));
			draw_text(0+global.bwepX[index]+19, 0+global.bwepY[index]+5, string(ammo[weapon_get_type(bwep)]));
			if(race == "steroids"
			|| weapon_get_type(wep) == weapon_get_type(bwep))
			{
				draw_set_color(c_white);
			}
			else
			{
				draw_set_color(c_silver);
			}
			if(ammo[weapon_get_type(bwep)] <= typ_ammo[weapon_get_type(bwep)])
			{
				if(race == "steroids"
				|| weapon_get_type(wep) == weapon_get_type(bwep))
					draw_set_color(c_red);
				else
					draw_set_color(c_gray);
			}
			if(ammo[weapon_get_type(bwep)] == 0)
			{
				draw_set_color(c_dkgray);
			}
			draw_text(0+global.bwepX[index]+18, 0+global.bwepY[index]+5, string(ammo[weapon_get_type(bwep)]));
		}
	}
	
	
	// wep
	var spr, wid;
	spr = weapon_get_sprite(wep)
	wid = 16
	if weapon_get_type(wep) = 0
	wid = 32
	if(wep != "")
	{
		draw_sprite_part_ext(spr, 1, sprite_get_xoffset(spr), sprite_get_yoffset(spr)-8, wid, 14, 0+global.wepX[index]+1, 0+global.wepY[index], 1, 1, c_white, 1);
		draw_sprite_part_ext(spr, 1, sprite_get_xoffset(spr), sprite_get_yoffset(spr)-8, wid, 14, 0+global.wepX[index]-1, 0+global.wepY[index], 1, 1, c_white, 1);
		draw_sprite_part_ext(spr, 1, sprite_get_xoffset(spr), sprite_get_yoffset(spr)-8, wid, 14, 0+global.wepX[index], 0+global.wepY[index]+1 , 1, 1, c_white, 1);
		draw_sprite_part_ext(spr, 1, sprite_get_xoffset(spr), sprite_get_yoffset(spr)-8, wid, 14, 0+global.wepX[index], 0+global.wepY[index]-1 , 1, 1, c_white, 1);
		
		draw_sprite_part_ext(spr, 1, sprite_get_xoffset(spr), sprite_get_yoffset(spr)-8, wid, 14, 0+global.wepX[index], 0+global.wepY[index], 1, 1, c_black, 1);
		draw_sprite_part_ext(spr, 1, sprite_get_xoffset(spr), sprite_get_yoffset(spr)-8, max(0, wid*min(weapon_get_load(wep), reload/weapon_get_load(wep))), 14, 0+global.wepX[index], 0+global.wepY[index], 1, 1, c_white, 0.2);
	}
	
	if(weapon_get_type(wep) != 0)
	{
		draw_set_halign(fa_left);
		draw_set_color(c_black);
		draw_text(0+global.wepX[index]+18, 0+global.wepY[index]+6, string(ammo[weapon_get_type(wep)]));
		draw_text(0+global.wepX[index]+19, 0+global.wepY[index]+5, string(ammo[weapon_get_type(wep)]));
		draw_text(0+global.wepX[index]+19, 0+global.wepY[index]+6, string(ammo[weapon_get_type(wep)]));
		
		draw_set_color(c_white);
		if(ammo[weapon_get_type(wep)] <= typ_ammo[weapon_get_type(wep)])
		{
			draw_set_color(c_red);
		}
		if(ammo[weapon_get_type(wep)] == 0)
		{
			draw_set_color(c_dkgray);
		}
		draw_text(0+global.wepX[index]+18, 0+global.wepY[index]+5, string(ammo[weapon_get_type(wep)]));
	}
	
	// xp bar
	draw_set_halign(fa_center);
	if(GameCont.skillpoints > 0)
	{
		draw_sprite(sprExpBarLevel, 0, 0+global.xpBarX[index], 0+global.xpBarY[index]);
	}
	draw_sprite(sprExpBar, (GameCont.rad/(60*GameCont.level))*16, 0+global.xpBarX[index], 0+global.xpBarY[index]);
	if(GameCont.level == 10)
	{
		draw_set_color(c_white);
		draw_sprite(sprUltraLevel, 0, 0+global.xpBarX[index]+7, 0+global.xpBarY[index]+12);
	}
	else
	{
		draw_set_color(c_black);
		draw_text(0+global.xpBarX[index]+7, 0+global.xpBarY[index]+13-string_height("A")/2, string(GameCont.level));
		draw_text(0+global.xpBarX[index]+8, 0+global.xpBarY[index]+13-string_height("A")/2, string(GameCont.level));
		draw_text(0+global.xpBarX[index]+8, 0+global.xpBarY[index]+12-string_height("A")/2, string(GameCont.level));
		draw_set_color(c_white);
		draw_text(0+global.xpBarX[index]+7, 0+global.xpBarY[index]+12-string_height("A")/2, string(GameCont.level));
	}
	
	// ammo icons
	var img = 0;
	if(weapon_get_type(bwep) == 1)
	{
		img = 1;
	}
	if(weapon_get_type(wep) == 1
	|| (race == "steroids" && weapon_get_type(bwep) == 1))
	{
		img = 2;
	}
	draw_sprite(sprBulletIconBG, img, 0+global.bulletX[index], 0+global.bulletY[index]);
	draw_sprite(sprBulletIcon, 7-ceil((ammo[1]/typ_amax[1])*7), 0+global.bulletX[index], 0+global.bulletY[index]);
	
	var img = 0;
	if(weapon_get_type(bwep) == 2)
	{
		img = 1;
	}
	if(weapon_get_type(wep) == 2
	|| (race == "steroids" && weapon_get_type(bwep) == 2))
	{
		img = 2;
	}
	draw_sprite(sprShotIconBG, img, 0+global.shellX[index], 0+global.shellY[index]);
	draw_sprite(sprShotIcon, 7-ceil((ammo[2]/typ_amax[2])*7), 0+global.shellX[index], 0+global.shellY[index]);
	
	var img = 0;
	if(weapon_get_type(bwep) == 3)
	{
		img = 1;
	}
	if(weapon_get_type(wep) == 3
	|| (race == "steroids" && weapon_get_type(bwep) == 3))
	{
		img = 2;
	}
	draw_sprite(sprBoltIconBG, img, 0+global.boltX[index], 0+global.boltY[index]);
	draw_sprite(sprBoltIcon, 7-ceil((ammo[3]/typ_amax[3])*7), 0+global.boltX[index], 0+global.boltY[index]);
	
	var img = 0;
	if(weapon_get_type(bwep) == 4)
	{
		img = 1;
	}
	if(weapon_get_type(wep) == 4
	|| (race == "steroids" && weapon_get_type(bwep) == 4))
	{
		img = 2;
	}
	draw_sprite(sprExploIconBG, img, 0+global.exploX[index], 0+global.exploY[index]);
	draw_sprite(sprExploIcon, 7-ceil((ammo[4]/typ_amax[4])*7), 0+global.exploX[index], 0+global.exploY[index]);
	
	var img = 0;
	if(weapon_get_type(bwep) == 5)
	{
		img = 1;
	}
	if(weapon_get_type(wep) == 5
	|| (race == "steroids" && weapon_get_type(bwep) == 5))
	{
		img = 2;
	}
	draw_sprite(sprEnergyIconBG, img, 0+global.energyX[index], 0+global.energyY[index]);
	draw_sprite(sprEnergyIcon, 7-ceil((ammo[5]/typ_amax[5])*7), 0+global.energyX[index], 0+global.energyY[index]);
	
	// low ammo warning
	
	if(ammo[weapon_get_type(wep)] <= typ_ammo[weapon_get_type(wep)]
	&& sin(wave) > 0
	&& drawempty > 0)
	{
		if(drawempty == 10
		&& ammo[weapon_get_type(wep)] > typ_ammo[weapon_get_type(wep)]-weapon_get_cost(wep))
		{
			sound_play(snd_lowa);
		}
		drawempty -= 1;
		
		var txt = "LOW "+string(typ_name[weapon_get_type(wep)]);
		if(ammo[weapon_get_type(wep)] < weapon_get_cost(wep))
		{
			if(ammo[weapon_get_type(wep)] > 0)
			{
				txt = "NOT ENOUGH "+string(typ_name[weapon_get_type(wep)]);
			}
			else
			{
				txt = "EMPTY[index]";
			}
		}
		draw_set_halign(fa_left);
		draw_set_color(c_black);
		draw_text(0+global.lowAmmoX[index]+1, 0+global.lowAmmoY[index], string(txt));
		draw_text(0+global.lowAmmoX[index]+1, 0+global.lowAmmoY[index]+1, string(txt));
		draw_text(0+global.lowAmmoX[index], 0+global.lowAmmoY[index]+1, string(txt));
		draw_set_color(c_red);
		draw_text(0+global.lowAmmoX[index], 0+global.lowAmmoY[index], string(txt));
	}
	
	
	// low hp warning
	
	if(my_health <= 4
	&& my_health != maxhealth
	&& sin(wave) > 0
	&& drawlowhp > 0)
	{
		drawlowhp -= 1;
		draw_set_halign(fa_left);
		draw_set_color(c_black);
		draw_text(0+global.lowHealthX[index]+1, 0+global.lowHealthY[index], "LOW HP");
		draw_text(0+global.lowHealthX[index]+1, 0+global.lowHealthY[index]+1, "LOW HP");
		draw_text(0+global.lowHealthX[index], 0+global.lowHealthY[index]+1, "LOW HP");
		draw_set_color(c_red);
		draw_text(0+global.lowHealthX[index], 0+global.lowHealthY[index], "LOW HP");
	}
	
	// show editable fields
	if(button_check(index, "talk"))
	{
		var ex = global.xpBarX[index], ey = global.xpBarY[index];
		draw_set_color(merge_color(c_lime, c_black, 0.5));
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 0);
		draw_set_color(c_lime);
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 1);
		
		var ex = global.hpBarX[index], ey = global.hpBarY[index];
		draw_set_color(merge_color(player_get_color(index), c_black, 0.5));
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 0);
		draw_set_color(player_get_color(index));
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 1);
		
		var ex = global.wepX[index], ey = global.wepY[index];
		draw_set_color(merge_color(c_white, c_black, 0.5));
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 0);
		draw_set_color(c_black);
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 1);
		
		var ex = global.bwepX[index], ey = global.bwepY[index];
		draw_set_color(merge_color(c_white, c_black, 0.5));
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 0);
		draw_set_color(c_black);
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 1);
		
		var ex = global.bulletX[index], ey = global.bulletY[index];
		draw_set_color(merge_color(c_orange, c_black, 0.5));
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 0);
		draw_set_color(c_orange);
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 1);
		
		var ex = global.shellX[index], ey = global.shellY[index];
		draw_set_color(merge_color(c_orange, c_black, 0.5));
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 0);
		draw_set_color(c_orange);
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 1);
		
		var ex = global.boltX[index], ey = global.boltY[index];
		draw_set_color(merge_color(c_orange, c_black, 0.5));
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 0);
		draw_set_color(c_orange);
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 1);
		
		var ex = global.exploX[index], ey = global.exploY[index];
		draw_set_color(merge_color(c_orange, c_black, 0.5));
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 0);
		draw_set_color(c_orange);
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 1);
		
		var ex = global.energyX[index], ey = global.energyY[index];
		draw_set_color(merge_color(c_orange, c_black, 0.5));
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 0);
		draw_set_color(c_orange);
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 1);
		
		var ex = global.energyX[index], ey = global.energyY[index];
		draw_set_color(merge_color(c_orange, c_black, 0.5));
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 0);
		draw_set_color(c_orange);
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 1);
		
		var ex = global.lowAmmoX[index], ey = global.lowAmmoY[index];
		draw_set_halign(fa_left);
		draw_set_color(merge_color(c_red, c_black, 0.5));
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 0);
		draw_set_color(c_red);
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 1);
		draw_text(0+ex, 0+ey, "LOW AMMO");
		
		var ex = global.lowHealthX[index], ey = global.lowHealthY[index];
		draw_set_color(merge_color(c_red, c_black, 0.5));
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 0);
		draw_set_color(c_red);
		draw_rectangle(0+ex-4, 0+ey-4, 0+ex+4, 0+ey+4, 1);
		draw_text(0+ex, 0+ey, "LOW HP");
	}
	
	// reset clientside
	with(Player)
	{
		draw_set_visible(index, 1);
	}
}

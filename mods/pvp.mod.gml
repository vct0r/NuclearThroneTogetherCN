// /loadmod mods/pvp.mod.gml

#define init
global.sprShield = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAIAAAAAgCAYAAADaInAlAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAMHSURBVHhe7ZnLkdwwDEQnCGeyGWz+OWkHsgA1wRaHxBDURa/qVVlAE/x4TvZr27Yhf/79bi19frZsT9TnE/wEWzPTT7A1l9Kilz10j35OVDezicvSeQGjsFkRDbwf08FmFdKierEBzaqRNVe6GQrNgjtuLcv1yGA5lMFyPe6M3MVlFZoVaVHEQccwmrty1nqA5hruRPd/62GZlh6WaWlnj5zfrRVojhbdYprpNTIL8gLNDBi5C8L6IyKsz4ycmQpzhKpfFXTBjM3VkZmQE2gm4MidENaPiLA+OnLWLmGeUPSKDw3O3FztmQ19gWa+sOduCOt/I8L6Ys8ZQ8JcwepVIGNztbUH1IWiN9HWHRHfmyVS9RpnmyLMF/Yaa1otw6t9/MESvbqn4uuzVar6qvc/2L+tqGojS7YXfAvVmsmyuyKYzRCxGjlTirCPUP4A5M8r9PvhgRbp76tgJlPFvle//8HzA9DvA8xkqtj36vc/eC3/y1d1XzzMYnFvgWUyNe56f+H5AZywTKbGXe8vPD+AE5bJ1Ljr/YXnB3DCMpkad72/8PwATlgmU+Ou9xeeH8AJy2Rq3PX+wvMDOGGZTI273l94fgAnLJOpcdf7C/ax8hB+Pz3MmyqbpL+vgplMFfte/f4Hz78E6vcBZjJV7Hv1+x88/xmkNQCzGSJWI2dKEfYR/v8AxBsOUNUPinqCV/dUfH22SlVf9f4H+3fRULU229YeUBeK3kRbd0R8b5ZI1WucbYowX9hrNJBxiJ7Z0Bdo5gt77oaw/jcirC/2nDEkzBWsXoREDc48xMhMyAk0E3DkTgjrR0RYHx05a5cwTyh6xYeqC2YcIjIL8gLNDBi5C8L6IyKsz4ycmQpzhKpfFVRdCANo7spZ6wGaa7gT3f+th2VaelimpZ09cn63VqA5WlRxCAyjWTWy5ko3Q6FZcMetZbkeGSyHMliux52Ru7isQrMiLXpx6Ih+TlQ3s4nL0nkBo7BZEQ28H9PBZhXSYku2Kerzs2V7oj6f4CfYmpl+gq25cHv9Ac3D2VMUb7cRAAAAAElFTkSuQmCC",
4, 16, 16);
trace("'/revmode soft' is recommended for this mod.");
global.DEBUG = 0;

global.sprCrownTopScore = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAkAAAAGCAYAAAARx7TFAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAtSURBVBhXYwCC/zAMBCACjJHFwZz/N1AE4BhJHMKBCSDTWBVhw6Qpwo8Z/gMAdLViaJoK6qkAAAAASUVORK5CYIIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",
1, 9, 3);

global.roundOver = 0;
global.gce = 0;
global.points = [];
global.time = [];
for(var i = 0; i < maxp; i += 1)
{
	global.points[i] = 0;
	global.time[i] = 0;
}

// remove useless mutations
for(var i = 0; i < 128; i += 1)
{
	switch(string_lower(skill_get_name(i)))
	{
		case "bloodlust": 			{ skill_set_active(i, 0); break; }
		case "bolt marrow": 		{ skill_set_active(i, 0); break; }
		case "euphoria": 			{ skill_set_active(i, 0); break; }
		case "gamma guts": 			{ skill_set_active(i, 0); break; }
		case "heavy heart": 		{ skill_set_active(i, 0); break; }
		case "lucky shot": 			{ skill_set_active(i, 0); break; }
		case "open mind": 			{ skill_set_active(i, 0); break; }
		case "plutonium hunger": 	{ skill_set_active(i, 0); break; }
		case "rabbit paw": 			{ skill_set_active(i, 0); break; }
		case "scarier face": 		{ skill_set_active(i, 0); break; }
		case "second stomach": 		{ skill_set_active(i, 0); break; }
		case "sharp teeth": 		{ skill_set_active(i, 0); break; }
		case "trigger fingers": 	{ skill_set_active(i, 0); break; }
	}
}

// set unbanned weapons
for(var i = 0; i < 128; i += 1)
{
	global.weapon_area[i] = weapon_get_area(weapon_get_name(i));
	
	if(weapon_get_name(i) == "REVOLVER"
	|| weapon_get_name(i) == "GOLDEN REVOLVER"
	|| weapon_get_name(i) == "CHICKEN SWORD"
	|| weapon_get_name(i) == "RUSTY REVOLVER"
	|| weapon_get_name(i) == "ROGUE RIFLE"
	|| weapon_get_name(i) == "DOG SPIN ATTACK"
	|| weapon_get_name(i) == "DOG MISSILE"
	|| weapon_get_name(i) == "GOLDEN FROG PISTOL")
	{
		global.weapon_area[i] = -2;
	}
}

global.bosses = 0;
global.enemies = 0;
global.idpd = 0;
global.showMutations = 0;
global.showWeapons = 0;
global.text = 1;

#define chat_command
switch(argument0)
{
	case "pvp_mutation_ban":
	{
		if(argument1 == "all")
		{
			for(var i = 1; i < 300; i += 1)
			{
				skill_set_active(i, 0);
			}
			trace("Banned all mutations.");
		}
		else
		{
			for(var i = 1; i < 300; i += 1)
			{
				if(skill_get_name(i) == string_upper(argument1))
				{
					trace("Banned '" + string_upper(argument1) + "' from the mutation pool.");
					skill_set_active(i, 0);
					return 1;
				}
			}
			trace("Unknown mutation '" + string_upper(argument1) + "'.");
		}
		return 0;
	}
	case "pvp_mutation_unban":
	{
		if(argument1 == "all")
		{
			for(var i = 1; i < 300; i += 1)
			{
				skill_set_active(i, 1);
			}
			trace("Unbanned all mutations.");
		}
		else
		{
			for(var i = 1; i < 300; i += 1)
			{
				if(skill_get_name(i) == string_upper(argument1))
				{
					trace("Banned '" + string_upper(argument1) + "' from the mutation pool.");
					skill_set_active(i, 1);
					return 1;
				}
			}
			trace("Unknown mutation '" + string_upper(argument1) + "'.");
		}
		return 0;
	}
	case "pvp_weapon_ban":
	{
		if(argument1 == "all")
		{
			for(var i = 1; i < 128; i += 1)
			{
				weapon_set_area(i, -1);
			}
			trace("Banned all weapons.");
			return 1;
		}
		else
		{
			for(var i = 1; i < 128; i += 1)
			{
				if(weapon_get_name(i) == string_upper(argument1))
				{
					if(global.weapon_area[i] == -2)
					{
						trace("'" + string_upper(argument1) + "' cannot be banned.");
					}
					else
					{
						trace("Banned '" + string_upper(argument1) + "' from the weapon pool.");
						weapon_set_area(i, -1);
					}
					return 1;
				}
			}
			trace("Unknown weapon '" + string_upper(argument1) + "'.");
		}
		return 0;
	}
	case "pvp_weapon_unban":
	{
		if(argument1 == "all")
		{
			for(var i = 1; i < 300; i += 1)
			{
				//weapon_set_area(i, 0);
				weapon_set_area(i, global.weapon_area[i]);
			}
			trace("Unbanned all weapons.");
			return 1;
		}
		else
		{
			for(var i = 1; i < 128; i += 1)
			{
				if(weapon_get_name(i) == string_upper(argument1))
				{
					if(global.weapon_area[i] == -2)
					{
						trace("'" + string_upper(argument1) + "' cannot be unbanned.");
					}
					else
					{
						trace("Unbanned '" + string_upper(argument1) + "' from the weapon pool.");
						//weapon_set_area(i, 0);
						weapon_set_area(i, global.weapon_area[i]);
					}
					return 1;
				}
			}
			trace("Unknown weapon '" + string_upper(argument1) + "'.");
		}
		return 0;
	}
	case "pvp_race_ban":
	{
		if(argument1 == "all")
		{
			for(var i = 1; i < 300; i += 1)
			{
				race_set_active(i, 0);
			}
			trace("Banned all characters.");
			return 1;
		}
		else
		{
			trace("Banned '" + string_upper(argument1) + "' from the race pool.");
			race_set_active(race_get_id(string_lower(argument1)), 0);
		}
		return 1;
	}
	case "pvp_race_unban":
	{
		if(argument1 == "all")
		{
			for(var i = 1; i < 300; i += 1)
			{
				race_set_active(i, 1);
			}
			trace("Unbanned all characters.");
			return 1;
		}
		else
		{
			trace("Unbanned '" + string_upper(argument1) + "' from the race pool.");
			race_set_active(race_get_id(string_lower(argument1)), 1);
		}
		return 1;
	}
	case "pvp_bosses":
	{
		if(global.bosses) global.bosses = 0; else global.bosses = 1;
		trace("Bosses " + (global.bosses ? "ENABLED." : "DISABLED."));
		return 1;
	}
	case "pvp_enemies":
	{
		if(global.enemies) global.enemies = 0; else global.enemies = 1;
		trace("Enemies " + (global.enemies ? "ENABLED." : "DISABLED."));
		return 1;
	}
	case "pvp_idpd":
	{
		if(global.idpd) global.idpd = 0; else global.idpd = 1;
		trace("IDPD " + (global.idpd ? "ENABLED." : "DISABLED."));
		return 1;
	}
	case "pvp_text":
	{
		if(global.text) global.text = 0; else global.text = 1;
		trace("Text rendering " + (global.text ? "ENABLED." : "DISABLED."));
		return 1;
	}
}

#define step
if(global.DEBUG)
{
	with(Player)
	{
		if(button_pressed(index, "horn"))
		{
			instance_create(mouse_x[index], mouse_y[index], BanditBoss);
		}
	}
}
if(instance_exists(GenCont))
{
	with(Player)
	{
		shield = 60;
	}
	if(GameCont.area == 1
	&& GameCont.subarea == 1
	&& GameCont.loops == 0)
	{
		for(var i = 0; i < maxp; i += 1)
		{
			global.points[i] = 0;
		}
	}
	else
	{
		if(!global.gce)
		{
			with(Player)
			{
				my_health += 2;
				maxhealth += 2;
			}
		}
	}
	if(!global.gce)
	{
		global.gce = 1;
	}
	with(WepPickup)
	{
		instance_destroy();
	}
	global.roundOver = 0;
	with(Player)
	{
		/*if(GameCont.area == 1
		&& GameCont.subarea == 1
		&& my_health == maxhealth)
		{
			
		}*/
		wep = "";
		bwep = "";
		my_health = maxhealth;
		
		with(Player)
		{
			player_set_show_cursor(other.index, index, 0);
			player_set_show_marker(other.index, index, 0);
			player_set_show_hud(other.index, index, 0);
		}
		player_set_show_cursor(index, index, 1);
		player_set_show_marker(index, index, 1);
		player_set_show_hud(index, index, 1);
		player_set_show_skills(index, 1);
	}
}
else
{
	with(Player)
	{
		if("shield" not in self) shield = 0;
		
		if(shield > 0)
		{
			my_health = maxhealth;
			shield -= 1;
		}
	}
	if(global.gce)
	{
		var windify = [AmmoChest, RogueChest, AmmoChestMystery, IDPDChest, HealthChest, WeaponChest, ProtoChest, GoldChest,
		BigWeaponChest, BigCursedChest, GiantWeaponChest, GiantAmmoChest, RadChest, RadMaggotChest, VenuzWeaponSpawn, VenuzAmmoSpawn];
		
		for(var i = 0; i < array_length_1d(windify); i += 1)
		{
			with(i)
			{
				if(object_index == i
				&& object_index != Player
				&& "candespawn" not in self)
				{
					instance_change(Wind, 0);
				}
			}
		}
		
		with(Player)
		{
			team = current_time+index;
			hasInfiniteHP = 0;
			candie = 1;
			
			if(fork())
			{
				global.time[index] = current_frame+((360/maxp)*index);
				
				while(instance_exists(self)
				&& instance_exists(Floor)
				&& instance_exists(Spiral))
				{
					var _canScan = 1;
					for(var j = 8; j < 32; j += 1)
					{
						if(_canScan)
						{
							for(var i = 0; i < 360; i += 90)
							{
								if(_canScan)
								{
									x = instance_nearest(x+lengthdir_x(10016, global.time[index]), y+lengthdir_y(10016, global.time[index]), Floor).x+8+lengthdir_x(j, i+45);
									y = instance_nearest(x+lengthdir_x(10016, global.time[index]), y+lengthdir_y(10016, global.time[index]), Floor).y+8+lengthdir_y(j, i+45);
									
									if(place_free(x, y)
									&& position_meeting(x, y, Floor))
									{
										_canScan = 0;
									}
								}
							}
						}
					}
					wait(1);
				}
				
				if(instance_exists(self))
				{
					instance_create(x, y, BigWeaponChest);
					
					if(instance_exists(self))
					{
						wait(1);
						with(ChestOpen)
						{
							instance_destroy();
						}
					}
				}
				exit;
			}
		}
		global.gce = 0;
	}
	with(enemy)
	{
		if(object_index == BanditBoss
		|| object_index == ScrapBoss
		|| object_index == LilHunter
		|| object_index == Nothing
		|| object_index == Nothing2
		|| object_index == FrogQueen
		|| object_index == HyperCrystal
		|| object_index == TechnoMancer
		|| object_index == Last)
		{
			if(!global.bosses)
			{
				instance_change(Wind, 0);
			}
		}
		else if(object_index == Van
		|| object_index == PopoFreak
		|| object_index == Grunt
		|| object_index == EliteGrunt
		|| object_index == Shielder
		|| object_index == EliteShielder
		|| object_index == Inspector
		|| object_index == EliteInspector)
		{
			if(!global.idpd)
			{
				instance_change(Wind, 0);
			}
		}
		else if(object_index != DogMissile)
		{
			if(!global.enemies)
			{
				if(random(1) < 0.1)
				{
					instance_create(x, y, AmmoChest);
				}
				instance_change(Wind, 0);
			}
		}
	}
	with(Player)
	{
		if("omaxspeed" not in self) { omaxspeed = maxspeed; }
		if("minspeed" not in self) { minspeed = maxspeed/2; }
		if("hasInfiniteHP" in self
		&& hasInfiniteHP)
		{
			my_health = maxhealth;
		}
		if(instance_exists(Portal))
		{
			candie = 0;
		}
		if(global.DEBUG
		&& index == 1)
		{
			var p = noone;
			with(Player)
			{
				if(index == 0)
				{
					p = id;
				}
			}
			if(p != noone
			&& point_distance(x, y, p.x, p.y) > 64)
			{
				/*speed = maxspeed;
				direction = point_direction(x, y, p.x, p.y);*/
				speed = maxspeed/2;
				mp_potential_step(p.x, p.y, maxspeed/2, 0);
			}
		}

		/*if(instance_exists(Portal))
		{
			var p = Portal;
			speed = maxspeed/2;
			mp_potential_step(p.x, p.y, maxspeed/2, 0);
		}*/
	}
	with(Corpse)
	{
		alarm0 = -1;
	}
	with(Revive)
	{
		if(instance_exists(self))
		{
			canrevive = 1;
			var _x = x;
			var _y = y;
			var op = p;
			
			image_alpha = 0;
			
			// if(instance_exists(Player)) view_object[p] = Player;
			
			if("revived" not in self)
			{
				revived = 0;
				with(Player)
				{
					global.points[index] += 1;
				}
				repeat(50)
				{
					with(instance_create(x, y, Rad))
					{
						speed = random(6);
						direction = random(360);
					}
				}
				
				while(instance_exists(self)
				&& instance_exists(enemy)
				&& instance_exists(Player))
				{
					x = Player.x;
					y = Player.y-32;
					wait(1);
				}
				if(instance_exists(self))
				{
					repeat(60)
					{
						if(instance_exists(self)
						&& instance_exists(Player))
						{
							x = Player.x;
							y = Player.y-320;
							wait(1);
						}
					}
					if(instance_exists(self)
					&& instance_exists(Player))
					{
						image_alpha = 1;
						instance_create(_x, _y, Portal);
						
						with(Player)
						{
							hasInfiniteHP = 1;
							other.x = x;
							other.y = y;
						}
					}
					while(instance_exists(self)) wait(1);
					with(Player)
					{
						//if(index == op)
						//view_object[index] = self;
					}
				}
			}
		}
	}
	with(Player)
	{
		if("omaxspeed" not in self) omaxspeed = maxspeed;
		maxspeed = omaxspeed;
	}
	with(Tangle)
	{
		with(Player)
		{
			if(other.p != index)
			{
				if(distance_to_object(other) <= 0)
				{
					maxspeed = minspeed;
				}
			}
		}
	}
}

#define draw
with(Player)
{
	if("shield" in self
	&& shield > 0)
	{
		var c = max(1, instance_number(Spiral)/4)/(shield/30);
		draw_sprite_ext(global.sprShield, current_frame*0.4, x, y, 1/c, 1/c, 0, c_white, 1);
	}
}

#define draw_gui
if(global.text)
{
	draw_set_font(fntSmall);

	// display banned things
	if(GameCont.area == 0
	&& GameCont.subarea == 0)
	{
		// mutations
		var _drawX = 32;
		var _drawY = 26;
		
		draw_set_halign(0);
		draw_text_nt(_drawX, _drawY-6, "MUTATIONS: " + (floor(current_frame/30)*30 % 20 ? "@r/pvp_mutation_ban" : "@g/pvp_mutation_unban"));
		if(global.showMutations)
		{
			draw_rectangle(_drawX, _drawY-15, _drawX+4*4+1, _drawY+7-15, 0);
			draw_text_nt(_drawX+1, _drawY-14, "HIDE");
			
			var _debugText = "";
			for(var i = 1; i < 30; i += 1)
			{
				draw_set_color(skill_get_active(i) ? merge_color(c_green, c_black, 0.75) : merge_color(c_red, c_black, 0.75));
				draw_rectangle(_drawX-1, _drawY-1+6*i-5, _drawX+32*3.25, _drawY-1+6*i, 0);
				_debugText += skill_get_name(i) + ":#";
			}
			draw_text_nt(_drawX, _drawY, _debugText);
			
			draw_set_halign(2);
			_debugText = "";
			for(var i = 1; i < 30; i += 1)
			{
				_debugText += string(skill_get_active(i) ? "@genabled" : "@rbanned") + "#";
			}
			draw_text_nt(_drawX+32*3.25, _drawY, _debugText);
		}
		else
		{
			draw_rectangle(_drawX, _drawY-15, _drawX+4*4+1, _drawY+7-15, 0);
			draw_text_nt(_drawX+1, _drawY-14, "SHOW");
		}
		for(var i = 0; i < maxp; i += 1)
		{
			if(button_pressed(i, "fire")
			&& point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],
			_drawX, _drawY-15, _drawX+4*4+1, _drawY+7-15))
			{
				if(global.showMutations) global.showMutations = 0; else global.showMutations = 1;
			}
		}
		
		// weapons
		_drawX = 32*5;
		_drawY = 26;
		
		draw_set_halign(0);
		draw_text_nt(_drawX, _drawY-6, "WEAPONS: " + (floor((current_frame+30)/30)*30 % 20 ? "@r/pvp_weapon_ban" : "@g/pvp_weapon_unban"));
		if(global.showWeapons)
		{
			draw_rectangle(_drawX, _drawY-15, _drawX+4*4+1, _drawY+7-15, 0);
			draw_text_nt(_drawX+1, _drawY-14, "HIDE");
			
			var _debugText = "";
			var _hidden = 0;
			for(var i = 1; i < 128; i += 1)
			{
				if(weapon_get_area(i) >= 0)
				{
					_hidden += 1;
				}
				else
				{
					draw_set_color(merge_color((global.weapon_area[i] == -2 ? c_gray : c_red), c_black, 0.75));
					draw_rectangle(_drawX-1, _drawY-1+6*(i-_hidden)-5, _drawX+32*3.75, _drawY-1+6*(i-_hidden), 0);
					_debugText += weapon_get_name(i) + ":#";
				}
			}
			draw_text_nt(_drawX, _drawY, _debugText);
			
			draw_set_halign(2);
			_debugText = "";
			for(var i = 1; i < 128; i += 1)
			{
				if(weapon_get_area(i) < 0)
				_debugText += (global.weapon_area[i] == -2 ? "@slocked#" : "@rbanned#");
			}
			draw_text_nt(_drawX+32*3.75, _drawY, _debugText);
		}
		else
		{
			draw_rectangle(_drawX, _drawY-15, _drawX+4*4+1, _drawY+7-15, 0);
			draw_text_nt(_drawX+1, _drawY-14, "SHOW");
		}
		for(var i = 0; i < maxp; i += 1)
		{
			if(button_pressed(i, "fire")
			&& point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],
			_drawX, _drawY-15, _drawX+4*4+1, _drawY+7-15))
			{
				if(global.showWeapons) global.showWeapons = 0; else global.showWeapons = 1;
			}
		}
		
		// characters
		_drawX = 8;
		_drawY = 32*6.5;
		
		draw_set_halign(0);
		draw_text_nt(_drawX, _drawY-6, "RACES: " + (floor((current_frame+30)/30)*30 % 20 ? "@r/pvp_race_ban" : "@g/pvp_race_unban"));
		
		// bosses
		_drawX = 320-8;
		_drawY = 32*6.5;
		
		draw_set_halign(0);
		draw_set_valign(0);
		draw_text_nt(_drawX-160, _drawY-6-6*2,
		(floor(current_frame/30)*30 % 20 ? "@r" : "@g") + "/pvp_enemies@w: TOGGLE ENEMIES#" + 
		(floor(current_frame/30)*30 % 20 ? "@r" : "@g") + "/pvp_bosses@w: TOGGLE BOSSES#" + 
		(floor(current_frame/30)*30 % 20 ? "@r" : "@g") + "/pvp_idpd@w: TOGGLE IDPD");
		draw_text_nt(_drawX-42, _drawY-6-6*2,
		(global.enemies ? "@g(ENABLED)" : "@r(DISABLED)") + "@w#" + 
		(global.bosses ? "@g(ENABLED)" : "@r(DISABLED)") + "@w#" + 
		(global.idpd ? "@g(ENABLED)" : "@r(DISABLED)"));
	}
	else
	{
		draw_set_halign(1);

		// calculate winner
		var winners = 0;
		var winner = 0;
		var highscore = 0;
		for(var i = 0; i < maxp; i += 1)
		{
			if(global.points[i] > highscore)
			{
				highscore = global.points[i];
			}
		}
		for(var i = 0; i < maxp; i += 1)
		{
			if(global.points[i] == highscore)
			{
				winners += 1;
				winner = i;
			}
		}

		with(Player)
		{
			with(Player)
			{
				draw_set_visible(index, 0);
			}
			draw_set_visible(index, 1);
			
			for(var i = 0; i < maxp; i += 1)
			{
				var dist = 8;
				
				with(Player)
				{
					var text = alias + ": " + string(global.points[index]);
					draw_text_nt(160, 240-dist+1, text);
					
					if(winners == 1
					&& winner == index)
					{
						draw_sprite(global.sprCrownTopScore, 0, 160-string_length(text)*2-2, 240-dist+4);
					}
					
					dist += 6;
				}
			}
			
			with(Player)
			{
				draw_set_visible(index, 1);
			}
		}
	}
}

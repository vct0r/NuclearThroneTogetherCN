// /loadmod mods/piledriver.mod.gml

#define init
global.sprMoon = sprite_add_base64("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",
2, 125, 200);

#define step
with(Player)
{
	if("keyCombos" not in self)
	{
		// prepare stuff
		keyCombos = "";
		en = noone;
		z = 0;
		zspeed = 0;
		zgravity = 3;
	}
	if(reload > 0)
	{
		keyCombos = "";
	}
	if(button_pressed(index, "east"))
	{
		keyCombos += "R";
	}
	if(button_pressed(index, "west"))
	{
		keyCombos += "L";
	}
	if(button_pressed(index, "nort"))
	{
		keyCombos += "U";
	}
	if(button_pressed(index, "sout"))
	{
		keyCombos += "D";
	}
	
	//trace(keyCombos);
	
	z += zspeed;
	zspeed -= zgravity;
	if(z <= 0)
	{
		z = 0;
	}
	//else trace(z);
	
	if(string_count("UDLR", keyCombos) >= 1
	|| string_count("UDRL", keyCombos) >= 1
	/*|| button_pressed(index, "horn")*/)
	{
		keyCombos = "";
		
		candie = 0;
		var msp = maxspeed;
		maxspeed /= 2;
		var r = reload;
		var br = breload;
		reload = r+30;
		if(race == "steroids")
			breload = br+30;
		canspec = 0;
		canpick = 0;
		speed = 0;
		
		var _spr_idle = spr_idle;
		var _spr_walk = spr_walk;
		var _spr_hurt = spr_hurt;
		var _spr_dead = spr_dead;
		var _snd_hurt = snd_hurt;
		spr_idle = asset_get_index(string_replace(sprite_get_name(spr_idle), "Idle", "Sit"));
		spr_walk = spr_idle;
		spr_hurt = spr_idle;
		spr_dead = spr_idle;
		snd_hurt = sndHitFlesh;
		hp = my_health;
		sound_play(sndCrystalShield);
		throneBeamBallSize = 0;
		//sound_play(asset_get_index(string_replace(sound_get_name(snd_hurt), "Hurt", "Slct")));
		
		repeat(4+irandom(1))
		{
			with(instance_create(x, y, Dust))
			{
				speed = 3+random(1);
				direction = random(360);
			}
		}
		
		repeat(30)
		{
			sprite_index = spr_idle;
			if(instance_exists(self))
			{
				var _ox = x;
				var _oy = y;
				with(NothingBeam)
				{
					//if(sign(x-other.x) <= 32)
					if(distance_to_object(other) <= 0)
					{
						other.en = self;
					}
				}
				if(en != noone)
				{
					// NOT A CHANCE!
					while(instance_exists(en))
					{
						en.image_yscale = 0.1;
						throneBeamBallSize += 0.05;
						x = _ox;
						y = _oy+throneBeamBallSize*10;
						instance_create(x+8*random_range(-1, 1), y+8, Dust);
						wait(1);
					}
					if(throneBeamBallSize > 0)
					{
						with(instance_create(x, y-8-throneBeamBallSize, PlasmaHuge))
						{
							team = other.team;
							direction = 90;
							image_angle = direction;
							image_xscale = other.throneBeamBallSize;
							image_yscale = image_xscale;
						}
						throneBeamBallSize = 0;
					}
				}
				else
				{
					with(hitme)
					{
						if(self != other
						&& distance_to_object(other) <= 0)
						{
							other.en = self;
						}
					}
					if(distance_to_object(en) <= sprite_get_width(sprite_index)/2)
					{
						visible = 0;
						zspeed = 20;
						z = 1;
						enhp = en.my_health;
						en.visible = 0;
						reload = r+15;
						if(race == "steroids")
							breload = br+15;
						
						scrZCamera(id, 2);
						
						if(fork())
						{
							// HOP
							sound_play(sndChickenThrow);
							repeat(4+irandom(1))
							{
								with(instance_create(x+lengthdir_x(4+random(4), random(360)), y+lengthdir_y(4+random(4), random(360)), Dust))
								{
									speed = 3+random(1);
									direction = point_direction(x, y, other.x, other.y);
								}
							}
							repeat(3+irandom(1))
							{
								with(instance_create(x+lengthdir_x(2, random(360)), y+lengthdir_y(2, random(360)), Dust))
								{
									speed = 2+random(4);
									direction = 90;
								}
							}
							
							// MID-AIR
							while(z > 0)
							{
								my_health = hp;
								for(var i = 0; i <= 15; i += 1)
								{
									if(("alarm" + string(i)) in en
									&& variable_instance_get(en, "alarm" + string(i)) > 1)
									{
										variable_instance_set(en, "alarm" + string(i), variable_instance_get(en, "alarm" + string(i))+1);
									}
								}
								
								if(instance_exists(self))
								{
									canwalk = 1;
									if(instance_exists(en))
									{
										speed = maxspeed;
										direction = gunangle;
										en.speed = 0;
										en.x = x+lengthdir_x(speed, gunangle+180);
										en.y = y+lengthdir_y(speed, gunangle+180);
										en.my_health = enhp;
										
										if(button_check(index, "fire")
										&& en != self
										&& en != noone)
										{
											zspeed += 16;
											sound_play(sndChickenThrow);
											repeat(4+irandom(1))
											{
												with(instance_create(x+lengthdir_x(4+random(4), random(360)), y-z+lengthdir_y(4+random(4), random(360)), Dust))
												{
													speed = 3+random(1);
													direction = point_direction(x, y, other.x, other.y);
												}
											}
											
											with(en)
											{
												z = other.z;
												var me = instance_create(x, y, CustomObject);
												me.name = "pileproj";
												me.speed = 8;
												me.visible = 0;
												me.direction = other.gunangle;
												me.z = z;
												me.zspeed = 4;
												me.sprite_index = spr_hurt;
												other.en = other;
												
												while(instance_exists(self)
												&& z > 0)
												{
													speed = 8;
													x = me.x;
													y = me.y;
													me.zspeed -= 1;
													z += me.zspeed;
													me.z = z;
													visible = 0;
													
													if(z <= 0)
													{
														scrNuke(1);
														visible = 1;
														with(me)
														{
															instance_destroy();
														}
													}
													//trace(x);
													wait(1);
												}
											}
										}
									}
									wait(1);
								}
								wait(1);
							}
							
							if(instance_exists(self))
							{
								if(en != self)
								{
									scrNuke(1);
								}
								else
								{
									en = noone;
								}
								sound_play(sndExplosionL);
								spr_idle = _spr_idle;
								spr_walk = _spr_walk;
								spr_hurt = _spr_hurt;
								spr_dead = _spr_dead;
								snd_hurt = _snd_hurt;
								
								candie = 1;
								canspec = 1;
								canpick = 1;
								maxspeed = msp;
								
								visible = 1;
							}
							
							if(instance_exists(en))
							{
								with(Wall)
								{
									if(distance_to_object(other) <= 0)
									{
										instance_create(x, y, FloorExplo);
										instance_destroy();
									}
								}
								en.visible = 1;
								en = noone;
							}
							exit;
						}
						break;
					}
					else
					{
						wait(1);
					}
					my_health = hp;
				}
			}
		}
		
		if(instance_exists(self)
		&& z <= 0)
		{	
			spr_idle = _spr_idle;
			spr_walk = _spr_walk;
			spr_hurt = _spr_hurt;
			spr_dead = _spr_dead;
			snd_hurt = _snd_hurt;
			
			candie = 1;
			canspec = 1;
			canpick = 1;
			maxspeed = msp;
		}
	}
	else if(string_count("UUDDLRLR", keyCombos) >= 1)
	{
		keyCombos = "";
		
		candie = 0;
		var msp = maxspeed;
		maxspeed /= 2;
		var r = reload;
		var br = breload;
		reload = r+30;
		if(race == "steroids")
			breload = br+30;
		canspec = 0;
		canpick = 0;
		speed = 0;
		
		var _spr_idle = spr_idle;
		var _spr_walk = spr_walk;
		var _spr_hurt = spr_hurt;
		var _spr_dead = spr_dead;
		var _snd_hurt = snd_hurt;
		spr_idle = asset_get_index(string_replace(sprite_get_name(spr_idle), "Idle", "Sit"));
		spr_walk = spr_idle;
		spr_hurt = spr_idle;
		spr_dead = spr_idle;
		snd_hurt = sndHitFlesh;
		hp = my_health;
		sound_play(sndCrystalShield);
		//sound_play(asset_get_index(string_replace(sound_get_name(snd_hurt), "Hurt", "Slct")));
		
		repeat(4+irandom(1))
		{
			with(instance_create(x, y, Dust))
			{
				speed = 3+random(1);
				direction = random(360);
			}
		}
		
		repeat(30)
		{
			sprite_index = spr_idle;
			if(instance_exists(self))
			{
				with(Corpse)
				{
					if(self != other
					&& distance_to_object(other) <= 0)
					{
						other.en = self;
					}
				}
				if(distance_to_object(en) <= sprite_get_width(sprite_index)/2)
				{
					var _zg = zgravity;
					zgravity = 0;
					z = 0.1;
					//enhp = en.my_health;
					en.visible = 0;
					visible = 0;
					var bg = background_color;
					
					wait(10);
					
					if(instance_exists(self)
					&& instance_exists(en))
					{
						zspeed = 48;
						zgravity = _zg/4;
						z = 1;
						scrZCamera(id, 0.7);
						
						if(fork())
						{
							while(zspeed > 0)
							{
								wait(1);
							}
							sound_play(snd_chst);
							exit;
						}
						if(fork())
						{
							// HOP
							sound_play(sndChickenThrow);
							sound_play(snd_crwn);
							repeat(4+irandom(1))
							{
								with(instance_create(x+lengthdir_x(4+random(4), random(360)), y+lengthdir_y(4+random(4), random(360)), Dust))
								{
									speed = 3+random(1);
									direction = point_direction(x, y, other.x, other.y);
								}
							}
							repeat(3+irandom(1))
							{
								with(instance_create(x+lengthdir_x(2, random(360)), y+lengthdir_y(2, random(360)), Dust))
								{
									speed = 2+random(4);
									direction = 90;
								}
							}
							
							// MID-AIR
							while(z > 0)
							{
								my_health = hp;
								reload += 1;
								if(race == "steroids")
									breload += 1;
								
								/*if(instance_exists(en))
								{
									for(var i = 0; i <= 15; i += 1)
									{
										if(("alarm" + string(i)) in en
										&& variable_instance_get(en, "alarm" + string(i)) > 1)
										{
											variable_instance_set(en, "alarm" + string(i), variable_instance_get(en, "alarm" + string(i))+1);
										}
									}
								}*/
								
								if(instance_exists(self))
								{
									canwalk = 1;
									if(instance_exists(en))
									{
										/*speed = maxspeed;
										direction = gunangle;
										en.speed = 0;
										en.x = x+lengthdir_x(speed, gunangle+180);
										en.y = y+lengthdir_y(speed, gunangle+180);
										en.my_health = enhp;*/
										en.x = x;
										en.y = y;
										speed = 0;
									}
									if(zspeed < 0)
									{
										for(var i = -1; i <= 1; i += 2)
										{
											for(var j = 0; j < 1; j += 0.25)
											{
												with(instance_create(x, y+16-z, CaveSparkle))
												{
													hspeed = (16*sin(other.z/100)*i)*(j+1);
													vspeed = -other.zspeed*1;
													//direction = 90+90*i;
													friction = 0.1;
													image_blend = make_color_hsv(current_frame, 255, 255);
												}
											}
										}
									}
									wait(1);
								}
								
								// SPAAAAAAAAAAAAACE
								background_color = merge_color(bg, c_black, max(0, min(1, (z-500)/250)));
								
								if(z > 500)
								{
									repeat(z/250)
									{
										if(fork())
										{
											with(instance_create(view_xview[index]+random(320), view_yview[index], GameObject))
											{
												depth = other.depth;
												sprite_index = sprSpiralStar;
												image_speed = 0;
												image_index = random(image_number);
												if(other.zspeed < 0)
												{
													y = view_yview[other.index]+240;
												}
												y += random(other.zspeed);
												
												while(instance_exists(self)
												&& instance_exists(other)
												&& y >= view_yview[other.index]
												&& y <= view_yview[other.index]+240)
												{
													image_yscale = 1+abs(other.zspeed)/5;
													wait(1);
												}
												instance_destroy();
											}
											exit;
										}
									}
								}
								
								if(z >= 1250
								&& zspeed > 0)
								{
									zspeed = 0;
									zgravity = 0;
									with(instance_create(x, y-z, Explosion))
									{
										mask_index = mskNone;
										sound_play(sndExplosionL);
									}
									with(instance_create(x, y-z, CustomObject))
									{
										name = "moon";
										offset = 0;
										
										if(fork())
										{
											while(instance_exists(self)
											&& instance_exists(other)
											&& other.en != noone)
											{
												//y = other.y-other.z-sprite_get_width(other.en.sprite_index)/2;
												vspeed = -other.zspeed;
												
												if(other.z <= 0)
												{
													vspeed = 0;
													if(instance_exists(other)
													&& instance_exists(other.en))
													y = other.y-other.z-sprite_get_width(other.en.sprite_index)/2;
													offset += 10;
													sound_play(sndExplosion);
													for(var k = 0; k < 200; k += 20)
													{
														with(instance_create(x, y-8-k, SmallExplosion))
														{
															mask_index = mskNone;
														}
													}
													
													wait(15);
													
													offset += 5;
													while(instance_exists(self)
													&& instance_exists(other)
													&& instance_exists(other.en)
													&& other.en != noone)
													{
														y = other.y-other.z-sprite_get_width(other.en.sprite_index)/2;
														offset += 0.5;
														wait(1);
													}
												}
												wait(1);
											}
											instance_destroy();
											exit;
										}
									}
									
									wait(12);
									
									zgravity = 0.5;
								}
								
								wait(1);
							}
							background_color = bg;
							sound_play(snd_wrld);
							sound_play(sndLaserCannonCharge);
							z = 0.1;
							zgravity = 0;
							for(var j = 0; j < 360; j += 10)
							{
								if(fork())
								{
									with(instance_create(x+lengthdir_x(64, j), y+lengthdir_y(48, j), CaveSparkle))
									{
										speed = 8;
										direction = j;
										vspeed /= 2;
										friction = 0.1;
										
										//wait(6);
										//direction = direction+180;
										//friction = -0.5;
										with(instance_create(x+lengthdir_x(speed*8, direction), y+lengthdir_y(speed*8, direction), CaveSparkle))
										{
											speed = 1;
											direction = other.direction+180;
											friction = -0.75;
										}
									}
									exit;
								}
							}
							
							wait(15);
							
							if(instance_exists(self))
							{
								canwalk = 0;
							}
							repeat(48)
							{
								if(instance_exists(self))
								{
									my_health = hp;
									with(instance_create(x+lengthdir_x(random(128), random(360)), y+lengthdir_y(random(128), random(360)), Explosion))
									{
										team = other.team;
										sound_play(sndExplosion);
										if(!place_meeting(x, y, Floor))
										{
											x = instance_nearest(x, y, Floor).x+16;
											y = instance_nearest(x, y, Floor).y+16;
										}
									}
									with(instance_create(x+lengthdir_x(random(128), random(360)), y+lengthdir_y(random(128), random(360)), SmallExplosion))
									{
										team = other.team;
										if(!place_meeting(x, y, Floor))
										{
											x = instance_nearest(x, y, Floor).x+8+random(16);
											y = instance_nearest(x, y, Floor).y+8+random(16);
										}
									}
									if(instance_exists(en))
									{
										/*speed = maxspeed;
										direction = gunangle;
										en.speed = 0;
										en.x = x+lengthdir_x(speed, gunangle+180);
										en.y = y+lengthdir_y(speed, gunangle+180);
										en.my_health = enhp;*/
										en.x = x;
										en.y = y;
										speed = 0;
									}

								}
								wait(1);
							}
							
							if(instance_exists(self))
							{
								scrNuke(2);
								sound_play(sndExplosionXL);
								my_health = hp;
								spr_idle = _spr_idle;
								spr_walk = _spr_walk;
								spr_hurt = _spr_hurt;
								spr_dead = _spr_dead;
								snd_hurt = _snd_hurt;
								
								canwalk = 1;
								candie = 1;
								canspec = 1;
								canpick = 1;
								maxspeed = msp;
								zgravity = _zg;
								reload = r;
								
								visible = 1;
							}
							
							if(instance_exists(self)
							&& instance_exists(en))
							{
								with(Wall)
								{
									if(distance_to_object(other) <= 0)
									{
										instance_create(x, y, FloorExplo);
										instance_destroy();
									}
								}
								en.visible = 1;
								en = noone;
							}
							exit;
						}
						break;
					}
					else if(instance_exists(self))
					{
						spr_idle = _spr_idle;
						spr_walk = _spr_walk;
						spr_hurt = _spr_hurt;
						spr_dead = _spr_dead;
						snd_hurt = _snd_hurt;
						
						candie = 1;
						canspec = 1;
						canpick = 1;
						maxspeed = msp;
						zgravity = _zg;
						reload = r;
						
						visible = 1;
					}
				}
				else
				{
					wait(1);
				}
				my_health = hp;
			}
		}
		
		if(instance_exists(self)
		&& z <= 0)
		{	
			spr_idle = _spr_idle;
			spr_walk = _spr_walk;
			spr_hurt = _spr_hurt;
			spr_dead = _spr_dead;
			snd_hurt = _snd_hurt;
			
			candie = 1;
			canspec = 1;
			canpick = 1;
			maxspeed = msp;
		}
	}
}

#define draw
with(Player)
{
	if(en != noone)
	{
		draw_sprite(sprite_index, -1, x, y-z);
		if(instance_exists(en))
		{
			//draw_sprite_ext(en.spr_hurt, 2, x+8*right, y-z, right, 1, 90*right, c_white, 1);
			if(en.object_index == Corpse)
			{
				draw_sprite_ext(en.sprite_index, 2, en.x, en.y-8-z, right, 1, 90*right, c_white, 1);
			}
			else if(en.object_index == NothingBeam)
			{
				draw_sprite_ext(sprPlasmaBallHuge, 1, x, y-8-throneBeamBallSize, 1+throneBeamBallSize, 1+throneBeamBallSize, 90, c_white, 1);
			}
			else if(en != self && en != noone)
			{
				draw_sprite_ext(en.spr_hurt, 2, en.x, en.y-8-z, right, 1, 90*right, c_white, 1);
			}
		}
	}
}
with(CustomObject)
{
	if("name" in self
	&& name == "moon")
	{
		var o = random_range(-2, 2)*instance_exists(Explosion);
		draw_sprite_ext(global.sprMoon, 0, x-offset+o, y-offset/2+o, 1, 1, 0, c_white, 1);
		draw_sprite_ext(global.sprMoon, 1, x+offset+125+o, y-offset/2+o, 1, 1, 0, c_white, 1);
	}
	else if("name" in self
	&& name == "pileproj")
	{
		draw_sprite_ext(sprite_index, 2, x, y-8-z, 1, 1, z*8, c_white, 1);
	}
}

#define scrNuke(size)
// THE GODDESS OF EXPLOSIONS
//     SMILES UPON YOU
with(instance_create(x, y, Explosion))
{
	team = 2;
	visible = 0;
	image_xscale *= 2.5*argument0;
	image_yscale = image_xscale;
	
	with(hitme)
	{
		if("team" in self
		&& team != other.team
		&& distance_to_object(other) <= 0)
		{
			my_health -= 20+10*GameCont.level;
		}
	}
}
// ground ring
for(var i = 0; i < 360; i += 30/argument0)
{
	with(instance_create(x, y, Explosion))
	{
		team = other.team;
		mask_index = mskNone;
		direction = i;
		speed = 8*argument0/1.5;
		vspeed *= 0.75;
	}
}
// tiny ground ring
for(var i = 15; i < 360; i += 30/argument0)
{
	with(instance_create(x, y, SmallExplosion))
	{
		team = other.team;
		mask_index = mskNone;
		direction = i;
		speed = 10*argument0/1.5;
		vspeed *= 0.75;
	}
}
// pillar
repeat(32*argument0)
{
	with(instance_create(x+lengthdir_x(random(8)*argument0, random(360)), y+lengthdir_y(random(8)*argument0, random(360)), SmallExplosion))
	{
		team = other.team;
		mask_index = mskNone;
		vspeed = -random(4)*argument0;
		var d = depth;
		
		if(fork())
		{
			while(instance_exists(self))
			{
				depth = d-(y+ystart)/2;
				wait(1);
			}
			exit;
		}
	}
}
// top ring
for(var i = 0; i < 360; i += 10/argument0)
{
	with(instance_create(x, y, Explosion))
	{
		team = other.team;
		mask_index = mskNone;
		direction = i;
		speed = 6*argument0;
		vspeed *= 0.5;
		vspeed -= 6*argument0;
		image_xscale = 1.5;
		image_yscale = image_xscale;
		var d = depth;
		
		if(fork())
		{
			while(instance_exists(self))
			{
				depth = d-(y+ystart);
				wait(1);
			}
			exit;
		}
	}
}

#define scrZCamera(id, factor)
if(fork())
{
	var index = argument0.index;
	with(instance_create(x, y, GameObject))
	{
		view_object[index] = self;
		while(instance_exists(self)
		&& instance_exists(argument0)
		&& argument0.en != noone)
		{
			//x = argument0.x+argument0.hspeed;
			//y = argument0.y+argument0.vspeed-argument0.z/argument1;
			//x += lengthdir_x(argument0.hspeed*argument1, point_distance(x, y, argument0.x, argument0.y));
			//y += lengthdir_y(argument0.vspeed-argument0.z*argument1, point_distance(x, y, argument0.x, argument0.y));
			hspeed = argument0.hspeed;
			vspeed = argument0.vspeed-argument0.zspeed;
			if(argument0.z <= 0)
			{
				instance_destroy();
			}
			wait(1);
		}
		view_object[index] = argument0;
	}
	exit;
}

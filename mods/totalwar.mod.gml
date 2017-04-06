// /loadmod mods/totalwar.mod.gml

#define init
global.parray = [EnemyBullet1, 	EnemyBullet1, 	EnemyBullet4, 	EnemyBullet3, 	EnemyBullet1	/*, EnemyBullet1, LHBouncer*/];
global.earray = [Bandit, 		Raven, 			Sniper, 		JungleBandit,	JungleAssassin /*, LilHunter, LilHunter*/];
global.drawer = noone;

#define step
if(!instance_exists(global.drawer)
&& instance_exists(enemy))
{
	global.drawer = instance_create(0, 0, CustomObject);
	with(global.drawer)
	{
		script_bind_draw(draw_guns, enemy.depth);
	}
}
with(Player)
{
	if("gunenemy" not in self)
	{
		gunenemy = 1;
	}
	
	// DEBUG
	/*my_health = maxhealth;
	if(button_pressed(index, "horn"))
	{
		instance_create(mouse_x, mouse_y, BanditBoss);	
	}*/
}

for(var i = 0; i < array_length_1d(global.earray); i += 1)
{
	with(global.earray[i])
	{
		if(object_index == global.earray[i])
		{
			wkick = 9999;
			if("gunenemy" not in self)
			{
				gunenemy = 1;
				wepangle = 0;
				tries = 9999;
				
				do
				{
					wep = irandom(999);
					tries -= 1;
				}
				while(tries > 0 && (weapon_get_area(wep) == -1 || weapon_get_area(wep) > GameCont.hard || weapon_get_type(wep) == 0));
				/*if(weapon_get_type(wep) == 0)
				{
					wepangle = 45;
				}*/
			}
		}
	}
}

for(var i = 0; i < array_length_1d(global.parray); i += 1)
{
	with(global.parray[i])
	{
		if(object_index == global.parray[i])
		{
			var creator = instance_nearest(xstart, ystart, hitme);
			if(creator.object_index == global.earray[i])
			{
				if(instance_exists(creator))
				{
					gunenemy = 1;
					with(creator)
					{
						var _o = other;
						var _fire = player_fire_ext(_o.direction, wep, x, y, team, id);
						wepangle = _fire.wepangle;
						alarm1 = _fire.reload;
					}
				}
				instance_destroy();
			}
		}
	}
}



with(enemy)
{
	if(instance_exists(self)
	&& object_index != Wind
	&& object_index != BigMaggotBurrow
	&& my_health <= 0
	&& !(object_index == CustomEnemy && "name" in self && name == "GunAlly")
	&& object_index != Nothing
	&& object_index != Nothing2
	&& object_index != BanditBoss
	&& object_index != ScrapBoss
	&& object_index != LilHunter
	&& (object_index == Bandit
	|| object_index == MeleeBandit
	|| object_index == Raven
	|| object_index == Sniper
	|| object_index == JungleAssassin
	|| object_index == JungleBandit))
	{
		if(!irandom(GameCont.loops))
		{
			with(instance_create(x, y, Ally))
			{
				if("spr_idle" in other) spr_idle = other.spr_idle;
				if("spr_walk" in other) spr_walk = other.spr_walk;
				if("spr_hurt" in other) spr_hurt = other.spr_hurt;
				if("spr_dead" in other) spr_dead = other.spr_dead;
				if("snd_hurt" in other) snd_hurt = other.snd_hurt;
				if("snd_dead" in other) snd_dead = other.snd_dead;
			}
			image_speed = 10;
			//instance_change(Wind, 0);
			var _x = x;
			var _y = y;
			var _spr_dead = spr_dead;
			wait(1);
			with(Corpse)
			{
				if(sprite_index == _spr_dead)
				{
					instance_destroy();
				}
			}
		}
	}
}


if(!instance_exists(global.drawer)
&& instance_exists(Ally))
{
	global.drawer = instance_create(0, 0, CustomObject);
	with(global.drawer)
	{
		script_bind_draw(draw_guns, Ally.depth);
	}
}
with(Player)
{
	if("gunally" not in self)
	{
		gunally = 1;
	}
	
	// DEBUG
	/*my_health = maxhealth;
	if(button_pressed(index, "horn"))
	{
		instance_create(mouse_x, mouse_y, BanditBoss);	
	}*/
}

with(Ally)
{
	wkick = 999;
	if("gunally" not in self)
	{
		gunally = 1;
		wepangle = 0;
		if(instance_exists(creator))
		{
			if(creator.bwep != 0)
			wep = choose(creator.wep, creator.bwep);
			else
			wep = creator.wep;
		}
		else
		wep = 1;
	}
}


with(AllyBullet)
{
	//if("creator" not in self)
	creator = instance_nearest(xstart, ystart, Ally);
	if(instance_exists(creator)
	&& creator.my_health > 0)
	{
		gunally = 1;
		with(creator)
		{
			var _o = other;
			var _fire = player_fire_ext(_o.direction, wep, x+lengthdir_x(12, _o.direction), y+lengthdir_y(12, _o.direction), team, id);
			wepangle = _fire.wepangle;
			alarm1 = _fire.reload;
		}
	}
	instance_destroy();
}

#define draw_guns
for(var i = 0; i < array_length_1d(global.earray); i += 1)
{
	with(global.earray[i])
	{
		if("gunenemy" in self)
		{
			draw_sprite_ext(weapon_get_sprite(wep), 0, x, y, 1, right, gunangle+wepangle, c_white, 1);
		}
	}
}

with(Ally)
{
	if("gunally" in self)
	{
		if(wep == undefined)
		{		
				if(instance_exists(creator))
				{
					if(creator.bwep != 0)
					wep = choose(creator.wep, creator.bwep);
					else
					wep = creator.wep;
				}
		}
		else
		if(weapon_is_melee(wep) == 0)
		draw_sprite_ext(weapon_get_sprite(wep), 0, x, y, 1, right, gunangle+wepangle, c_white, 1);
		else
		draw_sprite_ext(weapon_get_sprite(wep), 0, x, y, 1, right, wepangle, c_white, 1);
		wepangle = 45;
	}
}

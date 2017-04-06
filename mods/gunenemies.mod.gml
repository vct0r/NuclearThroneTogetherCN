// /loadmod mods/gunenemies.mod.gml

#define init
global.parray = [EnemyBullet1, 	EnemyBullet1, 	EnemyBullet4, 	EnemyBullet3, 	EnemyBullet1	/*, EnemyBullet1, LHBouncer*/];
global.earray = [Bandit, 		Raven, 			Sniper, 		JungleBandit, 	BanditBoss		/*, LilHunter, LilHunter*/];
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

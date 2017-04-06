// /loadmod mods/gunallies.mod.gml

#define init
global.parray = [EnemyBullet1, 	EnemyBullet1, 	EnemyBullet4, 	EnemyBullet3, 	EnemyBullet1	/*, EnemyBullet1, LHBouncer*/];
global.earray = [Bandit, 		Raven, 			Sniper, 		JungleBandit, 	BanditBoss		/*, LilHunter, LilHunter*/];
global.drawer = noone;

#define step
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
	wkick = 9999;
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
		/*if(weapon_get_type(wep) == 0)
		{
			wepangle = 45;
		}*/
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
with(Ally)
{
	if("gunally" in self)
	{
		draw_sprite_ext(weapon_get_sprite(wep), 0, x, y, 1, right, gunangle+wepangle, c_white, 1);
	}
}

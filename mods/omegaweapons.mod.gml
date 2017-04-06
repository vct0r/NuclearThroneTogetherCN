// /loadmod mods/omegaweapons.mod.gml
// suggested by Matthanic from ThroneButt

#define init
global.DEBUG = 0;

// setup prefixes
global.prefixes = 0;
prefix_add("HYPER");
prefix_add("HEAVY");
prefix_add("SUPER");
prefix_add("BLOOD");
prefix_add("FLAME");
prefix_add("TOXIC");
prefix_add("ASSAULT");
prefix_add("DOUBLE");
prefix_add("TRIPLE");
prefix_add("QUADRUPLE");
prefix_add("BOUNCER");
prefix_add("GRENADE");
prefix_add("FLAK");
prefix_add("PLASMA");
prefix_add("SEEKER");
prefix_add("CLUSTER");
prefix_add("LIGHTNING");
prefix_add("WAVE");
prefix_add("STICKY");
prefix_add("SMART");
prefix_add("PORTAL");
prefix_add("PARTY");
prefix_add("FOLLOWER");
prefix_add("MAGNETIC");
prefix_add("DIGGER");
prefix_add("ERASER");

global.genContExists = 0;
global.timer = 0;
global.prefixer = [];
for(var i = 0; i < 3; i += 1)
{
	global.prefixer[@i] = noone;
}

// list of all modifiable projectiles
global.ds_projectiles = ds_list_create();

// list of projectiles that should be searched
global.projectileList = [];
var tlist = "";
for(var i = 0; i < 9999; i += 1)
{
	if(object_exists(i)
	&& i != TangleSeed
	&& i != ThrownWep
	&& i != LHBouncer
	&& i != AllyBullet
	&& i != Lightning
	&& i != Laser
	&& i != Flame
	&& i != EnemyBullet1
	&& i != EFlakBullet
	&& i != EnemySlash
	&& i != EnemyBullet3
	&& i != EnemyBullet4
	&& i != TrapFire
	&& i != EnemyLightning
	&& i != EnemyLaser
	&& i != JockRocket
	&& i != PopoSlug
	&& i != PopoPlasmaBall
	&& i != PopoRocket
	&& i != IDPDBullet
	&& i != HorrorBullet
	&& object_get_parent(i) == projectile)
	{
		global.projectileList[array_length_1d(global.projectileList)] = i;
		tlist += object_get_name(i) + ",";
	}
}
//trace(tlist);
global.customProjectileList = [];

#define chat_command
switch(argument0)
{
	case "owep_debug":
	{
		if(argument1 == "0"
		|| argument1 == "1")
		{
			global.DEBUG = real(argument1);
		}
		else
		{
			trace("Usage: owep_debug(bool)");
		}
		return true;
		break;
	}
	case "owep_projectile":
	{
		global.customProjectileList[array_length_1d(global.customProjectileList)] = argument1;
		trace("'" + argument1 + "' projectiles are now enchantable.");
		return true;
		break;
	}
	case "owep_add":
	{
		var p = "";
		var n = "";
		var char = 1;
		while(string_char_at(argument1, char) != " "
		&& char <= string_length(argument1))
		{
			p += string_char_at(argument1, char);
			char += 1;
		}
		char += 1;
		while(char <= string_length(argument1))
		{
			n += string_char_at(argument1, char);
			char += 1;
		}
		if(n == "")
		{
			n = 1;
		}
		else
		{
			n = real(n);
		}
		trace("Prefix: " + p);
		trace("Num: " + string(n));
		
		for(var i = 0; i < global.prefixes; i += 1)
		{
			if(string_upper(p) == global.prefix[i])
			{
				with(Player)
				{
					var _n = 0;
					
					repeat(n)
					{
						aprefix[aprefixes] = i;
						aprefixes += 1;
						
						var progressBar = "[";
						repeat(floor((_n/n)*10))
						{
							progressBar += "||";
						}
						repeat(10-(floor((_n/n)*10)))
						{
							progressBar += " ";
						}
						progressBar += "]";
						trace(progressBar);
						_n += 1;
						
						wait(1);
						repeat(15)
						{
							trace("");
						}
					}
				}
				trace("Added " + string(n) + " to " + string_upper(p));
				return true;
				break;
			}
		}
		return true;
		break;
	}
}

#define prefix_add
// prefix_add(prefixName)
global.prefix[global.prefixes] = argument0;
global.prefixes += 1;

#define prefix_apply
// prefix_apply(prefixID)
if("prefixes" not in self)
{
	prefixes = 0;
	prefix = [];
}
name = global.prefix[argument0] + "! " + name;
prefix[@prefixes] = argument0;
prefixes += 1;

#define reroll
// reroll()
var done = 0;
var rerolled = 0;
if("prefixes" not in self)
{
	while(!done)
	{
		done = 1;
		for(var i = 0; i < global.prefixes; i += 1)
		{
			if(string_count(global.prefix[i], name)
			|| weapon_get_name(wep) == "REVOLVER"
			|| weapon_get_area(wep) == -1
			|| weapon_get_area(wep) > GameCont.area)
			{
				wep = "#" + string(irandom(125)+1);
				done = 0;
				rerolled = 1;
				break;
			}
		}
	}
}
return rerolled;

#define chooseRandomInstance
// chooseRandomInstance(instance)
// simplified by YellowAfterlife
var t = argument0;
var i = irandom(instance_number(t) - 1);
with (t) {
    i -= 1;
    if (i < 0) return id;
}
return noone;

#define prefixer_create
// prefixer_create()
if(fork())
{
	var prefixer = instance_create(argument0, argument1, GameObject);
	var _i = 0;
	while(global.prefixer[_i] != noone
	&& instance_exists(global.prefixer[_i]))
	{
		_i += 1;
	}
	global.prefixer[_i] = prefixer;
	with(prefixer)
	{
		sprite_index = sprChandelier;
		image_speed = 0.4;
		showing = 0;
		prefix = irandom(global.prefixes-1);
		
		var canBeMultiplicative = 1;
		
		with(Player)
		{
			for(var i = 0; i < aprefixes; i += 1)
			{
				if(canBeMultiplicative
				&& (aprefix[i] == 1
				|| aprefix[i] == 2
				|| aprefix[i] == 6
				|| aprefix[i] == 7
				|| aprefix[i] == 8
				|| aprefix[i] == 9
				|| aprefix[i] == 17
				|| aprefix[i] == 25))
				{
					canBeMultiplicative = 0;
				}
			}
		}
		
		while(!canBeMultiplicative
			&& (prefix == 1
			|| prefix == 2
			|| prefix == 6
			|| prefix == 7
			|| prefix == 8
			|| prefix == 9
			|| prefix == 17
			|| prefix == 25))
		{
			var oldprefix = prefix;
			prefix = irandom(global.prefixes-1);
			//trace("Was " + string(global.prefix[oldprefix]) + ", is now " + string(global.prefix[prefix]));
		}
		
		with(Wall)
		{
			if(distance_to_object(other) <= 0)
			{
				instance_create(x, y, FloorExplo);
				instance_destroy();
			}
		}
		
		var _id = id;
		while(instance_exists(self))
		{
			if(random(1) <= 0.5
			&& prefix != -1)
			{
				with(instance_create(x+random_range(-8, 8),
				y-12-random(8),
				CaveSparkle))
				{
					image_blend = make_color_hsv(random(255), 255, 255);
					image_angle = choose(0, 45);
					speed = 0.1;
					friction = -0.1;
					direction = 90;
					depth = other.depth-1;
				}
			}
			showing = 0;
			if(instance_exists(Player))
			{
				if(distance_to_object(Player) <= 0)
				{
					showing = 1;
					with(Player)
					{
						if(distance_to_object(other) <= 0
						&& other.prefix != -1
						&& button_pressed(index, "pick"))
						{
							aprefix[aprefixes] = other.prefix;
							aprefixes += 1;
							other.prefix = -1;
							sound_play(sndStrongSpiritGain);
							with(other)
							{
								repeat(6+irandom(4))
								{
									with(instance_create(x+random_range(-8, 8),
									y-12-random(8),
									CaveSparkle))
									{
										image_blend = make_color_hsv(random(255), 255, 255);
										image_angle = choose(0, 45);
										friction = -0.1;
										depth = other.depth-1;
										speed = 1+random(1);
										direction = random(360);
									}
								}
								for(var i = 0; i < 3; i += 1)
								{
									if(instance_exists(self))
									{
										if(global.prefixer[i] != noone)
										{
											global.prefixer[i].prefix = -1;
										}
										if(fork())
										{
											if(instance_exists(self)) { sprite_index = sprChandelierDead; };
											while(instance_exists(self)
											&& image_index < sprite_get_number(sprChandelierDead)-image_speed)
											{
												wait(1);
											}
											if(instance_exists(self)) { image_speed = 0; }
											exit;
										}
									}
								}
								//instance_destroy();
							}
						}
					}
				}
			}
			wait(1);
		}
		for(var i = 0; i < 3; i += 1)
		{
			if(global.prefixer[i] == _id)
			{
				global.prefixer[i] = noone;
			}
		}
	}
	exit;
}

#define prefix_inherit
// prefix_inherit(otherid)
var o = argument0;
image_blend = o.image_blend;
for(var ipi = 0; ipi < global.prefixes; ipi += 1)
{
	if(variable_instance_exists(o, global.prefix[ipi]))
	{
		variable_instance_set(id, global.prefix[ipi], variable_instance_get(o, global.prefix[ipi]));
		//if(global.DEBUG) trace(string(id) + " - " + string(global.prefix[i]) + ": " + string(variable_instance_get(o, global.prefix[i])));
	}
}
//ds_list_insert(global.ds_projectiles, ds_list_size(global.ds_projectiles)-1, id);
//if(global.DEBUG) trace("---");

#define prefix_clear
// prefix_clear()
for(var i = 0; i < global.prefixes; i += 1)
{
	variable_instance_set(id, global.prefix[i], 0);
}
ds_list_insert(global.ds_projectiles, 0, id);

#define canBeAffected
// canBeAffected()
if("creator" in self)
{
	if(creator == other
	/*&& "ready" not in self*/)
	{
		return 1;
	}
}
return 0;

#define step
global.timer += 1;

if(instance_exists(GenCont))
{
	global.genContExists = 1;
}
else if(global.genContExists)
{
	if(GameCont.area == 1
	&& GameCont.subarea == 1
	&& GameCont.loops == 1
	&& GameCont.kills == 0)
	{
		var fl = Player;
		if(fl != noone)
		{
			with(fl)
			{
				prefixer_create(fl.x, fl.y);
			}
		}
	}
	else if(GameCont.area == 100)
	{
		var fl = CrownPickup;
		if(fl != noone)
		{
			with(fl)
			{
				for(var i = 0; i < 3; i += 1)
				{
					prefixer_create(fl.x+lengthdir_x(64, i*90), fl.y+lengthdir_y(64, i*90));
				}
			}
		}
	}
	else if((GameCont.area == 7
	&& GameCont.subarea == 2)
	|| GameCont.area == 101
	|| GameCont.area == 102
	|| GameCont.area == 103
	|| GameCont.area == 104
	|| GameCont.area == 105)
	{
		//var fl = chooseRandomInstance(prop);
		var fl = chooseRandomInstance(Floor);
		if(fl != noone)
		{
			with(fl)
			{
				prefixer_create(fl.x+16, fl.y+16);
				//instance_change(Wind, 0);
			}
		}
	}
	global.genContExists = 0;
}

with(WepPickup)
{
	if(distance_to_object(Player) <= 0)
	{
		name = weapon_get_name(wep);
	}
}

if(global.DEBUG)
{
	repeat(14)
	{
		trace(""); // clear chat
	}
	trace("Chat constantly cleared for debugging.");
	trace("");
}

for(var i = 0; i < ds_list_size(global.ds_projectiles); i += 1)
{
	if(!instance_exists(ds_list_find_value(global.ds_projectiles, i)))
	{
		ds_list_delete(global.ds_projectiles, i);
		i -= 1;
	}
}

with(Player)
{
	if(!instance_exists(GenCont))
	{
		if(global.DEBUG)
		{
			my_health = maxhealth;
			if(button_pressed(index, "horn"))
			{
				for(var i = 0; i < 3; i += 1)
				{
					global.prefixer[@i] = noone;
				}
				prefixer_create(mouse_x[index], mouse_y[index]);
			}
		}
	}
	if(instance_exists(self))
	{
		if("aprefixes" not in self)
		{
			aprefixes = 0;
			bprefixes = 0;
			if(global.DEBUG)
			{
				if(race != "rogue")
				{
					GameCont.rad = 999999;
				}
				with(instance_create(x, y, Portal))
				{
					wait(1);
					timer = 0;
					endgame = -190;
				}
			}
		}
		/*if(reload <= 0
		&& (button_pressed(index, "fire") && !weapon_get_auto(wep))
		|| (button_check(index, "fire") && weapon_get_auto(wep)))*/
		/*if(reload+3 == weapon_get_cost(wep))
		{
			var _wave = 0;
			for(var i = 0; i < aprefixes; i += 1)
			{
				if(global.prefix[aprefix[i]] == "WAVE")
				{
					_wave += 1;
				}
			}
			
			trace(_wave);
			if(fork())
			{
				for(var j = 0; j < 7*_wave; j += 1)
				{
					if(instance_exists(_creator))
					{
						player_fire(gunangle+sin(j/2)*12);
						player_fire(gunangle-sin(j/2)*12);
						
						repeat(2)
						{
							ammo[weapon_get_type(wep)] += weapon_get_cost(wep);
							reload -= weapon_get_load(wep);
						}
					}
					wait(3);
				}
				exit;
			}
		}*/
		if(random(1) <= min(0.25, aprefixes*0.05))
		{
			with(instance_create(x+lengthdir_x(random(sprite_get_width(weapon_get_sprite(wep)))-sprite_xoffset, gunangle),
			y+lengthdir_y(random(sprite_get_width(weapon_get_sprite(wep)))-sprite_yoffset, gunangle+choose(-90, 0, 90)),
			CaveSparkle))
			{
				image_blend = make_color_hsv(random(255), 255, 255);
				image_angle = choose(0, 45);
				depth = other.depth-1;
				speed = 0.1;
				friction = -0.1;
				direction = 90;
			}
		}
		
		// enchant normal projectiles
		for(var plist = 0; plist < array_length_1d(global.projectileList); plist += 1)
		{
			with(global.projectileList[plist])
			{
				if(creator == other
				&& "omega" not in self)
				{
					//trace("prefixes: " + string(creator.aprefixes));
					omega = 1;
					
					for(var j = 0; j < creator.aprefixes; j += 1)
					{
						var pf = global.prefix[creator.aprefix[j]];
						//trace(pf);
						if(variable_instance_exists(id, pf))
						{
							if(variable_instance_get(id, pf) != -1)
							{
								variable_instance_set(id, pf, variable_instance_get(id, pf)+1);
							}
						}
						else
						{
							variable_instance_set(id, pf, 1);
							//trace("NEW: " + pf);
						}
					}
					image_blend = merge_color(c_white, make_color_hsv(global.timer*8, 255, 255), creator.aprefixes*0.25);
					ds_list_insert(global.ds_projectiles, 0, id);
				}
			}
		}
		
		// enchant custom projectiles
		for(var plist = 0; plist < array_length_1d(global.customProjectileList); plist += 1)
		{
			with(CustomProjectile)
			{
				if(creator == other
				&& "name" in self
				&& name == global.customProjectileList[plist]
				&& "omega" not in self)
				{
					//trace("prefixes: " + string(creator.aprefixes));
					omega = 1;
					
					for(var j = 0; j < creator.aprefixes; j += 1)
					{
						var pf = global.prefix[creator.aprefix[j]];
						//trace(pf);
						if(variable_instance_exists(id, pf))
						{
							if(variable_instance_get(id, pf) != -1)
							{
								variable_instance_set(id, pf, variable_instance_get(id, pf)+1);
							}
						}
						else
						{
							variable_instance_set(id, pf, 1);
							//trace("NEW: " + pf);
						}
					}
					image_blend = merge_color(c_white, make_color_hsv(global.timer*8, 255, 255), creator.aprefixes*0.25);
					ds_list_insert(global.ds_projectiles, 0, id);
				}
			}
		}
		
		for(var i = 0; i < array_length_1d(global.projectileList); i += 1)
		{
			with(global.projectileList[i])
			{
				enchant();
			}
		}
		
		for(var i = 0; i < array_length_1d(global.customProjectileList); i += 1)
		{
			with(CustomProjectile)
			{
				if(creator == other
				&& "name" in self
				&& name == global.customProjectileList[i])
				enchant();
			}
		}
	}
	with(WepPickup)
	{
		if(distance_to_object(other) <= 0)
		{
			var _prefixesList = "";
			for(var i = 0; i < other.aprefixes; i += 1)
			{
				_prefixesList += global.prefix[other.aprefix[i]] + " ";
			}
			//name = _prefixesList + "#" + name;
			name = _prefixesList + name;
		}
	}
	if(global.DEBUG)
	{
		trace(alias + "'s enchantments: (" + string(aprefixes) + ")");
		for(var i = 0; i < aprefixes; i += 1)
		{
			trace("> " + global.prefix[aprefix[i]]);
		}
	}
}
/*with(projectile)
{
	ready = 1;
}*/
if(global.DEBUG)
{
	if(ds_list_size(global.ds_projectiles) > 0)
	{
		trace("");
		for(var i = 0; i < ds_list_size(global.ds_projectiles); i += 1)
		{
			var o = ds_list_find_value(global.ds_projectiles, i);
			if(instance_exists(o))
			{
				trace(object_get_name(o.object_index) + ":");
				for(var j = 0; j < global.prefixes; j += 1)
				{
					if(variable_instance_exists(o, global.prefix[j]))
					{
						trace(" " + global.prefix[j] + ": " + string(variable_instance_get(o, global.prefix[j])));
					}
				}
			}
		}
	}
}

with(WepPickup)
{
	if(distance_to_object(Player) <= 0)
	{
		// fancy names
		var _changed = 1;
		while(_changed)
		{
			_changed = 0;
			if(string_count("HEAVY ", name) >= 2)
			{
				name = string_replace(name, "HEAVY ", "DENSE ");
				name = string_replace_all(name, "HEAVY ", "");
				_changed = 1;
			}
			if(string_count("DOUBLE ", name) >= 2)
			{
				name = string_replace(name, "DOUBLE ", "");
				name = string_replace(name, "DOUBLE ", "QUADRUPLE ");
				_changed = 1;
			}
			if(string_count("TRIPLE ", name) >= 2)
			{
				name = string_replace(name, "TRIPLE ", "");
				name = string_replace(name, "TRIPLE ", "SEXTUPLE ");
				_changed = 1;
			}
			if(string_count("SEXTUPLE ", name) >= 2)
			{
				name = string_replace(name, "SEXTUPLE ", "");
				name = string_replace(name, "SEXTUPLE ", "DUODECUPLE ");
				_changed = 1;
			}
			if(string_count("QUADRUPLE ", name) >= 2)
			{
				name = string_replace(name, "QUADRUPLE ", "");
				name = string_replace(name, "QUADRUPLE ", "OCTUPLE ");
				_changed = 1;
			}
			if(string_count("OCTUPLE ", name) >= 2)
			{
				name = string_replace(name, "OCTUPLE ", "");
				name = string_replace(name, "OCTUPLE ", "SEXDECUPLE ");
				_changed = 1;
			}
			if(string_count("SUPER ", name) >= 2)
			{
				name = string_replace(name, "SUPER ", "");
				name = string_replace(name, "SUPER ", "DECUPLE ");
				_changed = 1;
			}
			if(string_count("DECUPLE ", name) >= 2)
			{
				name = string_replace(name, "DECUPLE ", "");
				name = string_replace(name, "DECUPLE ", "VIGINTUPLE ");
				_changed = 1;
			}
			if(string_count("WAVE ", name) >= 2)
			{
				name = string_replace(name, "WAVE ", "WOBBLE ");
				name = string_replace_all(name, "WAVE ", "");
				_changed = 1;
			}
			if(string_count("STICKY ", name) >= 2)
			{
				name = string_replace(name, "STICKY ", "CLOGGED ");
				name = string_replace_all(name, "STICKY ", "");
				_changed = 1;
			}
			if(string_count("BLOOD ", name) >= 2)
			{
				name = string_replace(name, "BLOOD ", "BLOODY ");
				name = string_replace_all(name, "BLOOD ", "");
				_changed = 1;
			}
			if(string_count("SMART ", name) >= 2)
			{
				name = string_replace(name, "SMART ", "INTELLIGENT ");
				name = string_replace_all(name, "SMART ", "");
				_changed = 1;
			}
			if(string_count("CLUSTER ", name) >= 2)
			{
				name = string_replace(name, "CLUSTER ", "BUNDLE ");
				name = string_replace_all(name, "CLUSTER ", "");
				_changed = 1;
			}
			if(string_count("SEEKER ", name) >= 2)
			{
				name = string_replace(name, "SEEKER ", "FINDER ");
				name = string_replace_all(name, "SEEKER ", "");
				_changed = 1;
			}
			if(string_count("PLASMA ", name) >= 2)
			{
				name = string_replace(name, "PLASMA ", "EXTRACELLULAR ");
				name = string_replace_all(name, "PLASMA ", "");
				_changed = 1;
			}
			if(string_count("ASSAULT ", name) >= 2)
			{
				name = string_replace(name, "ASSAULT ", "CONFLICT ");
				name = string_replace_all(name, "ASSAULT ", "");
				_changed = 1;
			}
			if(string_count("FLAME ", name) >= 2)
			{
				name = string_replace(name, "FLAME ", "BURNING ");
				name = string_replace_all(name, "FLAME ", "");
				_changed = 1;
			}
			if(string_count("GRENADE ", name) >= 2)
			{
				name = string_replace(name, "GRENADE ", "EXPLOSIVE ");
				name = string_replace_all(name, "GRENADE ", "");
				_changed = 1;
			}
			
			if(string_count("DOUBLE ", name) >= 1
			&& string_count("TRIPLE ", name) >= 1)
			{
				name = string_replace(name, "DOUBLE ", "");
				name = string_replace(name, "TRIPLE ", "SUPER ");
				_changed = 1;
			}
			if(string_count("TRIPLE ", name) >= 1
			&& string_count("QUADRUPLE ", name) >= 1)
			{
				name = string_replace(name, "TRIPLE ", "");
				name = string_replace(name, "QUADRUPLE ", "SEPTUPLE ");
				_changed = 1;
			}
			if(string_count("QUADRUPLE ", name) >= 1
			&& string_count("SUPER ", name) >= 1)
			{
				name = string_replace(name, "QUADRUPLE ", "");
				name = string_replace(name, "SUPER ", "NONUPLE ");
				_changed = 1;
			}
			if(string_count("DOUBLE ", name) >= 1
			&& string_count("DECUPLE ", name) >= 1)
			{
				name = string_replace(name, "DOUBLE ", "");
				name = string_replace(name, "DECUPLE ", "VIGINTUPLE ");
				_changed = 1;
			}
			if(string_count("SUPER ", name) >= 1
			&& string_count("SEXTUPLE ", name) >= 1)
			{
				name = string_replace(name, "SUPER ", "");
				name = string_replace(name, "SEXTUPLE ", "SEXTUPER ");
				_changed = 1;
			}
		}
	}
}

#define custom_inherit(proj)
if(instance_exists(self)
&& instance_exists(other))
{
	if("team" in other) team = other.team;
	if("creator" in other) creator = other.creator;
	if("damage" in other) damage = other.damage;
	if("force" in other) force = other.force;
	if("on_step" in other) on_step = other.on_step;
	if("on_begin_step" in other) on_begin_step = other.on_begin_step;
	if("on_end_step" in other) on_end_step = other.on_end_step;
	if("on_draw" in other) on_draw = other.on_draw;
	if("on_anim" in other) on_anim = other.on_anim;
	if("on_wall" in other) on_wall = other.on_wall;
	if("on_hit" in other) on_hit = other.on_hit;
	if("on_destroy" in other) on_destroy = other.on_destroy;
}

#define enchant
if("SUPER" in self)
{
	while(instance_exists(self)
	&& SUPER > 0)
	{
		// spawn 4 other similar projectiles
		if(fork())
		{
			for(var j = 1; j <= 2; j += 1)
			{
				with(instance_create(creator.x, creator.y, object_index))
				{
					if("sticky" in other) sticky = other.sticky;
					if(instance_exists(other)) prefix_inherit(other);
					creator = other.creator;
					/*HEAVY = -1;
					DOUBLE = -1;
					TRIPLE = -1;
					QUADRUPLE = -1;*/
					SUPER = -1;
					ds_list_insert(global.ds_projectiles, 0, id);
					speed = other.speed;
					direction = other.direction+8*j;
					image_angle = direction;
					team = other.team;
					sprite_index = other.sprite_index;
					
					custom_inherit(other);
				}
			}
			for(var j = 1; j <= 2; j += 1)
			{
				with(instance_create(creator.x, creator.y, object_index))
				{
					if("sticky" in other) sticky = other.sticky;
					if(instance_exists(other)) prefix_inherit(other);
					creator = other.creator;
					/*HEAVY = -1;
					DOUBLE = -1;
					TRIPLE = -1;
					QUADRUPLE = -1;*/
					SUPER = -1;
					ds_list_insert(global.ds_projectiles, 0, id);
					speed = other.speed;
					direction = other.direction-8*j;
					image_angle = direction;
					team = other.team;
					sprite_index = other.sprite_index;
					
					custom_inherit(other);
				}
			}
			exit;
		}
		if(instance_exists(self)) SUPER = 0;
	}
}
if("QUADRUPLE" in self)
{
	while(instance_exists(self)
	&& QUADRUPLE > 0)
	{
		// spawn 3 other similar projectiles
		//if(fork())
		{
			direction -= 12;
			image_angle = direction;
			for(var j = 1; j < 4; j += 1)
			{
				with(instance_create(creator.x, creator.y, object_index))
				{
					if("sticky" in other) sticky = other.sticky;
					if(instance_exists(other)) prefix_inherit(other);
					creator = other.creator;
					/*HEAVY = -1;
					DOUBLE = -1;
					TRIPLE = -1;
					SUPER = -1;*/
					QUADRUPLE = -1;
					ds_list_insert(global.ds_projectiles, 0, id);
					speed = other.speed;
					direction = other.direction+8*j;
					image_angle = direction;
					team = other.team;
					sprite_index = other.sprite_index;
					
					custom_inherit(other);
				}
			}
		}
		if(instance_exists(self)) QUADRUPLE = 0;
	}
}
if("TRIPLE" in self)
{
	while(instance_exists(self)
	&& TRIPLE > 0)
	{
		// spawn 2 other similar projectiles
		//if(fork())
		{
			direction -= 8;
			image_angle = direction;
			for(var j = 1; j < 3; j += 1)
			{
				with(instance_create(creator.x, creator.y, object_index))
				{
					if("sticky" in other) sticky = other.sticky;
					if(instance_exists(other)) prefix_inherit(other);
					creator = other.creator;
					/*HEAVY = -1;
					DOUBLE = -1;
					QUADRUPLE = -1;
					SUPER = -1;*/
					TRIPLE = -1;
					ds_list_insert(global.ds_projectiles, 0, id);
					speed = other.speed;
					direction = other.direction+8*j;
					image_angle = direction;
					team = other.team;
					sprite_index = other.sprite_index;
					
					custom_inherit(other);
				}
			}
		}
		if(instance_exists(self)) TRIPLE = 0;
	}
}
if("DOUBLE" in self)
{
	while(instance_exists(self)
	&& DOUBLE > 0)
	{
		// spawn another similar projectile
		//if(fork())
		{
			direction -= 4;
			image_angle = direction;
			for(var j = 1; j < 2; j += 1)
			{
				with(instance_create(creator.x, creator.y, object_index))
				{
					if("sticky" in other) sticky = other.sticky;
					if(instance_exists(other)) prefix_inherit(other);
					creator = other.creator;
					/*HEAVY = -1;
					TRIPLE = -1;
					QUADRUPLE = -1;
					SUPER = -1;*/
					DOUBLE = -1;
					speed = other.speed;
					direction = other.direction+8*j;
					image_angle = direction;
					team = other.team;
					sprite_index = other.sprite_index;
					
					custom_inherit(other);
				}
			}
		}
		if(instance_exists(self)) DOUBLE = 0;
	}
}
if("HEAVY" in self)
{
	while(instance_exists(self)
	&& HEAVY > 0)
	{
		// spawn a copy on top
		if(fork())
		{
			with(instance_create(x, y, object_index))
			{
				if("sticky" in other) sticky = other.sticky;
				if(instance_exists(other)) prefix_inherit(other);
				creator = other.creator;
				/*DOUBLE = -1;
				TRIPLE = -1;
				QUADRUPLE = -1;
				SUPER = -1;
				ASSAULT = -1;
				WAVE = -1;*/
				HEAVY = -1;
				ds_list_insert(global.ds_projectiles, 0, id);
				speed = other.speed;
				direction = other.direction+8*j;
				image_angle = direction;
				team = other.team;
				sprite_index = other.sprite_index;
				
				custom_inherit(other);
				
				while(instance_exists(self)
				&& instance_exists(other))
				{
					//HEAVY = -1;
					x = other.x;
					y = other.y;
					direction = other.direction;
					image_angle = other.image_angle;
					wait(1);
				}
			}
			exit;
		}
		if(instance_exists(self)) HEAVY -= 1;
	}
}
if("ERASER" in self)
{
	while(instance_exists(self)
	&& ERASER > 0)
	{
		// spawn a copy on top
		var e = ERASER;
		if(fork())
		{
			for(var k = 1; k < e+1; k += 0.2)
			{
				if(instance_exists(self))
				{
					with(instance_create(x, y, object_index))
					{
						if("sticky" in other) sticky = other.sticky;
						if(instance_exists(other)) prefix_inherit(other);
						creator = other.creator;
						/*DOUBLE = -1;
						TRIPLE = -1;
						QUADRUPLE = -1;
						SUPER = -1;
						ASSAULT = -1;
						WAVE = -1;*/
						ERASER = -1;
						ds_list_insert(global.ds_projectiles, 0, id);
						speed = other.speed*(k*0.5)+0.5;
						direction = other.direction;
						image_angle = direction;
						team = other.team;
						sprite_index = other.sprite_index;
						
						custom_inherit(other);
					}
				}
			}
			exit;
		}
		if(instance_exists(self)) ERASER = 0;
	}
}
if("ASSAULT" in self)
{
	while(instance_exists(self)
	&& ASSAULT > 0)
	{
		// turn each projectile into a burst version of itself
		if(fork())
		{
			with(instance_create(x, y, GameObject)) // BURST
			{
				prefix_inherit(other);
				var _creator = other.creator;
				var _obj = other.object_index;
				var _spd = other.speed;
				var _dir = other.direction;
				var _team = other.team;
				var _spr = other.sprite_index;
				var _x = other.x;
				var _y = other.y;
				var _ASS = other.ASSAULT;
				
				custom_inherit(other);
				
				for(var i = 0; i < 2+3*(_ASS-1); i += 1)
				{
					var _created = 0;
					wait(2+2*min(i, 1));
					
					if(instance_exists(_creator)
					&& !_created)
					{
						_created = 1;
						with(instance_create(_creator.x, _creator.y, _obj))
						{
							//prefix_inherit(other);
							creator = _creator;
							if("sticky" in other) sticky = other.sticky;
							ASSAULT = -1;
							WAVE = -1;
							speed = _spd;
							direction = _dir;
							image_angle = direction;
							team = _team;
							sprite_index = _spr;
						}
					}
				}
				instance_destroy();
			}
			exit;
		}
		if(instance_exists(self)) ASSAULT = 0;
	}
}
if("BLOOD" in self)
{
	while(instance_exists(self)
	&& BLOOD > 0)
	{
		// spawn blood explosions occasionally and 3 on death
		if(fork())
		{
			var l = sprite_width/1.5;
			var d = random(360);
			var di = direction;
			var _x = x;
			var _y = y;
			var _team = team;
			var _s = speed;
			while(instance_exists(self))
			{
				_x = x;
				_y = y;
				_team = team;
				_s = speed;
				di = direction;
				wait(1);
			}
			d = random(360);
			with(instance_create(_x+lengthdir_x(l, d+j*120)+lengthdir_x(_s, di), _y+lengthdir_y(l, d+j*120)+lengthdir_y(_s, di), MeatExplosion))
			{
				team = _team;
			}
			exit;
		}
		if(instance_exists(self)) BLOOD -= 1;
	}
}
if("FLAME" in self)
{
	while(instance_exists(self)
	&& FLAME > 0)
	{
		// spawn flames occasionally and lots on death
		if(object_index != Flame)
		{
			if(fork())
			{
				var l = sprite_width/2;
				var d = random(360);
				var _x = x;
				var _y = y;
				var _team = team;
				var _FL = FLAME;
				while(instance_exists(self))
				{
					_x = x;
					_y = y;
					_team = team;
					if(random(1) <= 0.20+(0.05*_FL)
					&& speed > 0)
					{
						d = random(360);
						with(instance_create(x+lengthdir_x(l, d), y+lengthdir_y(l, d), Flame))
						{
							team = other.team;
							FLAME = -1;
						}
					}
					wait(1);
				}
				exit;
			}
		}
		if(instance_exists(self)) FLAME = 0;
	}
}
if("FLAK" in self)
{
	while(instance_exists(self)
	&& FLAK > 0)
	{
		// explode into shells on death
		if(object_index != MeatExplosion)
		{
			if(fork())
			{
				var _x = x;
				var _y = y;
				var _spd = speed;
				var _dir = direction;
				var _team = team;
				while(instance_exists(self))
				{
					_x = x;
					_y = y;
					_team = team;
					wait(1);
				}
				sound_play(sndFlakCannon);
				repeat(6)
				{
					with(instance_create(_x+lengthdir_x(_spd/2, _dir), _y+lengthdir_y(_spd/2, _dir), Bullet2))
					{
						FLAK = -1;
						team = _team;
						speed = 8+random(8);
						direction = random(360);
					}
				}
				exit;
			}
		}
		if(instance_exists(self)) FLAK -= 1;
	}
}
if("TOXIC" in self)
{
	while(instance_exists(self)
	&& TOXIC > 0)
	{
		// spawn lots of toxic gas on death
		if(object_index != ToxicGas)
		{
			if(fork())
			{
				var _x = x;
				var _y = y;
				while(instance_exists(self))
				{
					_x = x;
					_y = y;
					wait(1);
				}
				sound_play(sndToxicBoltGas);
				wait(8)
				{
					repeat(6)
					{
						with(instance_create(_x, _y, ToxicGas))
						{
							speed = random(2);
							direction = random(360);
						}
					}
				}
				exit;
			}
		}
		if(instance_exists(self)) TOXIC -= 1;
	}
}
if("BOUNCER" in self)
{
	if(instance_exists(self)
	&& BOUNCER > 0)
	{
		//if(fork())
		{
			if(instance_exists(self))
			{
				//BOUNCER -= 1;
				if(!place_free(x+lengthdir_x(speed+1, direction), y+lengthdir_y(speed+1, direction)))
				{
					if(instance_exists(self))
					{
						//bounces -= 1;
						move_contact_solid(direction, speed+1);
						move_bounce_solid(0);
						image_angle = direction;
						sound_play(sndBouncerBounce);
						if(instance_exists(self)) BOUNCER -= 1;
					}
				}
			}
		}
	}
}
if("GRENADE" in self)
{
	while(instance_exists(self)
	&& GRENADE > 0)
	{
		// explode on death
		if(fork())
		{
			var _x = x;
			var _y = y;
			var _dir = direction;
			var _width = sprite_width;
			while(instance_exists(self))
			{
				_x = x;
				_y = y;
				_dir = direction;
				wait(1);
			}
			sound_play(sndExplosion);
			instance_create(_x+lengthdir_x(_width, _dir), _y+lengthdir_y(_width, _dir), SmallExplosion);
			exit;
		}
		if(instance_exists(self)) GRENADE -= 1;
	}
}
if("PLASMA" in self)
{
	while(instance_exists(self)
	&& PLASMA > 0)
	{
		// explode into a plasma impact on death
		if(fork())
		{
			var _x = x;
			var _y = y;
			var _team = team;
			var p = PLASMA;
			while(instance_exists(self))
			{
				_x = x;
				_y = y;
				if("team" in self) _team = team;
				wait(1);
			}
			sound_play(sndPlasmaBigExplode);
			with(instance_create(_x+lengthdir_x((p-1)*4, random(360)), _y+lengthdir_y((p-1)*4, random(360)), PlasmaImpact))
			{
				PLASMA = -1;
				team = _team;
			}
			exit;
		}
		if(instance_exists(self)) PLASMA -= 1;
	}
}
if("SEEKER" in self
&& "HYPER" not in self) // code in HYPER section
{
	while(instance_exists(self)
	&& SEEKER > 0)
	{
		// seeks enemies
		// no duh
		if(fork())
		{
			while(instance_exists(self))
			{
				if(instance_exists(enemy))
				{
					ne = instance_nearest(x, y, enemy);
					if(ne != noone)
					{
						if(!collision_line(x, y, ne.x, ne.y, Wall, 1, 1)
						&& ne.my_health > 0)
						{
							repeat(SEEKER)
							{
								direction -= angle_difference(direction, point_direction(x, y, ne.x, ne.y))/(point_distance(x, y, ne.x, ne.y)/16);
							}
							image_angle = direction;
						}
					}
				}
				wait(1);
			}
			exit;
		}
		if(instance_exists(self)) SEEKER = 0;
	}
}
if("CLUSTER" in self)
{
	while(instance_exists(self)
	&& CLUSTER > 0)
	{
		// explode into shells on death
		if(object_index != MiniNade)
		{
			if(fork())
			{
				var _x = x;
				var _y = y;
				var _width = sprite_width;
				var _team = team;
				var _dir = direction;
				while(instance_exists(self))
				{
					_x = x;
					_y = y;
					_dir = direction;
					if("team" in self) _team = team;
					wait(1);
				}
				var doCluster = 1;
				if(doCluster)
				{
					sound_play(sndClusterOpen);
					repeat(2+irandom(1))
					{
						with(instance_create(_x+lengthdir_x(_width, _dir), _y+lengthdir_y(_width, _dir), MiniNade))
						{
							prefix_clear();
							CLUSTER = -1;
							team = _team;
							speed = 4+random(4);
							direction = random(360);
						}
					}
				}
				exit;
			}
		}
		if(instance_exists(self)) CLUSTER -= 1;
	}
}
if("LIGHTNING" in self)
{
	while(instance_exists(self)
	&& LIGHTNING > 0)
	{
		// create lightning bolt on enemy impact
		if(object_index != Lightning)
		{
			if(fork())
			{
				var _x = x;
				var _y = y;
				var _team = team;
				var _dir = direction;
				var _dir = random(360);
				while(instance_exists(self))
				{
					_x = x;
					_y = y;
					_team = team;
					_dir = direction;
					if(distance_to_object(enemy) <= 0)
					{
						sound_play(sndLightningPistol);
						with(instance_create(x, y, Lightning))
						{
							LIGHTNING = -1;
							ammo = 8;
							team = other.team;
							alarm0 = 1;
							//image_angle = other.direction;
							image_angle = random(360);
							with(instance_create(x, y, LightningSpawn))
							{
								image_angle = other.image_angle;
							}
						}
					}
					wait(1);
				}
				sound_play(sndLightningPistol);
				with(instance_create(_x, _y, Lightning))
				{
					LIGHTNING = -1;
					ammo = 8;
					team = _team;
					alarm0 = 1;
					//image_angle = _dir;
					image_angle = random(360);
					with(instance_create(x, y, LightningSpawn))
					{
						LIGHTNING = -1;
						image_angle = other.image_angle;
					}
				}
				exit;
			}
		}
		if(instance_exists(self)) LIGHTNING -= 1;
	}
}
if("WAVE" in self)
{
	while(instance_exists(self)
	&& WAVE > 0)
	{
		// turn each projectile into a wave burst version of itself
		if(fork())
		{
			with(instance_create(creator.x, creator.y, GameObject))
			{
				prefix_inherit(other);
				var _creator = other.creator;
				var _cx = _creator.x;
				var _cy = _creator.y;
				var _obj = other.object_index;
				var _spd = other.speed;
				var _dir = other.direction;
				var _team = other.team;
				var _spr = other.sprite_index;
				var _x = other.x+lengthdir_x(other.speed, other.direction+180);
				var _y = other.y+lengthdir_y(other.speed, other.direction+180);
				if("sticky" in other) var _sticky = other.sticky;
				//x = 0;
				//y = 0;
				//instance_change(Wind, 0);
				
				//wait(10);
				var _wave = WAVE;
				if(fork())
				{
					for(var j = 0; j < 7*_wave; j += 1)
					{
						if(instance_exists(_creator))
						{
							var _cx = _creator.x;
							var _cy = _creator.y;
						}
						with(instance_create(_cx, _cy, _obj))
						//with(instance_copy(0))
						{
							if("sticky" in other) sticky = other.sticky;
							//if(instance_exists(other)) prefix_inherit(other);
							creator = _creator;
							WAVE = -1;
							speed = _spd;
							direction = _dir+sin(j/2)*8;
							image_angle = direction;
							team = _team;
							sprite_index = _spr;
						}
						with(instance_create(_cx, _cy, _obj))
						//with(instance_copy(0))
						{
							if("sticky" in other) sticky = other.sticky;
							//if(instance_exists(other)) prefix_inherit(other);
							creator = _creator;
							WAVE = -1;
							speed = _spd;
							direction = _dir-sin(j/2.2)*8;
							image_angle = direction;
							team = _team;
							sprite_index = _spr;
						}
						wait(2);
					}
					exit;
				}
			}
			exit;
		}
		if(instance_exists(self)) WAVE = 0;
	}
}
if("PORTAL" in self)
{
	while(instance_exists(self)
	&& PORTAL > 0)
	{
		// warp to the nearest opposite wall
		if(fork())
		{
			var _portals = PORTAL;
			while(instance_exists(self)
			&& _portals > 0)
			{
				if(!place_free(x+lengthdir_x(speed*2, direction), y+lengthdir_y(speed*2, direction)))
				{
					sound_play(sndPlasma);
					move_contact_solid(direction, speed*2);
					
					if(instance_exists(self)
					&& instance_exists(Wall))
					{
						var _dir = (round(point_direction(x, y, instance_nearest(x+lengthdir_x(speed*2, direction), y+lengthdir_y(speed*2, direction), Wall).x, instance_nearest(x+lengthdir_x(speed*2, direction), y+lengthdir_y(speed*2, direction), Wall).y)/90)*90)+180;
						//var _dir = (round(point_direction(x+lengthdir_x(speed*2, direction), y+lengthdir_y(speed*2, direction), instance_nearest(x+lengthdir_x(speed*2, direction), y+lengthdir_y(speed*2, direction), Wall).x, instance_nearest(x+lengthdir_x(speed*2, direction), y+lengthdir_y(speed*2, direction), Wall).y)/90)*90)+180;
						//var _dir = (round(direction/90)*90)+180;
						/*for(var i = 0; i < 360; i += 45)
						{
							with(instance_create(x+lengthdir_x(8, i), y+lengthdir_y(8, i), CaveSparkle))
							{
								image_blend = merge_color(c_blue, c_aqua, random(1));
								speed = 1;
								image_speed *= 2;
								direction = i+180;
							}
						}*/
						with(instance_create(x, y, CaveSparkle))
						{
							sprite_index = sprIDPDPortalClose;
							image_speed = 0.8;
							image_index = 2;
						}
						move_contact_solid(_dir, instance_number(Floor)*32);
						/*with(instance_create(x, y, CaveSparkle))
						{
							sprite_index = sprProtoPortalDisappear;
							image_blend = c_orange;
							image_speed = 0.8;
							image_index = 2;
						}*/
						for(var i = 0; i < 360; i += 45)
						{
							with(instance_create(x, y, CaveSparkle))
							{
								image_blend = merge_color(c_orange, c_red, random(1));
								speed = 1;
								image_speed *= 2;
								direction = i;
							}
						}
					}
					if(instance_exists(self)) _portals -= 1;
				}
				wait(1);
			}
			exit;
		}
		if(instance_exists(self)) PORTAL = 0;
	}
}
if("STICKY" in self)
{
	_canSticky = 1;
	if("BOUNCER" in self)
	{
		if(BOUNCER > 0)
		{
			_canSticky = 0;
		}
	}
	while(instance_exists(self)
	&& STICKY > 0
	&& _canSticky)
	{
		// stick to walls (and enemies? (not yet))
		var s = STICKY;
		if(fork())
		{
			while(instance_exists(self))
			{
				if(!place_free(x+lengthdir_x(speed*2, direction), y+lengthdir_y(speed*2, direction)))
				{
					sound_play(sndGrenadeStickWall);
					move_contact_solid(direction, speed*2);
					speed = 0;
					image_speed = 0;
					var _ib = image_blend;
					var _ix = image_index;
					var _x = x;
					var _y = y;
					repeat(30)
					{
						if(instance_exists(self))
						{
							image_index = _ix;
							if(distance_to_object(Explosion) <= 0)
							{
								sound_play(sndExplosionL);
								for(j = 0; j < 2+s; j += 1)
								{
									instance_create(_x+lengthdir_x(1, j*120), _y+lengthdir_y(1, j*120), Explosion);
								}
								instance_destroy();
							}
							wait(1);
						}
					}
					if(instance_exists(self))
					{
						repeat(4)
						{
							if(instance_exists(self))
							{
								image_blend = c_black;
								wait(2);
							}
							if(instance_exists(self))
							{
								image_blend = _ib;
								wait(2);
							}
						}
						sound_play(sndExplosionL);
						for(j = 0; j < 2+s; j += 1)
						{
							if(instance_exists(self))
							instance_create(_x+lengthdir_x(1, j*120), _y+lengthdir_y(1, j*120), Explosion);
						}
						if(instance_exists(self))
						instance_destroy();
					}
				}
				wait(1);
			}
			exit;
		}
		if(instance_exists(self)) STICKY = 0;
	}
}
if("SMART" in self)
{
	while(instance_exists(self)
	&& SMART > 0)
	{
		// aim at the nearest enemy
		if(instance_exists(enemy))
		{
			var ne = instance_nearest(mouse_x[creator.index], mouse_y[creator.index], enemy);
			if(!collision_line(x, y, ne.x, ne.y, Wall, 1, 1))
			{
				direction = point_direction(x, y, ne.x, ne.y);
				image_angle = direction;
			}
		}
		if(instance_exists(self)) SMART = 0;
	}
}
if("PARTY" in self)
{
	while(instance_exists(self)
	&& PARTY > 0)
	{
		// PARTY!!!
		if(PARTY == 1)
		{
			sound_play(choose(sndConfetti1, sndConfetti2, sndConfetti3, sndConfetti4, sndConfetti5, sndConfetti6, sndConfetti7));
		}
		repeat(4)
		{
			with(instance_create(x, y, Confetti))
			{
				speed = random(other.speed/2);
				direction = other.direction+45*random_range(-1, 1);
			}
		}
		if(instance_exists(self)) PARTY -= 1;
	}
}
if("HYPER" in self)
{
	while(instance_exists(self)
	&& HYPER > 0)
	{
		// move for a looong distance unless in contact with a wall or enemy
		if(fork())
		{
			wait(0.1);
			if(instance_exists(self))
			{
				if(speed > 0)
				{
					var dist = 320;
					var _nh = instance_nearest(x, y, hitme);
					if(_nh == creator)
					{
						if(instance_exists(enemy))
							_nh = instance_nearest(x, y, enemy);
						else if(instance_exists(prop))
							_nh = instance_nearest(x, y, prop);
					}
					while(place_free(x+lengthdir_x(speed, direction), y+lengthdir_y(speed, direction))
					&& distance_to_object(Floor) <= 0
					&& distance_to_object(_nh) > 0
					&& dist > 0)
					{
						_nh = instance_nearest(x, y, hitme);
						if(_nh == creator)
						{
							if(instance_exists(enemy))
								_nh = instance_nearest(x, y, enemy);
							else if(instance_exists(prop))
								_nh = instance_nearest(x, y, prop);
						}
						x += lengthdir_x(max(16, speed), direction);
						y += lengthdir_y(max(16, speed), direction);
						// SEEKER!!! :O
						if("SEEKER" in self)
						{
							if(SEEKER > 0)
							{
								if(instance_exists(enemy))
								{
									ne = instance_nearest(x, y, enemy);
									if(ne != noone)
									{
										if(!collision_line(x, y, ne.x, ne.y, Wall, 1, 1)
										&& ne.my_health > 0)
										{
											direction -= angle_difference(direction, point_direction(x, y, ne.x, ne.y))/(point_distance(x, y, ne.x, ne.y)/16);
											image_angle = direction;
										}
									}
								}
								if(object_index != Bolt
								&& object_index != HeavyBolt
								&& object_index != Splinter)
								{
									with(instance_create(x, y, BoltTrail))
									{
										image_xscale = other.speed;
										image_angle = other.direction+180;
									}
								}
							}
						}
						if(object_index != Bolt
						&& object_index != HeavyBolt
						&& object_index != Splinter)
						{
							if(random(1) <= speed*0.01)
							{
								instance_create(x, y, Smoke);
							}
						}
						dist -= 1;
					}
					do
					{
					x -= lengthdir_x(speed, direction);
					y -= lengthdir_y(speed, direction);
					} while(!place_free(x, y))
					dist = 0;
					if("SEEKER" in self) { SEEKER = 0; }
				}
			}
			exit;
		}
		if(instance_exists(self)) HYPER = 0;
	}
}
if("FOLLOWER" in self
&& "creator" in self)
{
	if(instance_exists(self)
	&& instance_exists(creator)
	&& FOLLOWER > 0)
	{
		// follows cursor a-la nuke
		var f = FOLLOWER;
		
		if(fork())
		{
			while(instance_exists(self)
			&& instance_exists(creator)
			&& speed > 1)
			{
				direction -= angle_difference(direction, point_direction(x, y, mouse_x[creator.index], mouse_y[creator.index]))/(speed/f);
				image_angle = direction;
				wait(1);
			}
			exit;
		}
		if(instance_exists(self)) FOLLOWER = 0;
	}
}
if("MAGNETIC" in self)
{
	if(instance_exists(self)
	&& MAGNETIC > 0)
	{
		// follows cursor a-la nuke
		if(fork())
		{
			while(instance_exists(self))
			{
				with(Player)
				{
					if(point_distance(x, y, other.x, other.y) < 96)
					{
						x += lengthdir_x(1, point_direction(x, y, other.x, other.y));
						y += lengthdir_y(1, point_direction(x, y, other.x, other.y));
					}
				}
				with(enemy)
				{
					if(point_distance(x, y, other.x, other.y) < 96)
					{
						x += lengthdir_x(2, point_direction(x, y, other.x, other.y));
						y += lengthdir_y(2, point_direction(x, y, other.x, other.y));
					}
				}
				wait(1);
			}
			exit;
		}
		MAGNETIC -= 1;
	}
}
if("DIGGER" in self)
{
	if(instance_exists(self)
	&& DIGGER > 0)
	{
		// follows cursor a-la nuke
		if(fork())
		{
			while(instance_exists(self)
			&& DIGGER > 0)
			{
				if(!place_free(x+hspeed, y+vspeed))
				{
					with(instance_nearest(x+hspeed, y+vspeed, Wall))
					{
						instance_create(x, y, FloorExplo);
						instance_destroy();
						other.DIGGER -= 1/4;
					}
				}
				wait(1);
			}
			exit;
		}
	}
}

#define draw
if(global.DEBUG)
{
	with(projectile)
	{
		if("creator" in self)
		{
			if(creator != noone
			&& instance_exists(creator))
			{
				draw_set_color(image_blend);
				draw_line(x, y, creator.x, creator.y);
				draw_set_color(c_white);
			}
		}
	}
}
with(Player)
{
	if(visible
	&& !instance_exists(GenCont)
	&& "aprefixes" in self)
	{
		var _intensity = 0;
		for(var i = 0; i < aprefixes; i += 1)
		{
			_intensity = min(1, _intensity+0.1);
		}
		
		draw_sprite_ext(weapon_get_sprite(wep), 0, x, y, image_xscale, right, gunangle+wepangle, c_black, _intensity/2);
		
		d3d_set_fog(1, make_color_hsv(global.timer*(_intensity*50), 255, 255), 0, 1);
		draw_set_blend_mode(bm_add);
		var _passes = 8;
		for(var i = 0; i < 360; i += 360/_passes)
		{
			draw_sprite_ext(weapon_get_sprite(wep), 0, x+lengthdir_x(3, i+global.timer*2), y+lengthdir_y(3, i+global.timer*2), image_xscale, right, gunangle+wepangle, make_color_hsv(global.timer*(_intensity*50), 255, 255), _intensity/4);
		}
		draw_sprite_ext(weapon_get_sprite(wep), 0, x, y, image_xscale, right, gunangle+wepangle, make_color_hsv(global.timer*(_intensity*50), 255, 255), _intensity);
		draw_set_blend_mode(bm_normal);
		d3d_set_fog(0, 0, 0, 0);
	}
}
draw_set_valign(2);
draw_set_halign(1);
for(var i = 0; i < 3; i += 1)
{
	if(instance_exists(global.prefixer[i])
	&& global.prefixer[i] != noone)
	{
		with(global.prefixer[i])
		{
			if(showing
			&& global.prefixer[i].prefix != -1)
			{
				draw_sprite(sprEPickup, 0, x, y-32);
				//var _text = "ENCHANT:#" + global.prefix[global.prefixer[i].prefix];
				var _text = "ENCHANT " + weapon_get_name(instance_nearest(x, y, Player).wep) + "#WITH " + global.prefix[global.prefixer[i].prefix];
				draw_set_color(c_black);
				for(var j = 0; j >= -90 j -= 45)
				{
					draw_text(x+lengthdir_x(1, j), y-48+lengthdir_y(1, j), _text);
				}
				draw_set_color(c_white);
				draw_text(x, y-48, _text);
				draw_set_color(make_color_hsv(global.timer*8, 255, 255));
				draw_text(x, y-48, "     " + global.prefix[global.prefixer[i].prefix]);
			}
		}
	}
}
draw_set_valign(0);
draw_set_halign(0);

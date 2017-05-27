#define init
trace("Sky Bombs | Commands:");
trace("- '/bombmode' Swap Between The Different Modes.")
trace("    * 'Wimp' - Mini Grenades");
trace("    * 'Easy' - Grenades");
trace("    * 'Normal' - Rockets (Default)");
trace("    * 'Hard' - Nukes");
trace("    * 'Weapon' - Uses Player's Weapon");
trace("- '/fastbombs' Faster Falling Bombs (Off By Default)");
trace("    * Doesn't Work On 'Weapon' Mode");

global.bombmode = "normal";
global.fastbombs = 0;
global.bombtimer = 0;

#define step
if(!instance_exists(GenCont)){
	if(global.bombtimer <= 0){
		with(Player){
			var bombtargetx = x + random_range(-150, 150);
			var bombtargety = y + random_range(-100, 100);
			if(!place_meeting(bombtargetx, bombtargety, Floor)){
				with instance_nearest(bombtargetx, bombtargety, Floor){
					bombtargetx = x;
					bombtargety = y;
				}
			}
			switch(global.bombmode){
				case "wimp":
					var bombtype = MiniNade;
					global.bombtimer = 10 + random(5);
					break;
				case "easy":
					var bombtype = Grenade;	
					global.bombtimer = 20 + random(10);
					break;
				case "normal":
					var bombtype = Rocket;
					global.bombtimer = 40 + random(20);
					break;
				case "hard":
					var bombtype = Nuke;
					global.bombtimer = 60 + random(30);
					break;
				case "weapon":
					global.bombtimer = weapon_get_load(wep) * random(5);
					break;
			}
			if(global.bombmode != "weapon"){
				with instance_create(bombtargetx, bombtargety, bombtype){
					with instance_create(x, y, CustomObject){
						name = "bombshadow";
						sprite_index = shd64;
						image_alpha = 0.5;
						creator = other;
					}
					depth = -12;
					targety = y;
					mask_index = mskNone;
					rot = random_range(-20, 20);
					bombfallheight = 80 + random(40);
					alarm0 = bombfallheight;
				}
			}
			else{
				player_fire_ext(270, wep, bombtargetx, bombtargety, -1, self);
			}
		}
	}
	else{
		global.bombtimer -= 1;
	}
}
else global.bombtimer = 120;

with(projectile) if("bombfallheight" in self){
	y = targety - (bombfallheight * 5);
	speed = 0;

	if(global.fastbombs){
		bombfallheight -= max(16 / sprite_get_width(sprite_index), 2);
		if("active" in self) active = 1;
		direction = 270;
	}
	else{
		bombfallheight -= max(8 / sprite_get_width(sprite_index), 1);
		if("active" in self) active = 0;
		else{
			if(random(3) < 1) instance_create(x,y,Smoke);
		}
		direction += rot;
	}
	image_angle = direction;

	if(bombfallheight <= 0){
		instance_destroy();
	}
}
with(CustomObject) if("name" in self && name = "bombshadow"){
	if(!instance_exists(creator)){
		instance_destroy();
	}
	else{
		y = creator.targety - (6*image_yscale);
		x = creator.x;
		image_xscale = min(0.5, 15 / creator.bombfallheight);
		image_yscale = min(1, 30 / creator.bombfallheight);
	}
}

#define chat_command
if(argument0 = "bombmode"){
	switch(argument1){
		case "Wimp":
			trace("Sky Bombs | Wimp Mode Activated!");
			global.bombmode = "wimp"
			break;
		case "Easy":
			trace("Sky Bombs | Easy Mode Activated!");
			global.bombmode = "easy"
			break;
		case "Normal":
			trace("Sky Bombs | Normal Mode Activated!");
			global.bombmode = "normal"
			break;
		case "Hard":
			trace("Sky Bombs | Hard Mode Activated!");
			global.bombmode = "hard";
			break;
		case "Weapon":
			trace("Sky Bombs | Weapon Mode Activated!");
			global.bombmode = "weapon";
			break;
		default:
			trace("Sky Bombs | " + string(argument1) + " Mode Does Not Exist :(");
			break;
	}
	return true;
}
if(argument0 = "fastbombs"){
	if(global.fastbombs){
		trace("Sky Bombs | Fast Bombs Mode Disabled!");
		global.fastbombs = 0;
	}
	else{
		trace("Sky Bombs | Fast Bombs Mode Enabled!");
		global.fastbombs = 1;
	}
	return true;
}
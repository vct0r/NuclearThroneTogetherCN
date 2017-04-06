//bow
#define init 
global.bow = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAB3RJTUUH4QMaACY4ghSUFgAAABd0RVh0U29mdHdhcmUAR0xEUE5HIHZlciAzLjRxhaThAAAACHRwTkdHTEQzAAAAAEqAKR8AAAAEZ0FNQQAAsY8L/GEFAAAABmJLR0QASABvAKgKRg8wAAAAhElEQVR4nGOwS53IQEtMU8MHlwVA8B+EaWqBvaQwyZaQ5hqg4fH6aiRZQrIFpPqCiYEMAPQFw6HZ+f+JUUuWBSQBUoPIJywWjBmIDCaSLcipagFjmlkw6gOqW0ByMv18eBuD8M2TRKsffPmA1KKCZAtoVtiR43qSLSDVcJKDiBw89C0AAKV4UHUiPqkdAAAAAElFTkSuQmCC", 1, 6,12)

global.bow2 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAB3RJTUUH4QMaFygJVCAMVwAAABd0RVh0U29mdHdhcmUAR0xEUE5HIHZlciAzLjRxhaThAAAACHRwTkdHTEQzAAAAAEqAKR8AAAAEZ0FNQQAAsY8L/GEFAAAABmJLR0QASABvAKgKRg8wAAAAiklEQVR4nGOwS53IQEtMU8NHLRi1YNQCLBYAwX8QJtswLPoxFNhLCv+HKSTGMmS1ML14gwikIF5fDawY3TJsGKYOpAebg3C6CqQBZpFPWCwY51S1oNAwg3EZDsJMDFgAUIJx4cVbDCCsICaMIqegoo5gA+Vg6kB6sJlFdMThwoMrmY5aMGrB4LQAABL0qHQS9sGdAAAAAElFTkSuQmCC", 1, 9,14)
global.arrow = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAADAAAAAQCAYAAABQrvyxAAAAB3RJTUUH4QMaAgIf1XIUtQAAABd0RVh0U29mdHdhcmUAR0xEUE5HIHZlciAzLjRxhaThAAAACHRwTkdHTEQzAAAAAEqAKR8AAAAEZ0FNQQAAsY8L/GEFAAAABmJLR0QA/wD/AP+gvaeTAAAArUlEQVR4nGNwaGBgGMoYTPwHAlI1kqOHZh6AOej/fwYUR/2HAlQxBgyxQeIBuHv/o7KxiTEMPg8ghzghMNCOxuMBTD8wYPiLtNAH6YdhbHxyzCIpBjA9QFoMgPTH66uBMcwByHxSzcqpakHRh9PxyCFFDU9QC4M8gOyJIecBI0s7MMbwwFBJQsiOHxmZGBsg1WJaYhyhPwQrMmwOwxbig7IpQY6DBosnBtwBlGIALfO9ec5jHkEAAAAASUVORK5CYII=",2,8,8)

#define weapon_laser_sight
return false

#define weapon_name
return "BOW"; // Name

#define weapon_type
return 3; // 

#define weapon_cost
return 0;

#define weapon_area
return 0;

#define weapon_load
return 10000;

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_sprt
if !instance_exists(Player)
	{
	return global.bow;
	}
with(Player) if wep != "bow" if bwep != "bow"
	{
	return global.bow;
	}
with(Player) if race_id != 7
	{
	if wep = "bow"
		{
		return global.bow; // Wep Sprite
		}
	else if wep != "bow"
		{
		return global.bow2;
		}
	}
with(Player) if race_id == 7
	{
	return global.bow;
	}
#define weapon_text
return "YOU GUYS SUCK"; // Loading Tip

#define weapon_melee
return 0;

#define weapon_fire
if ammo[3] > 0
	{
	sound_play(sndCrossReload)
	bowcharge += 1
	bowsound = 0
	}
if ammo[3] <= 0 
	{
	reload = 5
	}
on_draw = script_bind_draw(drawarrow,1)

#define step
if ("bowcharge" not in self)
	{
	bowcharge = 0
	bowsound = 0
	}
if bowcharge < 25 if bowcharge != 0 if ammo[3] > 0
	{
	bowcharge += 1.5
	}
if bowcharge >= 25 if bowsound == 0
	{
	bowsound = 1
	sound_play(sndCrystalTB)
	}


if ("bowcharge" in self) if (button_released(index, "fire")) if bowcharge > 0 if wep == "bow"
	{
    with instance_create(x,y,Bolt)
		{
		sprite_index = global.arrow
		bowbolt = 1
		team = 2
		creator = other
		force = other.bowcharge
		direction = other.gunangle
		image_angle = direction
		speed = (other.bowcharge)
		friction = 1 - (other.bowcharge/50)
		sound_play(sndCrossbow)
		damage = other.bowcharge
		other.reload = 0
		}
	other.bowcharge = 0
	other.ammo[3] -= 1
	}
if ("bowcharge" in self) if (button_released(index, "spec")) if bowcharge > 0 if bwep == "bow" if race_id == 7
	{
    with instance_create(x,y,Bolt)
		{
		sprite_index = global.arrow
		bowbolt = 1
		team = 2
		creator = other
		force = other.bowcharge
		direction = other.gunangle
		image_angle = direction
		speed = (other.bowcharge)
		friction = 1 - (other.bowcharge/50)
		sound_play(sndCrossbow)
		damage = other.bowcharge
		other.breload = 0
		}
	other.bowcharge = 0
	other.ammo[3] -= 1
	}
with (Bolt) if ("bowbolt" in self)
	{
	if speed <= 1
		{
		with instance_create(x,y,Debris)
			{
			speed = 1
			direction = other.direction
		//	rot = 0.1
		//	fall = 4
			sprite_index = global.arrow
			image_index = 1
			image_speed = 0
			arrow = 1
			image_angle = other.image_angle
			
			}
		instance_destroy()
		}
	}
if ("bowcharge" in self) if wep != "bow" if bowcharge > 0 if race_id != 7
	{
	bowcharge = 0
	breload = 0
	}
if ("bowcharge" in self) if wep != "bow" if bwep != "bow" if bowcharge > 0 if race_id == 7
	{
	bowcharge = 0
	reload = 0
	breload = 0
	}
#define drawarrow
with(Player)
if ("bowcharge" in self) if(bowcharge > 0)
		{
{
	draw_sprite_ext(global.arrow, 1, x-lengthdir_x((bowcharge/10), gunangle), y, 1, 1, gunangle, c_white, 1)
}
}
//medigun
#define init 
global.medigun = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAOAAAAAYCAYAAADj7PGVAAAAB3RJTUUH4QMYAQIWBOHawwAAABd0RVh0U29mdHdhcmUAR0xEUE5HIHZlciAzLjRxhaThAAAACHRwTkdHTEQzAAAAAEqAKR8AAAAEZ0FNQQAAsY8L/GEFAAAABmJLR0QASABvAKgKRg8wAAACJklEQVR4nO2WQU4DMQxF5xZIsGeD2LLkAlTcgCVH4QA9cVFAhsiKHaed+LfKt/Q1SDPM+9/jJN1eP48bRVEYwQ1Q1MqCG6ColQU3QFErC26AolYW3ABFrSy4AYpaWfaNbTuJEMZOVUEaA86P5rP/OXzXwP3d49IDgMyP5rP/OXzXALIJJ1WID4DOj+QX5sr9z+KHjDw/vfwdx/po9o7q1vOj0gtRD4U3JHssYnR+NN/qPTp/5Puj+x+ZPxdcS0yUa9GhcU+r7B7y/GgDvIV3bo02/lryI/h62FuVxbfye5XB9/JH58+Fvr99/IQ4VCA5ksvfXw+/IctzLaNyT+4jFl2vAZqPzN8b9gy+ld+qLL6V36sMvpc/Mn/dVS8GylV2FLmKAYHKM5t6ProDRRfSuRXlo/L3TpwsvpXfqiy+ld+rDL6Xvzd/rhl5iRjY1PXQgNY/P279J+g15s/iW/mtyuJb+b3K4Hv5vfkL7wY1rD6WNbi1i9ziApShQuXvnYQZfCu/VVl8K79XGXwvvzV/XROWoZZ6IUYaIItgZEH2FvElfET++n8iwz6Tr98V6f9MfiT/pd8/Y/5Du0DP1GiwkQWgG9dalJn8zPyt97c2hUx+a1NA8dH59+CHTVhmZjag/sjWYpw5ADUDlV+fONpbFt/KP7v/6Pmbzd/N3MwmWLrk58XeHweZH8WvN4cV+78HP900RVH/ghugqJUFN0BRKwtugKJW1jduxbiu2TIlwgAAAABJRU5ErkJggg==", 7, 8,12)

#define weapon_name
return "MEDI GUN"; // Name

#define weapon_type
return 5; // 

#define weapon_cost
return 0;

#define weapon_area
return 5;

#define weapon_load
return 1.5;

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapEnergy; // Swap Sound

#define weapon_sprt
return global.medigun; // Wep Sprite

#define weapon_text
return "OKTOBERFEST"; // Loading Tip

#define weapon_fire
if ammo[5] > 1
{
sound_play_pitchvol(sndDevastator,.5,0.05); // Sound
weapon_post(0, 0, 0);

with instance_create((x+lengthdir_x(14, gunangle)),(y+lengthdir_y(14, gunangle)),CustomProjectile)
	{
	on_step = script_ref_create(healprojectile)
	}
}
#define healprojectile
if ("start" not in self)
	{
	start = random_range(20,30)
	team = 1
	creator = instance_nearest(x,y,Player)
	target = instance_nearest(mouse_x[creator.index],mouse_y[creator.index],Player)
	on_hit = script_ref_create(healprojectilehit)
	force = 0
	direction = creator.gunangle + random_range(-5,5)
	sprite_index = sprCaveSparkle
	fancytrail = random_range(9,11)
	image_blend = player_get_color(creator.index)
	}
if fancytrail <= 0
	{
	if collision_circle(x, y, 50, target, false, false)
		{
		start = 100
		direction = point_direction(x,y,target.x,target.y)
		}
	}
motion_add(direction, 1)

if speed > 5
	{
	speed = 5
	}

if fancytrail > 0
	{
	fancytrail -= 1
	}
if start > 0
	{
	start -= 1
	}
if start <= 0
	{instance_destroy()}


	
#define healprojectilehit
	if place_meeting(x, y, target) 
	{
	if target.index != creator.index
		{
		if target.my_health < (target.maxhealth*1.5) if target.canbehealed <= 0
			{
			target.my_health += 1
			creator.ammo[5] -= 1
			if !skill_get(9)
				{target.canbehealed = 15}
			if skill_get(9)
				{target.canbehealed = 5}
			target.overheal = 80
			sound_play(sndBloodlustProc)
			}
			instance_destroy()
			}
		else
		instance_destroy()
	
	}

#define step
	with Player
	{	
	if my_health > maxhealth if overheal <= 0
		{
		my_health -= 1
		overheal = 50
		}
	if ("canbehealed" not in self)
		{
		canbehealed = 0
		}
	if canbehealed > 0
		{
		canbehealed -= 1
		}
	if ("overheal" not in self)
		{
		overheal = 0
		}
	if overheal > 0
		{
		overheal -= 1
		}
	}
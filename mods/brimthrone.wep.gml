#define init
global.sprBrimThrone = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAABmJLR0QAQgBXAJhMV5MVAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QIaEzs7x3GdKQAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAAEl0lEQVRYw+1YUUhbVxj+0s6RBVYTNTfY3BchyxrjCgnkYc0e1mQPSWATsbpipY6VvmwiCjMPxccSRnQow6UvNZuM7aUrW1/0ZdExSDcIpGKNyVwgSOMktnqLBSstevcQz9k9994kV20Hg/1wIP89J+f/7/9///+dc3U4uoiS3zoVXesaRk4c1RmvP4hoLI6+/mFVXeOaFyJiNBYXjQ1NotcfFOW62jO1NeT5sZ1xujyMIbmudY1kMPLKETGDZGIW1fQqa3QvLFULmZzY1z+s9pZV56pFRC66wwLZ5mhDPrsEAKi/vwg7bwEApEwWZq4Xz/CHIAAA5vIFcLN1eLWjDjMba1XtHqbKdMnELKYnR+ERSvjqy3FmshfPYLqbUMzN5Qvg9Qb87N3QZuQovWfQ7db8B+LQZ+ubGGturBmhiqBeyOTw6cCQFJhiiLMCAFaKJbquuLuDxW0BZK64uwOfrUWxn+/kLkJc7RdQpMzp8gAAxm9MweZoo858M3QZ5u4e7K9vMuO08BTRWBzm7p7qkdrTK+wQWxUdisbiWFstwNjQhOnJUUxPjtK5jTfexfm6EsIAMwAgs5wFAOTNjVjcFlQd8p3cZfS11QLWVguIxuLqDnn9QURGwnC6PHi89UixYWY5i/nnFkQBZgDA+boSTHcT0D94gLOnTJoi9HjrEZwuDyIjYXj9QSWoo7E47ty+pdrgpGX/JPU7eL0Bxd0d8HoDxQ2vN8DOWyiIpRgDAJ+tBSvFkgLUXn8Q7Z1dCH/yMQvqzHIWycQszWvmXkrRnT1CCRPbAny2FtgBBMIBOhe4GMH7b52BcNlfxkirA3du38LrBx2aLxoYZ4idZGJWilW2/KKxOCIjYZIyMcRZsR/ZYcJkHLNge+sJ7LwF76TLcxeQQ4izwnzhQzjbypv/lkzix++mYGxogtPlobQx6HZjIp2GsaEJAHDtepRGhxGvP0gXkRQFbprEEGcVQ5xVDOzp6e8QZxUH3W7xB5yhgzD6TOJXsePSFYYuZMSKhUyOsSnFEAV1e2eXahkCwP76Jk40N1YsaRIhrTJ+Y4qmy+nyoL2zS9kYSekyJXjNUE7Z16/R1JGUqUlmqcxjb3u9AKCaMq8/yLQTuW2dFqogIqeMiXQaP13vh952CoGLEQy63RDOsaAmkQhxVlVQHxSPJlC/1LKvBGrVxqgSEbGvfxhXz5pxWnhKKYPQR+/nX8Dc3cNwnJ230KMJrzfgg9SypsaoALW0MU6k0/9wT6sD888tmqiDOFKNOjSBWqUxUvnr5iRwzk/pgiHKVge4P3/Bw4ebsB1U21y+wLD+3J4eY81KEtfUGElI5RhSK+1Kx4+VYonB1MzGGgPsShhiOCVzL8WkTbJB1QMaMa6mVzugqdmsiiGZM4x89O33FMSkkohE5hN402Q6Poa0HvJT2SWkBoZQT4zZWphDfmpgCPX3c7DzFvhsLZjLF/BekgM61DeuaFtafv/WNaiGzZpdm5Kl9JYqN0puqhX0w52pa91QSLlK30zO2JXe/kA/1MXxP/exQQpwMRqLU9zIdY1rjn1RfOkfrP6XWvI3JQog0lTjvwMAAAAASUVORK5CYII=",16,16);

while instance_exists(self){
	with(NothingInactive) if("madebrimthrone" not in self){
		madebrimthrone = 1;
		with instance_create(x,y - 50,WepPickup){
			wep = "brimthrone";
			depth = 1;
		}
	}
	with(Player){
		if("chargefinished" not in self) chargefinished = 0;

		 // Mini Charge Up Visual:
		with(NothingBeamChargeParticle) if("chargeplace" in self && "creator" in self){
			 // Keep In Motion With BrimThrone Weapon:
			chargetargetx = creator.x + lengthdir_x(8,creator.gunangle);
			chargetargety = creator.y + lengthdir_y(8,creator.gunangle);
			x = chargetargetx + lengthdir_x(chargedist,chargeplace);
			y = chargetargety + lengthdir_y(chargedist,chargeplace);
			motion_set(creator.direction,creator.speed);
			image_angle = point_direction(x,y,chargetargetx,chargetargety);
			chargedist -= 1;
			
			 // Destroy Once Close Enough:
			if(distance_to_point(chargetargetx,chargetargety) = 0) instance_destroy();
		}
		
		 // Mini Beam:
		with(CustomObject) if("name" in self && name = "minithronebeam" && "creator" in self){
			 // Beam Direction:
			if(creator.wep = "brimthrone"){
				beamdir = creator.gunangle;
				wkick = 3 + skill_get(17);
				creator.wkick = wkick;
			}
			else{
				beamdir = 90 + (15 * creator.right);
				wkick = 0;
			}

			 // Keep In Motion With BrimThrone Weapon:
			x = creator.x;
			y = creator.y;
			image_angle = beamdir + 90;
			
			 // Beam Start & End Coordinates:
			beamstartx = x + lengthdir_x(17 - wkick,beamdir);
			beamstarty = y + lengthdir_y(17 - wkick,beamdir);
			beamendx = beamstartx + lengthdir_x(beamdist,beamdir);
			beamendy = beamstarty + lengthdir_y(beamdist,beamdir);	
			
			 // Wall Collision:
			with(collision_line(beamstartx,beamstarty,beamendx,beamendy,Wall,0,0)) other.beamdist = distance_to_point(other.beamstartx,other.beamstarty);
			if(!collision_line(beamstartx,beamstarty,beamstartx + lengthdir_x(beamdist + 10,beamdir),beamstarty + lengthdir_y(beamdist + 10,beamdir),Wall,0,0)) beamdist += 30;
			
			 // Wall Collision Effect:
			repeat(skill_get(17) * 2) with instance_create(beamendx + lengthdir_x(random_range(-8 + (skill_get(17)*-4),8 + (skill_get(17)*4)),image_angle), beamendy + lengthdir_y(random_range(-8 + (skill_get(17)*-4),8 + (skill_get(17)*4)),image_angle),NothingBeamHit){
				image_angle = other.image_angle;
				image_xscale = 0.4;
				image_yscale = image_xscale;
				depth = -5;
				with instance_create(x,y,Dust){
					image_xscale *= other.image_xscale;
					image_yscale = image_xscale;
				}
			}
			
			 // Beam Particles:
			if(random(3) < 1) with instance_create(x,y,NothingBeamParticle){
				image_xscale = 0.35;
				image_yscale = image_xscale;
				creator = other;
				image_angle = point_direction(creator.x,creator.y,x,y);
				xbeamoffset = lengthdir_x(random_range(-7 + (skill_get(17)*4),7 + (skill_get(17)*4)),creator.image_angle);
				ybeamoffset = lengthdir_y(random_range(-7 + (skill_get(17)*4),7 + (skill_get(17)*4)),creator.image_angle);
				chargedist = 0;
				distadd = 5 + random(3);
				depth = -5;
			}
			
			 // Hurt Enemies:
			with(collision_line(beamstartx,beamstarty,beamendx,beamendy,hitme,0,0)) if(team != other.team && sprite_index != spr_hurt){
				 // Sound:
				sound_play(snd_hurt);

				 // Invincibility Frames:
				image_index = 0;
				sprite_index = spr_hurt;

				 // Damage Enemy:
				my_health -= other.damage;
			}
			
			 // Sound & Beam Dissipating:
			if(beamtimer <= 0 && beamloops < 2){
				sound_play(sndNothingBeamLoop);
				beamtimer = 75;
				beamloops += 1;
				if(beamloops > 1){
					sound_stop(sndNothingBeamLoop);
					sound_play(sndNothingBeamEnd);
				}
			}
			else beamtimer -= 1;
			if(!instance_exists(creator) || creator.wep != "brimthrone" && creator.bwep != "brimthrone") beamloops = 2;
			if(beamloops > 1) image_xscale -= 0.075;
			if(image_xscale <= 0) instance_destroy();
		}
		
		 // Mini Beam Particles:
		with(NothingBeamParticle) if("chargedist" in self && "creator" in self){
			 // Keep In Motion With BrimThrone Weapon:
			if instance_exists(creator){
				image_angle = creator.beamdir;
				x = creator.x + lengthdir_x(chargedist,image_angle) + xbeamoffset;
				y = creator.y + lengthdir_y(chargedist,image_angle) + ybeamoffset;
			}
			else motion_set(image_angle,distadd);
			chargedist += distadd;
			if(!place_meeting(x,y,Floor)) instance_destroy();
		}
	}
	wait 1;
}

#define weapon_name // Name
return "BRIMTHRONE";

#define weapon_type
return 5; // Energy Wep

#define weapon_area
return -1; // Doesn't Spawn Normally

#define weapon_cost
return 20; // 20 Ammo

#define weapon_load
return 150; // 5.00 Seconds

#define weapon_swap
return sndSwapDragon; // Swap Sound

#define weapon_fire
 // Sound:
sound_play(sndNothingBeamWarn);

 // Charge Up:
repeat(10) if(instance_exists(self)) with instance_create(x,y,NothingBeamChargeParticle){
	chargeplace = random(360);
	chargedist = 25;
	image_xscale = 0.35;
	image_yscale = image_xscale;
	creator = other;
	wait 2;
}
wait 20;

if instance_exists(self){
	sound_play(sndNothingBeamStart);
	with instance_create(x + lengthdir_x(14,gunangle),y + lengthdir_y(14,gunangle),CustomObject){
		name = "minithronebeam";
		team = other.team;
		damage = 10 + (skill_get(17)*5);
		depth = -4;
		beamdist = 0;
		beamtimer = 0;
		beamloops = 0;
		image_xscale = 0.4 + (skill_get(17) * 0.2);
		creator = other;
		script_bind_draw(beam_draw, depth);
	}
}

#define beam_draw
 // Draw Throne Beam:
with(CustomObject) if("beamendx" in self){
	draw_sprite_ext(sprNothingBeamStretch, 0, beamendx, beamendy, image_xscale, point_distance(beamstartx,beamstarty,beamendx,beamendy)/10, image_angle, c_white, 1);
	if(beamloops < 2) draw_sprite_ext(sprNothingBeam, -1, beamstartx, beamstarty, 0.4 + (skill_get(17) * 0.2), 0.4, image_angle, c_white, 1);
	else draw_sprite_ext(sprNothingBeamStop, 7 - (image_xscale / 0.0572 + (skill_get(17) * 0.0286)), beamstartx, beamstarty, 0.4 + (skill_get(17) * 0.2), 0.4, image_angle, c_white, 1);
}

#define weapon_sprt // Wep Sprite
return global.sprBrimThrone;
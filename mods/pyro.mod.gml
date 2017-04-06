#define init
global.sprPyroIdle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAeAAAAAgCAYAAADKS6uVAAAESUlEQVR4nO3dP2gbVwDH8Z/6BxlKMRg3GEHRny4tlBqXFoMhqU1bKPZQdeqqzKbQTOmgwYOHetJQNBbf2k0d6mQQROlg8CQ0tUsld3FKWgoZCjYdroPy5LvTnXS17vRi3/cLh+N3Rz6n9wQXSSciERERERERERERERERERERERERERERkZVcs91+z67/xW0rvvVemAXAx8fHv0n+5t7w56tvrPmsGNvc/H8eDrc0/Em9/PqbCvHnXbrPP9sLgI+Pj59V32svbjVDN+Ob39P0b90d+Davb8aS9KfNv9fXNVv/V+Ic1Nkb4v/+2XUXt5rKl7Z9+y9OjyTtSpJu3R1Ikp4eluP81bHCx8fHz6rvtSVF+Ardl4bvdc/u76pw0Bwbe+0wOT9q/i/9y2MXt5pD/7P0fdMs6/9SnIMmLcDgy/LUsVnDx8fHz6ofZr8I/ryKmn/bfhLzH+sCbHsB8PHx8bPqZz3b85+mH+sCTERE5C1f2lb5h8HUsZvqJ9FMF2DbE4CPj4+Pb8cPmvN2L06PRp9/Fw6aKhw0fWNpl8T8x7oJ6yonMs/w8fHx8f0trxT11x+/J+5tuN9LklrOvm+8WqsHx11JucRPwJxDMXp/Kw00olnW/0oX4KeHZVVr9bEFkBQcT2UB8PHx8TPiu5J0PjjSQnl49625AE5seB6p+KaYc5B4tv8BkOT6x3kLerQA3lrO/ugBxxmfIXx8fPys+qrW6vr5x+90PjgaO48Yzfx92KDvvfB4H2vE+Kz+2PwbJzjPUeNJ+6YoJ+n1d6u1unvS67v50o6bL+34vmxcrdVDv5gcGMfHx8fHv6LfcNruSa/vnvT6brVW923efebPZl8avvcxzssPm/9pvlJe/8BjnDQeWZyX5261VtdHm5vaWKtIktZXK74DGk57tO+429fGWkXrqxXvy/FZ3gbAx8fHz6T//HNcN1/a0bd79yKPC/rH3b4edzrX3lfI/B93+1b9JNd/6mfAyyvFXMvZdx90uqMFaDjtqWfdcNp63OlMPQ4fHx8fPzzvTVTf7DUkaeKF0FvL2Veh9E7u7PSXa+uHzf88S3v9p16AbS8APj4+flZ9ScotLOUuTn9y86Ud33mYm6LO7u9KT4bHvrsiFb5u6tmjXb319mrut197M9m2/bD5N03yt4pPrsX6x3ppnltYknv+92gBTL4J8FQ4SPwJgI+Pj59J/3mjt4E31iq68/lXY3cle3v2aFdK9g5ga/5V5395pZhL4mtYaa7//5mgzD4B8PHx8W365iJw0ht+/hn8HNJbw2nrXu2TG+Ur4+uv3MKSJI3dCRe2NZx2Enef4ePj4+NfFvTH9jec9o30bc+/Vd/8f4jmBCS573+wHnboCF/98A4+Pj4+fgr+x59uh+7Pim97/ufp+05Ansk348H9ieL4+Pj4+PgZ9YmIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIgo0/0HfYuy/x51fB8AAAAASUVORK5CYII=",15,16,16);
global.sprPyroWalk = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAMAAAAAgCAYAAABEmHeFAAAE0klEQVR4nO2aP2gbVxzHvyotMngQlNQYL5a0hEKocWkxGOpaNC3BHqItY85ZTaCakoIGDR6SSUPRGKK1mzvEyWCw0sHgSXjqJimLE5oQyBCIyPA63P1O7+7e3b2T3t35z+8DD8vvzvf9/X7v93vv3bMAhmEYhmEYhmGuEoW8DWAuDUL6fGHy6ou8DTCEoPbTd1dSP1U2W/bPr75ZBSRffQ0fX9hN7ssQjy2XCp0B+PjCbsgnEH59o/j8B8KTMDX/KfalWkeUah2xsDP0tFKt48ZgYWeYSwFMMwZaK0DeA9Br2dqf3/ZFqdbBws7Q00q1jnsv9ZkkrgBlfYfU/Cc9VaMZ2LT/cuz9jEcHGN6pBPqllWBmdCbAkDGI5Uudm3wDAFUgzh7sAgCWHtvXPhzt6jxai7ABGI8OcPZg19WU++afGpMPFGCxvOXTn9xbqnVs/Vvm9FX+kw3EeHRgTtBHWPJnhT/+ACLHYGFniOGdCuZvQSDmfUSrAMLECTn4/msmyHsAombALIjSVk0CgD0D6yTARSDN+GttgZIsf2FL4kUm7wI8zxTLW6j8FdxyOSugkeJLM/4X+hRIFfywAbmM+szsBai1BTrv5J10eepPtL3vACZnYJlPQ1untvwaALDf3ZtoHgF1q4l1PMG+3XXut2C6xsW+gNFLMCXCf08rSZ6fSP/D0S7qVtMTfELRb8KGxEuwcwhg3H9KwLlK9LuWaf1ieRtzlS1Xfzx6hrrVBIDAOPj6U4k/FWAUBvUn57+lWkcAEHWrqTyOUvTPrA17ADz6CWwwQZ7+A5L/xfK2KJa3XS2VHb5+I/rt7qFodw89+nE2mNSn2JO+pu9G9PNOQFG3muLkdBAIfkY25O0/4CSgKgZZJSAVwMnpQJycDjxa/mv02aR+WhOAzvIg6lYTfzTuYeP2fQD28kdobkVmWYZE3Wri581NrK9WAQBrK1XPDe3uoXvtuD/A+moVaytV2YaZ9XP0H7CTDACUMfBfk2NgQBtwtkCPWo3Im1LSF8DEx4etNoDJGERtw3Tir10AeSXgtcVlvHvzKnYA/PrH/QFe9nrGCiDHAgTyTUBXX0ZlSxYFMMUEEGlD7CnQtcXlwn53Tzzv9V2nSTCKdvcQL3u92PviePfmlfuZqj8uEYj97h6Wyt8Wzkb/Tq2ft/8y5D+gHwNDFMajZ24R/PP3n+6F335/DsD5JoDzXnpjEZhfsf/OhDYA8bDVxqNWA8f9AQC9MdB9uA6eGUCn+o/7AzSsmzMnIAAU5r6G+PQ+MAvRSQidQBFLjzto3b0OAGhYNwFDMzCRtf9+G0ITUCKFY1ClvmyDTBqnUERY8U+zAmkZOE0CSt8FMrIEA96tBqAOPGG4AABnEGjwZe0MCjCgT4TFwHACujbIv5yc2rOxf0sokUoBAt4ivPE6qK87ASQx0N2Hrq9WsXH7fuRZdOvudaODT8EmIoKuwrgNUf5T8gNGCwBwEjAq8WhrYFhXaYdEFv/sCi2ADFYgexWAnQTKozC50bEYDB2DOV+H9Wh8/8OaiUcnIdTfsGYyBiF2BK6lpJnEhqx0I3PQqG30fWyFaJyRlwLJ/yTkmSBXgex8lQsAgPjl1y1Pvz9BVn7cyMIshmEYhmEYhmEYhmEYhmEYhmGi+R93Iyelp5dHhQAAAABJRU5ErkJggg==",6,16,16);
global.sprPyroHurt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAgCAMAAADaHo1mAAAAOVBMVEUAAAAAAAD1uAAPQZUWYd9QYHwHIEvJ0d6PoLz///8KKV8HIEsHHD9oTgADDiAEFC89RFBVWV4KKV+mPvGqAAAAE3RSTlMA////////////////////////Pj/cLQAAAOVJREFUSIntlcEOgyAQRFnAhf3/H+5CjRhZGNKTSZmDNb4wT8Giczt/GBGZciL6mUvLaKzG+1EH4gIEFKImeB+jWYC4AAGFUIZrQfBWAeICBDp+WoD4WwTjOUZ8WVAzEYz4Q9AbSkHDfcPJ9RWtR9TfCYh4Krj4aYCCp4GOxHwTPBsqp8vQPwIW5JTKdf3JSY5eoKBUD/jCHHH+phTkvgBxvMjM3AqMRQZ8YavQBl1IrwnmVgE4/iNwTlpQY90h4guGsoo1OhGWAXDXaseC88zc8RFf+Jglc9gyd6DfgY8l5Ds7L80HFvIQjGJ2Au8AAAAASUVORK5CYII=",3,16,16);
global.sprPyroDead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAMAAAAAgCAMAAABzRoe3AAAAOVBMVEUAAAAAAAD1uAAPQZUWYd9QYHwHIEvJ0d6PoLz///8KKV8HIEsHHD9oTgADDiAEFC89RFBVWV4KKV+mPvGqAAAAE3RSTlMA////////////////////////Pj/cLQAAAdtJREFUWIXtlw9vgyAQxT2x/JkxYL//h90d2KJycO0WsmzzJdqmr8L7AQdxGC5duvTH5Jxr+gDwLb+nXBbrQ9Q41jJKfm85AQDUhFLjOE1sQMnvLScAgFIUDwOqkQso+b3lBADM1wwo+d31TwDqa1zyu+tVgKgGQM3vLicQUMBslwk3H7fQeJe6avnQ2ofhoXb+ogMA3QR4+htBK7x41uBYVBgA7pskgHPzcDNa7wDOz0cfngSVIRSW6QDbXlyrI5jnGcPPy/IFAGsM/Y4f1rhbCYAGRa/4TB9sfDU1ACDG5wHkNaRtEgW0ZUDJf6EHazE/MhAALqIyfyAAvBBglgDKp7XWOSDTuuC/MMnWEACdI/EqxygBLBFgaRMw/VNCHUdnZEZH9iUAnIA2APg3ALiDQFujVRI3wpJf5H8PAPcGH9YWgExAVRqFC4UjaPll/GMXEGvIPA5zLOJDEwDB+wSQivhjDuwUnL+dAz5HowJQ8bn4+y6QOZaQUVl7AAhhA8gqAeSXMcOubdnn8+fOcMp0AjCw0wHAR4A1uyxAM98gvWhVfREAaAcAmwjwZmgv2wNgAXiPGOtKF95XJn9XyTWQaidCFACPPwTSzwAM8kE2wFFlC4J96dKlX6hPhDwlYhq5IYUAAAAASUVORK5CYII=",6,16,16);
global.sprPyroFlamethrower = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABoAAAAQCAYAAAAI0W+oAAABG0lEQVQ4je2SsWvCQBjFf5F2LQYFQQrGxQwha+buGTrUrf+FQ2dnh/4TpVtchOxCN1dxSJcqSKGTkLXDdWgv3F0uVm5w8sFB7ku+97738sEFjvCOvBMOPW5CfppxEz5UhbKYc8jHToKtY0Mc8jFlMdeKg4lgMBHw67jp1Mnk9LZ7HCW1hn3wVLn8fg3pdNsMgxCAj23BMAhZ5C8ql07sp5kaC3GU1Agk3rgH0L6XkHHvnj1NrNHBerOqnvu9EZ9f7xqhrN1N9cmXUy26mhCAMAg9tS7R6bYB1IhMWJdEE1JqAiNW+V/+IvmX2IS5ddam2+3MRi6PE8z1FH6aiX5vJOIoaVzdU3Bl3K0TXj8WlAAbZwMnWTdduKudAz82B1oNMXX49QAAAABJRU5ErkJggg==",1,8,6);
global.mskPyroArea = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACMAAAAoCAYAAAB0HkOaAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QIXFDEFC9qmUAAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAAAr0lEQVRYw+3Y0RFAMAwG4P7WYAZrmcITS1jHLpbwEg9eerQu1ZI4yatefZI7beKcRTjAWkXkHPalXT0Qd/Np6VEOQ/t7u2ak3K/mwPAGhAuKPkwpRykU3oZcgSABiYEgBQmBKul/Szuv58xIZOWYHUhDfJB4mfxQhYGGEqnMjGEMYxjD/Os4sFP7M2VSddOzCzmniVPTN6nrKNX12k+hbk8hSoPy5jMFYKmTK4tPxAbH5FIiGEZ92AAAAABJRU5ErkJggg==",1,17,20);

global.IDPD[0] = Grunt;
global.IDPD[1] = Inspector;
global.IDPD[2] = Shielder;
global.IDPD[3] = EliteGrunt;
global.IDPD[4] = EliteInspector;
global.IDPD[5] = EliteShielder;

#define step
with(CustomEnemy) if("pyro" in self){
	 // On Create:
	if("alarm" not in self){
		team = 3;						// Team (IDPD)
		walk = 0;						// Walk
		ammo = 0;						// Weapon Shots Left
		male = choose(0,1);				// Male/Female (Sounds)
		depth = -2;						// Depth
		freeze = 0;						// Freeze
		wepflip = 1;					// Weapon Flip
		sweepspd = 6;					// Flamethrower Sweep Speed
		alarm[1] = 0;					// Alarm 1 (Main Stuff)
		alarm[2] = 0;					// Alarm 2 (Attack)
		maxhealth = 23;					// Health
		gunangle = random(360);			// Gun Angle
		spr_shadow = shd24;				// Shadow Sprite
		mask_index = mskBandit;			// Hitbox
		 // Define Sprites:
		spr_idle = global.sprPyroIdle;
		spr_walk = global.sprPyroWalk;
		spr_hurt = global.sprPyroHurt;
		spr_dead = global.sprPyroDead;
		 // Sounds:
		if(male = 1){ // Male
			sound_play(sndGruntEnterM); // Entrance Sound
			snd_hurt = sndGruntHurtM;
			snd_dead = sndGruntDeadM;
		}
		else{ // Female
			sound_play(sndGruntEnterF); // Entrance Sound
			snd_hurt = sndGruntHurtF;
			snd_dead = sndGruntDeadF;
		}
	}
	
	 // Set Target To Closest Player:
	if(instance_exists(Player)) target = instance_nearest(x,y,Player);
	else target = 0;
	
	 // Draw Weapon:
	on_draw = script_ref_create(draw_wep);
	
	 // Set Sprites:
	if(nexthurt > current_frame){
		if(sprite_index != spr_hurt) image_index = 0;
		sprite_index = spr_hurt;
	}
	else{
		if(speed > friction) sprite_index = spr_walk;
		else sprite_index = spr_idle;
	}
	
	 // Movement:
	if(walk > 0){
		walk -= 1;
		motion_add(direction, 0.8);
	}
	if(speed > 3.5) speed = 3.5; // Max Speed
	
	
	if(instance_exists(target) && collision_line(x,y,target.x,target.y,Wall,0,0) < 0) targetvisible = 1;
	else targetvisible = 0;
	
	 // Freeze:
	if(my_health <= 0){
		for(i = 0; i < array_length_1d(global.IDPD); i++) with(global.IDPD[i]) freeze += 100;
		sound_stop(sndDragonLoop);
	}
	if(my_health < maxhealth) freeze += 1;
	with(Player){
		if(speed > 0) other.freeze += 1;
		if(can_shoot = 0) other.freeze += 3;
	}
	
	 // Alarm 1 (Main Stuff):
	if(alarm[1] <= 0){
		alarm[1] = 10+random(10);
		if(target > 0){
			if(targetvisible){
				 // Look Towards Player:
				if(ammo <= 0) gunangle = point_direction(x,y,target.x,target.y);
				if(target.x > x) image_xscale = 1;
				else image_xscale = -1;
		
				//SEE PLAYER AND FAR ENOUGH AND NOT SHOUTING "FREEZE MOTHERFUCKER"
				if(random(2) < 1 && freeze > 40){
					 // Fire Weapon:
					alarm[2] = 1;
					if(ammo <= 1){
						sweepspd *= -1;
						gunangle = point_direction(x,y,target.x,target.y) + (sweepspd*10);
						sound_play(sndDragonStart);
						ammo += 15;
					}
					alarm[1] = random(7);
				}
				 // Don't Fire:
				else{
					 // Blow Up Corpses Near Player:
					if(random(2) < 1 && freeze > 40){
						with(Corpse) if(random(2) < 1 && distance_to_object(other.target) < 60 && distance_to_object(other) < 300 && speed = 0 && distance_to_object(CustomObject) > 15){
							 // Sound:
							if(other.male = 1) sound_play_pitch(sndRogueAim,0.9);
							else sound_play_pitch(sndRogueAim,1.1);

							 // Corpse Explo Area:
							with instance_create(x,y,CustomObject){
								pyroexplotimer = 50;
								sprite_index = sprPopoReviveArea;
								mask_index = global.mskPyroArea;
								creator = other;
							}
						}
					}
					else if(ammo <= 0){
						speed = 0.4;
						walk = 10 + random(10);
						if(distance_to_object(target) > 48) direction = point_direction(x,y,target.x,target.y) + (random(50) - 25);
						else direction = point_direction(x,y,target.x,target.y) + 180 + (random(50) - 25);
					}
				}
			}
			else{
				 // Walk Randomly:
				if(random(3) < 2){
					direction = random(360);
					walk = 25+random(10);
				
					 // Look Towards Direction:
					gunangle = direction;
					if(hspeed > 0) image_xscale = 1
					else image_xscale = -1;
				}
				 // Blow Up Corpses Near Player:
				else if(freeze > 40) with(Corpse) if(random(4) < 1 && distance_to_object(other.target) < 100 && distance_to_object(other) < 300 && speed = 0 && distance_to_object(CustomObject) > 15){
					 // Sound:
					if(other.male = 1) sound_play_pitch(sndRogueAim,0.9);
					else sound_play_pitch(sndRogueAim,1.1);
					
					 // Corpse Explo Area:
					with instance_create(x,y,CustomObject){
						pyroexplotimer = 50;
						sprite_index = sprPopoReviveArea;
						mask_index = global.mskPyroArea;
						creator = other;
					}
				}
			}
		}
	}
	else alarm[1] -= 1;
	
	 // Alarm 2 ("Fire" Weapon):
	if(alarm[2] <= 0){
		if(ammo > 0){
			gunangle -= sweepspd;
			 // Throw Flames:
			repeat(2) with instance_create(x + lengthdir_x(9,gunangle),y + lengthdir_y(9,gunangle),Flame){
				sprite_index = sprFireLilHunter;
				motion_add(other.gunangle + random_range(-7,7), 7 + random(1));
				image_angle = random(360);
				team = other.team;
			}
			ammo -= 1;
			alarm[2] = 1;
			
			 // Sound:
			if("flamesound" not in self || flamesound <= 0){
				sound_play(sndDragonLoop);
				flamesound = 7;
			}
			else flamesound -= 1;
			if(ammo = 0){
				sound_stop(sndDragonLoop);
				sound_play(sndDragonStop);
				flamesound = 0;
			}
		}
	}
	else alarm[2] -= 1;
}

 // Pyro Explosion:
with(CustomObject) if("pyroexplotimer" in self){
	if(!sound_exists(sndPortalStrikeLoop)) sound_play(sndPortalStrikeLoop);
	if(pyroexplotimer > 0){
		pyroexplotimer -= 1;
		with instance_create(x + lengthdir_x(13,random(360)),y + lengthdir_y(13,random(360)),IDPDPortalCharge){
			pyroexplocharge = 1;
			creator = other;
			depth = other.depth - 1;
			rotplace = random(360);
			rotlength = 15;
			rotspeed = 5 + random_range(-0.5,0.5);
		}
	}
	if(pyroexplotimer <= 0){
		sound_play(sndIDPDNadeExplo);
		with(Corpse) if place_meeting(x,y,other){
			if(GameCont.area = 101) sound_play(sndOasisExplosion);
			else sound_play(sndExplosion);
			with instance_create(x,y,PopoExplosion){
				team = 3;
				sprite_index = sprRogueExplosion;
				mask_index = mskSmallExplosion;
			}
			instance_destroy();
		}
		instance_destroy();
	}
}
with(IDPDPortalCharge) if("pyroexplocharge" in self){
	image_alpha -= 0.02;
	if instance_exists(creator){
		x = creator.x + lengthdir_x(rotlength,rotplace);
		y = creator.y + lengthdir_y(rotlength,rotplace);
		rotplace += rotspeed;
		if(creator.pyroexplotimer > 2) vspeed -= 0.5;
		else if(vspeed < 0) vspeed -= vspeed / 1.5;
	}
	if(image_alpha <= 0 || !instance_exists(creator)) instance_destroy();
}

 // Spawning:
with(ProtoStatue) if("potentialpyro" not in self){
	potentialpyro = 1;
	if(GameCont.area = 5 && random(10) < (1 + GameCont.loops)) with instance_create(x,y,CustomEnemy) pyro = 1;
}
if(GameCont.loops = 1 && GameCont.area > 4 || GameCont.loops > 1){
	with(IDPDSpawn) if(elite != 1 && freak != 1){
		if("type" not in self) type = choose(1,1,2,3,4);
		if(type = 4 && alarm1 = 1){
			alarm1 = 1000;
			instance_create(x,y,PortalClear);
			with instance_create(x,y,CustomEnemy){
				pyro = 1;
				motion_add(random(360),4);
			}
		}
	}
}

 // Draw Weapon:
#define draw_wep
draw_self();

 // Weapon Kick:
if(ammo > 0 && alarm[2] <= 1) wkick = 1.5;
else wkick = 0;

 // Weapon Flip:
if(gunangle > 90 && gunangle < 270) wepflip = -1;
else wepflip = 1;

 // Weapon:
draw_sprite_ext(global.sprPyroFlamethrower,0,x - lengthdir_x(wkick,gunangle),y - lengthdir_y(wkick,gunangle),1,wepflip,gunangle,c_white,1);
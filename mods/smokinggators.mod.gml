#define step
with(Gator){
	if("smoking" not in self){
		spr_idle = sprGatorIdleSmoke;
		smoking = 120;
		smokealarm = 30 + random(90);
		alert = 0;
	}
	else{
		if(smoking > 0){
			 // Disable Normal Mechanics:
			walk = 0;
			alarm1 = 10;
			
			 // Smoke Cigar:
			if(smokealarm <= 0){
				spr_idle = sprGatorSmoke;
				image_index = 0;
				smokealarm = 90 + random(120);
			}
			else{
				smokealarm -= 1;
				if(spr_idle = sprGatorSmoke && image_index >= image_number - image_speed){
					spr_idle = sprGatorIdleSmoke;
				}
			}

			 // Notice Player:
			if(distance_to_object(target) < 150){
				if(target.reload > 0){
					alert += 90 / distance_to_object(target);
				}
				if(target.race = "steroids" && target.breload > 0){
					alert += 90 / distance_to_object(target);
				}
				if(!collision_line(x,y,target.x,target.y,Wall,0,0)){
					if(target.speed > 0) alert += 75 / (target.speed * distance_to_object(target));
					if(point_direction(x, y, target.x, target.y) > 90 && point_direction(x, y, target.x, target.y) < 270){
						if(right = -1) alert += 150 / distance_to_object(target);
						else if(smoking < 60){
							right = -1;
							gunangle = point_direction(x,y,target.x,target.y);
						}
					}
					else{
						if(right = 1) alert += 150 / distance_to_object(target);
						else if(smoking < 60){
							right = 1;
							gunangle = point_direction(x,y,target.x,target.y);
						}
					}
				}
				else{
					if(target.speed > 0) alert += (target.speed / 4);
				}
			}
			if(my_health < maxhealth) alert += 120;
			if(alert != 0){
				smoking -= alert;
				alert = 0;
			}
			
			 // Gator Time:
			if(smoking <= 0){
				instance_create(x,y,AssassinNotice);
				spr_idle = sprGatorIdle;
				gunangle = point_direction(x, y, target.x, target.y);
				if(point_direction(x, y, target.x, target.y) < 90 || point_direction(x, y, target.x, target.y) > 270) right = 1;
				else right = -1;

				 // Spittin' Cigars:
				with instance_create(x + (2 * right),y + 2,Shell){
					sprite_index = sprCigarette;
					motion_add((90 - (90 * other.right)) + random_range(-10,10), 2.5 + random(0.5));
					image_angle = direction;
				}

				 // Loadin' Up:
				with instance_create(x,y,Shell){
					motion_add(other.gunangle + other.right*100 + random_range(-10,10),2+random(2));
					sprite_index = sprShotShell;
				}
				sound_play(sndShotReload);
				wkick = 3;
			}
		}
	}
}
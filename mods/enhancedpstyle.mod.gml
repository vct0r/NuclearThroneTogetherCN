#define init // Load On Mod Start
 // Damaging Stuff That Should Rotate:
global.project[0] = projectile;
global.project[1] = Debris;

 // Visual Stuff That Should Rotate:
global.rotates[0] = Smoke;
global.rotates[1] = Shell;
global.rotates[2] = Bubble;
global.rotates[3] = WepPickup;

 // Stuff That Shouldn't Rotate:
global.nostyle[0] = Shank;
global.nostyle[1] = Slash;
global.nostyle[2] = GuitarSlash;
global.nostyle[3] = EnergyShank;
global.nostyle[4] = EnergySlash;
global.nostyle[5] = EnergyHammerSlash;
global.nostyle[6] = LightningSlash;
global.nostyle[7] = BloodSlash;

 // Enhanced Projectile Style Activation Value:
global.pstyle = 0;


#define step // Load Every Frame

 // Replace Projectile Style:
if(ultra_get(3,1) || GameCont.level = 10 && GameCont.endpoints = 0 && !ultra_get(3,1) && !ultra_get(3,2)){
	global.pstyle = 1;
	ultra_set(3,1,0);
}
if(GameCont.kills = 0 && GameCont.level = 1 && GameCont.rad = 0){
	global.pstyle = 0;
}

 // Make Melee Not Rotate:
for(i = 0; i < array_length_1d(global.nostyle); i++){
	with(global.nostyle[i]) norotate = 1;
}

 // Enhanced Projectile Style:
with(Player) if(race = "eyes" && global.pstyle = 1){
	for(i = 0; i < array_length_1d(global.project); i++) with(global.project[i]) if("creator" in self && creator = other || "creator" not in self){
		if("team" in self && team = 2 && "norotate" not in self || "team" not in self || object_index = Disc){

			 // Projectile/Debris Rotation:
			if(button_check(other.index,"spec") && speed > 0 && point_in_rectangle(x, y, view_xview, view_yview, view_xview + 320, view_yview + 240)){
				if("rotplace" not in self){
					rotplace = image_angle;						// Position Around Player 
					rotlength = 20 + random(3);					// Distance From Player
					keepspeed = speed;							// Save Speed Value
					if("force" in self) keepforce = force;		// Save Knockback Value
					if(object_index = PlasmaBall) keepspeed = 7;
					if(object_index = PlasmaBig || object_index = PlasmaHuge) keepspeed = 6;
				}
				speed = 6; // Make Sure Shells Don't Break Instantly
				rotations = ceil(rotplace / 270); // Charge Value
				
				 // Rotation Speed:
				if("rotspeed" not in self || rotspeed < keepspeed * 1.6) rotspeed = keepspeed * (1 + (0.05 * rotations)) * (0.8 + (skill_get(5) * 0.2));
				else rotspeed = keepspeed * 1.6;
				
				 // Direction Projectile Should Go After Releasing:
				if skill_get(19) direction = point_direction(x,y,mouse_x,mouse_y);
				else direction = other.gunangle;
				
				 // Projectile Rotation While Rotating:
				image_angle = rotplace + 90;
				
				 // Rotation:
				x = other.x + lengthdir_x(rotlength,rotplace);
				y = other.y + lengthdir_y(rotlength,rotplace);
				rotplace += rotspeed;
			}
			
			 // Bonus Speed/Knockback On Release, Depending On How Long It Was Rotating:
			if button_released(other.index,"spec"){
				image_angle = direction;
				if("keepspeed" in self){
					speed = rotspeed * 1.20;
					if(speed > keepspeed * (1.8 + (skill_get(5) * 0.2))) speed = keepspeed * (1.8 + (skill_get(5) * 0.2));
				}
				if("keepforce" in self){
					force = keepforce * (1 + (0.05 * rotations));
					if(force > keepforce * (1.8 + (skill_get(5) * 0.2))) force = keepforce * (1.8 + (skill_get(5) * 0.2));
				}
			}
		}
	}
	for(i = 0; i < array_length_1d(global.rotates); i++){
		with(global.rotates[i]){
		
			 // Visual Stuff Rotation Like Smoke/Empty Ammo Casings:
			if(button_check(other.index,"spec")){
				if(distance_to_object(other) < 36){
					if("rotplace" not in self || distance_to_object(other) > 40){
						rotplace = point_direction(other.x,other.y,x,y);	// Position Around Player
						rotlength = 25 + random(10);						// Distance From Player
						keepspeed = random(5);								// Save Speed Value
					}
					 // Keep Speed Constant:
					speed = keepspeed;
					
					 // Rotation Speed:
					rotspeed = -5;
					
					 // Direction To Go After Releasing:
					direction = rotplace;
					
					 // Rotation While Rotating:
					if("rotation" in self) rotation -= rotspeed;
					else image_angle -= rotspeed;
					
					 // Rotation:
					x = other.x + lengthdir_x(rotlength,rotplace);
					y = other.y + lengthdir_y(rotlength,rotplace);
					rotplace += rotspeed;
				}
				else{
					 // Drag Stuff Outside Of The Rotation Circle Towards You (If It's On-Screen):
					if point_in_rectangle(x, y, view_xview, view_yview, view_xview + 320, view_yview + 240) motion_add(point_direction(x,y,other.x,other.y),0.4);
				}
			}
		}
	}
}
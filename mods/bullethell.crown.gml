#define init
#define step

with(projectile){
	if("duplicated" not in self){
		duplicated = 1;
		 // Duplicate Projectile:
		if(distance_to_object(Player) < 10 || team != 2) with instance_create(x,y,object_index){
			duplicated = 1;
			motion_set(other.direction + (4 * random_range(-1,1)),other.speed);
			image_angle = other.image_angle
			team = other.team;
		}
	}
}
	
#define crown_name // Crown Name
return "CROWN OF BULLET HELL";

#define crown_text // Description
return "DOUBLE PROJECTILES";

#define crown_tip // Loading Tip
return "HOW IT SHOULD HAVE BEEN";

#define crown_avail // L1+
return GameCont.loops > 0;
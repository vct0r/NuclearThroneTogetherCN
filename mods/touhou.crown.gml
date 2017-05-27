#define init

#define step

with Player if mask_index != mskPopup
	{mask_index = mskPopup}
	
with EnemyBullet1 if ("cobh" not in self)
	{
	cobh = 1
	var b = object_get_name(object_index)
	repeat(irandom(3))
	with instance_create(x,y,object_index)
		{
		speed = other.speed+random_range(0,1)
		direction = other.direction+random_range(-20,20)
		image_angle = direction
		team = other.team
		cobh = 1
		}
	}

with IDPDBullet if ("cobh" not in self)
	{
	cobh = 1
	var b = object_get_name(object_index)
	repeat(irandom(3))
	with instance_create(x,y,object_index)
		{
		speed = other.speed+random_range(0,1)
		direction = other.direction+random_range(-20,20)
		image_angle = direction
		team = other.team
		cobh = 1
		}
	}


#define crown_name // Crown Name
return "CROWN OF TOUHOU";

#define crown_text // Description
return "@wMORE BULLETS @sSMALLER PLAYER HITBOX";

#define crown_tip // Loading Tip
return "VIDEOGAMES";

#define crown_avail // L1+
return GameCont.loops <= 0;
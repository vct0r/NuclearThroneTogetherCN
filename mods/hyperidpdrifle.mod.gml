#define step
	
with (Player) if wep = 26
	{
	with (Bullet1)
		{
		with instance_create(x,y,IDPDBullet)
			{
			image_angle = other.image_angle
			image_index = 1
			direction = other.direction
			speed = other.speed
			team = 2
			}
		instance_destroy()
		}
	}
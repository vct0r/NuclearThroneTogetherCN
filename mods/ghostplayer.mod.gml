// /loadmod mods/ghostplayer.mod.gml

#define step
with(Revive)
{
	if(instance_exists(self)
	&& "ghost" not in self)
	{
		ghost = instance_create(x, y, GameObject);
		view_object[p] = ghost;
		
		with(ghost)
		{
			persistent = 1;
			creator = other;
			index = creator.p;
			for(var i = 0; i < 999; i += 1)
			{
				if(sprite_get_name(i) == string_delete(sprite_get_name(other.sprite_index), string_length(sprite_get_name(other.sprite_index))-3, 4)+"Idle")
				{
					sprite_index = i;
					break;
				}
			}
			image_speed = 0.4;
			friction = 0.4;
			image_blend = player_get_color(index);
			
			while(instance_exists(self)
			&& instance_exists(creator)
			&& instance_exists(Player))
			{
				if(button_check(index, "nort"))
				{
					vspeed -= 1;
				}
				if(button_check(index, "sout"))
				{
					vspeed += 1;
				}
				if(button_check(index, "west"))
				{
					hspeed -= 1;
				}
				if(button_check(index, "east"))
				{
					hspeed += 1;
				}
				speed = min(speed, 4);
				
				if(button_check(index, "fire"))
				{
					if(fork())
					{
						with(instance_create(x, y, Dust))
						{
							speed = 2+random(4);
							direction = point_direction(other.x, other.y, mouse_x[other.index], mouse_y[other.index]) + 25*random_range(-1, 1);
							
							var pushLife = 10;
							while(instance_exists(self)
							&& pushLife > 0)
							{
								with(hitme)
								{
									if(distance_to_object(other) <= 0)
									{
										motion_add(point_direction(other.x, other.y, x, y), 1);
									}
								}
								with(projectile)
								{
									if(distance_to_object(other) <= 0)
									{
										motion_add(point_direction(other.x, other.y, x, y), 0.25);
										image_angle = direction;
									}
								}
								wait(1);
							}
						}
						exit;
					}
				}
				
				image_xscale = 1;
				if(mouse_x[index] < x)
				{
					image_xscale = -1;
				}
				image_alpha = 0.5;
				if(distance_to_object(Floor) > 0)
				{
					image_alpha = 0;
				}
				
				wait(1);
			}
			if(instance_exists(self))
			{
				repeat(5+irandom(4))
				{
					with(instance_create(x, y, Dust))
					{
						speed = 4+random(4);
						direction = random(360);
						image_blend = other.image_blend;
						image_alpha = 0.5;
					}
				}
			}
			instance_destroy();
		}
	}
}

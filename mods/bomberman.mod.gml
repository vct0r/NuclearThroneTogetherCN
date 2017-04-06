// /loadlive mods/bomberman.mod.gml

#define step
with(Explosion)
{
	if(instance_exists(self)
	&& "bomberman" not in self)
	{
		bomberman = 1;
		
		wait(2);
		
		for(var i = 0; i < 360; i += 90)
		{
			bombify(i);
		}
	}
}

#define bombify(i)
if(instance_exists(self))
{
	var w = sprite_width;
	var h = sprite_height;

	if(position_meeting(x+lengthdir_x(max(w, h), i), y+lengthdir_y(max(w, h), i), Floor)
	&& fork())
	{
		with(instance_create(x+lengthdir_x(32, i), y+lengthdir_y(32, i), object_index))
		{
			sound_play(sndExplosion);
			team = other.team;
			bomberman = 1;
			
			wait(3);
			bombify(i);
		}
		exit;
	}
}

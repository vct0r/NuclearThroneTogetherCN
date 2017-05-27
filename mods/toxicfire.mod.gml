#define step

with ToxicGas if place_meeting(x,y,Flame)
	{
	instance_create(x,y,SmallExplosion)
	sound_play(sndExplosionS)
	instance_destroy()
	}
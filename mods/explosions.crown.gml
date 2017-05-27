#define step

with Corpse if ("explode" not in self)
	{
	explode = 1
	with instance_create(x,y,SmallExplosion)
		{explode = 1}
	}
with SmallExplosion if ("explode" not in self)
	{
	explode = 1
	repeat 3
	with instance_create(x,y,SmallExplosion)
		{explode = 1}
	}
with Explosion if ("explode" not in self)
	{
	explode = 1
	repeat 3
	with instance_create(x,y,SmallExplosion)
		{explode = 1}
	}
with GreenExplosion if ("explode" not in self)
	{
	explode = 1
	repeat 3
	with instance_create(x,y,Explosion)
		{explode = 1}
	}


#define crown_name // Crown Name
return "CROWN OF EXPLOSIONS";

#define crown_text // Description
return "@wADVANCED @sEXPLOSIONS";

#define crown_tip // Loading Tip
return "DEAD";

#define crown_avail // L1+
return GameCont.loops <= 0;
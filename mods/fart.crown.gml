//fart.crown.gml

#define step
with (enemy)
{
	if my_health <= 0
	{
		chance = 10;
		if (irandom_range(1,chance) == chance)
		{
			instance_change(Wind,false);
			instance_create(x,y,GreenExplosion);
		}
	}
}

#define say(something)
trace(something);

#define crown_name
return "CROWN OF FARTS";

#define crown_text
return "SOME ENEMIES EXPLODE INTO DEADLY FARTS";

#define crown_tip
return "I CAN SMELL IT";

#define crown_avail
return 1;
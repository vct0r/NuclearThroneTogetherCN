#define step

//run from the cops
var rftc = 0
with enemy if (team != 3) if rftc == 0
	{
	rftc += 1
	}

with(Player)
	if (rftc) <= 0 
	if !instance_exists(Portal)
	if !instance_exists(RavenFly)
	if GameCont.area != 0
	if GameCont.area != 106
	{
	with instance_nearest(mouse_x[index], mouse_y[index],Corpse)
		{
		instance_create(x,y,PortalClear)
		instance_create(x,y,Portal)
		}
	}
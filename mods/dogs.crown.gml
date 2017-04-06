#define init
#define step

with(enemy){
	 // Enemies With Greater Than 29 and Less Than 130 Health Have a 50% Chance to Turn Into a Dog Guardian
	if "new" not in self && maxhealth > 29 && maxhealth < 130{
		new = 1;
		if random(2) < 1 && object_index != Wolf && object_index != EnemyHorror{
			instance_change(Effect,false);
			instance_create(x,y,DogGuardian);
		}
	}
	 // Enemies With Less Than 30 Health Have a 50% Chance to Turn Into a Wolf
	if "new" not in self && maxhealth < 30{
		new = 1;
		if random(2) < 1{
			instance_change(Effect,false);
			instance_create(x,y,Wolf);
		}
	}
	 // Enemies With Greater Than 130 Health Have a Chance to Turn Into Big Dog(s)
	if "new" not in self && maxhealth > 130{
		new = 1;
		if random(2) < 1 && object_index != DogGuardian && object_index != ScrapBoss{
			repeat((my_health/450)){
				instance_change(Effect,false);
				instance_create(x,y,ScrapBoss);
			}
		}
	}
	 // Add rads to big dog missiles to make Throne I possible.
	if object_index = ScrapBossMissile{
		if("looprads" not in self){
			raddrop += 2*GameCont.loops;
			looprads = 1;
		}
	}
}
 // Rad Canisters Have a 1% Chance to Spawn an Evil Horror Doggo
with(RadChest){
	if("new" not in self){
		new = 1;
		if random(100) < 1{
			instance_change(Effect,true);
			instance_create(x,y,EnemyHorror);
		}
	}
}
	
#define crown_name // Crown Name
return "CROWN OF DOGS";

#define crown_text // Description
return "MORE @gDOGS";

#define crown_tip // Loading Tip
return "DOOOOOOOGSSSSS";

#define crown_avail // L1+
return GameCont.loops > 0;
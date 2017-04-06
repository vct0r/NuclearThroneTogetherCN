#define init // Global Variables, These Load When Mod Loads
global.healthtimer = 30;
global.gce = 0;

#define crown_take // Do This Stuff When Crown is First Taken:
my_health = maxhealth; // Set Health to Full
global.healthtimer = 300; // Set Health Timer to 300

#define step
with(Player){
	if instance_exists(self){
		// 1 Health = 50 Rads
		var losthealth = (Player.maxhealth - Player.my_health);
		if losthealth > 0 && GameCont.rad > 49{
			GameCont.rad -= 50*losthealth;
			my_health = maxhealth;
			sound_play(sndCrownGuardianHurt);
		}
		if GameCont.rad < 0{
			GameCont.rad = 0;
		}
		
		// Lose 2 Health Every Second When You Have Less Than 50 Rads
		if GameCont.rad < 50{
			losehealth = 1;
			if losehealth = 1{
				global.healthtimer -= 1;
				if global.healthtimer = 0{
					instance_create(x,y,EnemyBullet2);
					global.healthtimer = 30;
				}
			}
		}
		else losehealth = 0;
		
		// Can't Lose Health On Loading Screens / When Portal is Open
		if(instance_exists(GenCont)){
			if(!global.gce){
				global.gce = 1;
				global.healthtimer = 150;
			}
		}
		else{ 
			if(global.gce){
				global.gce = 0;
			}
		}
		if instance_exists(Portal){
			global.healthtimer = 30;
		}
	}
} 
// Rads Reset Health Timers, Makes it Easier to Get Back to a Safe Rad Count
with(Rad){
	if distance_to_object(Player) < 10 && "new" not in self{
		new = 1;
		global.healthtimer = 30;
	}
}
with(BigRad){
	if distance_to_object(Player) < 10 && "new" not in self{
		new = 1;
		global.healthtimer = 30;
	}
}

#define crown_name // Crown Name
return "CROWN OF STAMINA";

#define crown_text // Description
return "LOSE @gRADS @sINSTEAD OF @rHP";

#define crown_tip // Loading Tip
return "@gULTRA @sMUTANT";

#define crown_avail // L1+
return GameCont.loops > 0;
#define init // Global Variables, These Load When Mod Loads
global.gce = 0;

#define step

// Friendly Projectiles Dmg +2
with(projectile){
	if team = 2 && "new" not in self{
		new = 1;
		damage += 2;
	}
}
// Increase Difficulty by an Extra 2 Between Each Level, Making Difficulty Increase by 3 Per Level
if(instance_exists(GenCont)){
	if(!global.gce){
		global.gce = 1;
		GameCont.hard += 2;
	}
}
else{ 
	if(global.gce){
		global.gce = 0;
	}
}

#define crown_name // Crown Name
return "CROWN OF TORMENT";

#define crown_text // Description
return "HIGHER @wDAMAGE#@sHIGHER @gCHALLENGE";

#define crown_tip // Loading Tip
return "FIGHT TILL YOU DROP";

#define crown_avail // L1
return GameCont.loops > 0;
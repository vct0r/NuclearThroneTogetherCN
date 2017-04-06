#define init
#define step

// Elite Variants Only
with(Scorpion){
	instance_change(Wind,false);
	instance_create(x,y,GoldScorpion);
}
with(Exploder){
	instance_change(Wind,false);
	instance_create(x,y,SuperFrog);
}
with(Gator){
	instance_change(Wind,false);
	instance_create(x,y,BuffGator);
}
with(LaserCrystal){
	instance_change(Wind,false);
	instance_create(x,y,LightningCrystal);
}
with(SnowTank){
	instance_change(Wind,false);
	instance_create(x,y,GoldSnowTank);
}
with(Grunt){
	instance_change(Wind,false);
	instance_create(x,y,EliteGrunt)
}
with(Inspector){
	instance_change(Wind,false);
	instance_create(x,y,EliteInspector);
}
with(Shielder){
	instance_change(Wind,false);
	instance_create(x,y,EliteShielder);
}

#define crown_name // Crown Name
return "CROWN OF CARNAGE";

#define crown_text // Description
return "@wELITES @sONLY";

#define crown_tip // Loading Tip
return "HARDEN UP";

#define crown_avail // L1+
return GameCont.loops > 0;
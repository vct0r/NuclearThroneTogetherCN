#define init
#define step

with(projectile){
	if team != 2 && "new" not in self{
		new = 1;
		damage -= 1;
	}
}
with(enemy){
	if("meleedamage" in self){	
		if meleedamage > 0{
			meleedamage = 20;
		}
	}
}

#define crown_name // Crown Name
return "CROWN OF PLAGUE";

#define crown_text // Description
return "REDUCED ENEMY @wPROJECTILE @sDAMAGE#ENEMY CONTACT DAMAGE @rINSTA-KILLS";

#define crown_tip // Loading Tip
return "THE THICKEST ARMOR IS USELESS AGAINST THE PLAGUE";

#define crown_avail // L0
return GameCont.loops < 1;
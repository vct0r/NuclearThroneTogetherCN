#define init
#define step

with(Scorpion){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(GoldScorpion){
	instance_change(Wind,false);
	instance_create(x,y,SuperFrog);
}
with(Maggot){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}
with(Bandit){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(BanditBoss){
	instance_change(Wind,false);
	instance_create(x,y,FrogQueen);
}

with(Mimic){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(Gator){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(BuffGator){
	instance_change(Wind,false);
	instance_create(x,y,SuperFrog);
}

with(Rat){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(FastRat){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(GatorSmoke){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(SuperMimic){
	instance_change(Wind,false);
	instance_create(x,y,SuperFrog);
}

with(Sniper){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(Raven){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(Salamander){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(ScrapBoss){
	instance_change(Wind,false);
	instance_create(x,y,FrogQueen);
}

with(MeleeBandit){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(Spider){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(LaserCrystal){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(LightningCrystal){
	instance_change(Wind,false);
	instance_create(x,y,SuperFrog);
}

with(SnowTank){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(GoldSnowTank){
	instance_change(Wind,false);
	instance_create(x,y,SuperFrog);
}

with(SnowBot){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(Wolf){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}


with(RhinoFreak){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(Freak){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(Turret){
	instance_change(Wind,false);
	instance_create(x,y,SuperFrog);
}

with(ExploFreak){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(Necromancer){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(ExploGuardian){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(DogGuardian){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(Guardian){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(CrownGuardian){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(Turtle){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(FireBaller){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(SuperFireBaller){
	instance_change(Wind,false);
	instance_create(x,y,SuperFrog);
}

with(Jock){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(Molesarge){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(LilHunter){
	instance_change(Wind,false);
	instance_create(x,y,FrogQueen);
}

with(HyperCrystal){
	instance_change(Wind,false);
	instance_create(x,y,FrogQueen);
}

with(TechnoMancer){
	instance_change(Wind,false);
	instance_create(x,y,FrogQueen);
}





with(EnemyHorror){
	instance_change(Wind,false);
	instance_create(x,y,FrogQueen);
}

with(Crab){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(BoneFish){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(JungleAssassin){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(JungleBandit){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(RadMaggot){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}


with(Grunt){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(Inspector){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(Shielder){
	instance_change(Wind,false);
	instance_create(x,y,Exploder);
}

with(EliteGrunt){
	instance_change(Wind,false);
	instance_create(x,y,SuperFrog);
}

with(EliteInspector){
	instance_change(Wind,false);
	instance_create(x,y,SuperFrog);
}

with(EliteShielder){
	instance_change(Wind,false);
	instance_create(x,y,SuperFrog);
}

with(Nothing){
	instance_change(Wind,false);
	instance_create(x,y,FrogQueen);
}

with(Nothing2){
	instance_change(Wind,false);
	instance_create(x,y,FrogQueen);
}

with(Last){
	instance_change(Wind,false);
	instance_create(x,y,FrogQueen);
}

with(PopoFreak){
	instance_change(Wind,false);
	instance_create(x,y,SuperFrog);
}

with(FrogQueen){
if my_health <= 0{
if GameCont.area = 7{
if GameCont.subarea = 3{
instance_create(x,y,BigPortal);
}}
if GameCont.area = 106{
if GameCont.subarea = 3{
instance_create(x,y,BigPortal);
}}}}

//credit to Blaac for this piece of code :)
if GameCont.loops > 0
    {
    if instance_exists (WantVan)
    if !instance_exists (Van)
    if !instance_exists (VanSpawn){
    WantVan.canspawn = 1
    WantVan.spawnmoment = 1
    }
}

#define crown_name // Crown Name
return "CROWN OF FROG";

#define crown_text // Description
return "FROGS, FROGS, AND MORE FROGS";

#define crown_tip // Loading Tip
return "TOXIC";

#define crown_avail // L1+
return GameCont.loops > 0;
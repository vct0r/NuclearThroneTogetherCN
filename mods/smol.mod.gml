#define init
 // Helpful Text
trace("");
trace("Commands:");
trace("'/setsize #' Set Everything's Size, 85% by Default");
trace("'/togglespeedscale' Toggle Speed Scaling, Enabled by Default");
trace("'/chaos' Toggle Chaos Mode, Disabled by Default");
trace("'/chaosmax #' Set Chaos Maximum Limit, 200% by Default");
trace("'/chaosmin #' Set Chaos Minimum Limit, 50% by Default");

 // Important Stuff
global.PercentSmol = 0.85;	// 85% Size by Default
global.SpeedScale = 1;		// Speed Scaling On by Default
global.Chaos = -1;			// Chaos Mode Off by Default
global.ChaosMax = 1.5; 		// Chaos Maximum Limit 200% by Default
global.ChaosMin = 0.5		// Chaos Minimum Limit 50% by Default

 // Make Smol
global.SmolObject[0] = hitme;
global.SmolObject[1] = becomenemy;
global.SmolObject[2] = projectile;
global.SmolObject[3] = Pickup;
global.SmolObject[4] = Effect;
global.SmolObject[5] = Corpse;
global.SmolObject[6] = chestprop;
global.SmolObject[7] = Explosion;
global.SmolObject[8] = MeatExplosion;
global.SmolObject[9] = CrystalShield;
global.SmolObject[10] = PopoShield;
global.SmolObject[11] = Tangle;
global.SmolObject[12] = RogueBomb;
global.SmolObject[13] = RogueStrike;
global.SmolObject[14] = Crown;
global.SmolObject[15] = CrownPickup;
global.SmolObject[16] = CrownPed;
global.SmolObject[17] = PlasmaImpact;
global.SmolObject[18] = SnowTankExplode;
global.SmolObject[19] = BigDogExplo;
global.SmolObject[20] = LilHunterDie;
global.SmolObject[21] = FrogQueenDie;
global.SmolObject[22] = ReviveArea;
global.SmolObject[23] = NecroReviveArea;
global.SmolObject[24] = RevivePopoFreak;
global.SmolObject[25] = PlayerSit;
global.SmolObject[26] = Revive;
global.SmolObject[27] = SharpTeeth;
global.SmolObject[28] = Scorch;
global.SmolObject[29] = ScorchTop;
global.SmolObject[30] = ScorchGreen;

 // Plasma
global.Plasma[0] = PlasmaBall;
global.Plasma[1] = PlasmaBig;
global.Plasma[2] = PlasmaHuge;
global.Plasma[3] = PopoPlasmaBall;

#define step
for(s = 0; s < array_length_1d(global.SmolObject); s++){
	with(global.SmolObject[s]){
		if("smol" not in self){
			variable_instance_set(self, "smol", 1);
			if global.Chaos != 1{
				if global.SpeedScale = 1{
					if("maxspeed" in self) maxspeed *= global.PercentSmol;
					else speed *= global.PercentSmol;
				}
				image_xscale *= global.PercentSmol;
				if object_index != BoltTrail{
					image_yscale *= global.PercentSmol;
				}
			}
			else{
				image_xscale *= random(global.ChaosMax) + global.ChaosMin;
				image_yscale *= random(global.ChaosMax) + global.ChaosMin;
				if global.SpeedScale = 1{
					if("maxspeed" in self) maxspeed *= random_range(image_xscale,image_yscale);
					else speed *= random_range(image_xscale,image_yscale);
				}
			}
		}
	}
}
if global.Chaos != 1{
	 // Fix Lasers
	with(Laser){
		wait 0.5;
		if instance_exists(self) && global.PercentSmol != 1{
			image_yscale -= 0.30 * (global.PercentSmol - 1)
			if(image_yscale <= 0) instance_destroy();
		}
	}
	 // Fix Plasmas at >100% Sizes
	for(p = 0; p < array_length_1d(global.Plasma); p++){
		with(global.Plasma[p]){
			if(image_xscale <= global.PercentSmol * 0.50 && global.PercentSmol > 1) instance_destroy();
		}
	}
}

 // Commands
#define chat_command
if(argument0 = "setsize"){
	global.PercentSmol = real(argument1) / 100;
	trace("Size Set To " + string(global.PercentSmol * 100) + "%");
	trace("Restart For This to Take Full Effect.");
	if(global.PercentSmol < 0 && global.SpeedScale = 1){
		trace("");
		trace("Disabling Speed Scaling is Recommended For Negative Sizes. '/togglespeedscale'.");
	}
	return true;
}
if(argument0 = "togglespeedscale"){
	global.SpeedScale *= -1;
	if(global.SpeedScale = 1) trace("Speed Scaling ENABLED");
	else trace("Speed Scaling DISABLED");
	return true;
}
if(argument0 = "chaos"){
	global.Chaos *= -1;
	if(global.Chaos = 1) trace("Chaos Mode ENABLED");
	else trace("Chaos Mode DISABLED");
	return true;
}
if(argument0 = "chaosmax"){
	global.ChaosMax = real(argument1) / 100;
	trace("Chaos Maximum Limit Set To " + string(global.ChaosMax * 100) + "%");
	global.ChaosMax -= 0.5;
	return true;
}
if(argument0 = "chaosmin"){
	global.ChaosMin = real(argument1) / 100;
	trace("Chaos Minimum Limit Set To " + string(global.ChaosMin * 100) + "%");
	return true;
}
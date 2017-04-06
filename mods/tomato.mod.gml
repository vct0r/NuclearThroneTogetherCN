//Added a two new commands: /bindsummon and /damage
//Bindsummon uses the same arguments as /summon, but the chosen objects will appear at the specified player's cursor when they press b ("horn").
//Intended for repeated use, and for avoiding spam in the chat from /summon.
//(I suppose you could also use the lack of a chat message to surprise other players.)
//Damage uses the same arguments as /speed, but multiplies the damage dealt by that player's projectiles.
//There's no upper limits with /damage.  Go crazy (but not in PvP)!

#define init
	global.seedloop = ""
	global.combined = ""
	global.temprandommode = -1
	
	global.validrandomenemies = [//"BanditBoss","ScrapBoss","LilHunter","FrogQueen","HyperCrystal","TechnoMancer","OasisBoss","Last","BigMaggot","MaggotSpawn","Ratking","JungleFly",	//disabled
		"Maggot","RadMaggot","Scorpion","GoldScorpion","Bandit",	//Desert
		"Mimic","Exploder","SuperFrog","Gator","BuffGator","Rat","FastRat",	//Sewers
		"MeleeBandit","SuperMimic","Sniper","Raven","Salamander",	//Scrapyard
		"Spider","LaserCrystal","LightningCrystal",	//Crystal Caves
		"SnowTank","GoldSnowTank","SnowBot","Wolf",	//Frozen City
		"RhinoFreak","Freak","Turret","ExploFreak","Necromancer",	//Labs
		"ExploGuardian","DogGuardian","Guardian",	//Palace
		"CrownGuardian","CrownGuardianOld",	//Crown Vault
		"Molefish","FireBaller","Jock","SuperFireBaller","Molesarge",	//YV's Mansion
		"Turtle",	//Pizza Sewers
		"Grunt","EliteGrunt","Shielder","EliteShielder","Inspector","EliteInspector","PopoFreak",	//IDPD
		"Crab","BoneFish",	//Oasis
		"InvLaserCrystal","InvSpider",	//Cursed Crystal Caves
		"JungleAssassin","JungleBandit",	//Jungle
		"EnemyHorror"	//Other
		]
	
	global.crownarray = ["random", "none", "death", "life", "haste", "guns", "hatred", "blood", "destiny", "love", "luck", "curses", "risk", "protection"]
	
	global.reset_on_game_start = [-1, 0, -1, -1, "", 0, 0, "0-1", "0-1"]	//nopopo, supermutantfix, infrads, onlywep, onlyenemy, onlyweprandom, onlyenemyrandom, wepchecknewarea, enemychecknewarea
	
	global.playersfound = 0
	
	trace("Type /tomatohelp for a list of commands.")
	
#define game_start
	global.reset_on_game_start = [-1, 0, -1, -1, "", 0, 0, "0-1", "0-1"]	//nopopo, supermutantfix, infrads, onlywep, onlyenemy, onlyweprandom, onlyenemyrandom, wepchecknewarea, enemychecknewarea
	
	if (global.seedloop != ""){
		game_set_seed(global.seedloop)}

#define chat_command
	switch(argument0){
		case "tomatohelp":{
			trace("---")
			trace("Tomato's Commands:")
			trace("/tomatohelp - Display this message.")
			trace("/clearchat - Clear the (visible) chat.")
			trace("/seed [number,random] - Make all runs the same, or make them random.")
			trace("/god [index] - Enable/disable infhp, infammp, and noreload for player[index].")
			trace("/infhp [index] - Toggle infinite HP for player[index].")
			trace("/infammo [index] - Toggle infinite ammo for player[index].")
			trace("/infrads - Level up to ultra and constantly have full rads.")
			trace("/noreload [index] - Add/Remove the need to reload for player[index].")
			trace("/speed [index] [multiplier] - Change the movement speed for player[index].")
			trace("/accuracy [index] [value,default] - Set player[index]'s accuracy.")
			trace("/damage [index] [multiplier] - Change the damage of player[index]'s projectiles.")
			trace("/clear - Kill all existing enemies.")
			trace("/clean - Delete all existing enemies.")
			trace("/escape - Spawn a portal to the next level.")
			trace("/level [area]-[subarea]-[loop] - Go to a specific level.")
			trace("/summon [index] [name] [count] - Summon instances at player[1-2]'s location.")
			trace("/bindsummon [index] [name] [count] - Bind a summon to horn/b.")
			trace("/wep [index] [name,random] - Change player[index]'s primary weapon.")
			trace("/wepb [index] [name,random] - Change player[index]'s secondary weapon.")
			trace("/curse [index] [cwep,bwep] - Toggle curse for player[index]'s weapon.")
			trace("/mutate [name] - Receive the chosen mutation.")
			trace("/unmutate [name] - Remove the selected mutation.")
			trace("/ultra [character] [a,b,c] - Gain the chosen ultra.")
			trace("/ultraremove [character] [a,b,c] - Get rid of the chosen ultra.")
			trace("/crown [name,random,none] - Obtain a crown.")
			trace("/onlywep [name,random,none,reset] - Players can only hold that weapon.")
			trace("/onlyenemy [name,random,reset] - All enemies are the same.")
			trace("/randommode - Enable/disable RandomMode(TM).")
			trace("/supermutant - Gain every mutation.")
			trace("/kills [value] - Set your kill count to the given number.")
			trace("/hard [value] - For those who always forget how to change GameCont.hard.")
			trace("---")
			
			return true}
		
		case "clearchat":{
			repeat(35){
				trace("")}
			
			return true}
		
		case "seed":{
			if (global.playersfound == 0){
				if (argument1 != ""){
					if (real(argument1)){
						global.seedloop = real(argument1)}
					
					else if (argument1 == "random"){
						global.seedloop = ""
						trace("Seeds are random once again.")}
					
					else{
						trace("Seed must be a valid number.")}
					}
				
				else{
					trace("Usage: /seed [number,random]")}
				}
			
			else{
				trace("Do this command before starting a run.")}
			
			return true}
		
		case "god":{
			if (global.playersfound > 0){
				if (argument1 != ""){
					var playerindex = real(argument1) - 1
					if (player_find(playerindex)){
						with(Player){
							if (self.index == playerindex){
								if (self.command_effects[0] == -1 || self.command_effects[1] == -1 || self.command_effects[2] == -1){
									for (i = 0; 3 > i; i ++){
										self.command_effects[i] = 1}
									trace("GODMODE enabled for Player" + argument1 + ".")}
								
								else{
									for (i = 0; 3 > i; i ++){
										self.command_effects[i] = -1}
									trace("GODMODE disabled for Player" + argument1 + ".")}
								}
							}
						}
					
					else{
						trace("Player" + argument1 + " not found.")}
					}
				
				else{
					trace("Usage: /god [index]")}
				}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "infhp":{
			if (global.playersfound > 0){
				if (argument1 != ""){
					var playerindex = real(argument1) - 1
					if (player_find(playerindex)){
						with(Player){
							if (self.index == playerindex){
								self.command_effects[0] *= -1
								trace("Toggled INFHP for Player" + argument1 + ".")}
							}
						}
					
					else{
						trace("Player" + argument1 + " not found.")}
					}
				
				else{
					trace("Usage: /infhp [index]")}
				}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "infammo":{
			if (global.playersfound > 0){
				if (argument1 != ""){
					var playerindex = real(argument1) - 1
					if (player_find(playerindex)){
						with(Player){
							if (self.index == playerindex){
								self.command_effects[1] *= -1
								trace("Toggled INFAMMO for Player" + argument1 + ".")}
							}
						}
					
					else{
						trace("Player" + argument1 + " not found.")}
					}
				
				else{
					trace("Usage: /infammo [index]")}
				}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "infrads":{
			if (global.playersfound > 0){
				global.reset_on_game_start[2] *= -1
				trace("Toggled INFRADS.")}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "noreload":{
			if (global.playersfound > 0){
				if (argument1 != ""){
					var playerindex = real(argument1) - 1
					if (player_find(playerindex)){
						with(Player){
							if (self.index == playerindex){
								self.command_effects[2] *= -1
								trace("Toggled NORELOAD for Player" + argument1 + ".")}
							}
						}
					
					else{
						trace("Player" + argument1 + " not found.")}
					}
				
				else{
					trace("Usage: /noreload [index]")}
				}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "speed":{
			if (global.playersfound > 0){
				if (argument1 != ""){
					var args = string_split(argument1, " ")
					if (array_length_1d(args) == 2){
						var numarg = real(args[0]) - 1
						if (player_find(numarg)){
							if (real(args[1])){
								with(Player){
									if (self.index == numarg){
										self.maxspeed = real(args[1]) * self.command_effects[3]
										trace("Player" + args[0] + " now moves at " + args[1] + "x their normal speed.")}
									}
								}
							
							else{
								trace("Speed multiplier must be a number greater than 0.5.")}
							}
						
						else{
							trace("Player" + args[0] + " not found.")}
						}
					
					else{
						trace("Usage: /speed [index] [multiplier]")}
					}
				
				else{
					trace("Usage: /speed [index] [multiplier]")}
				}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "accuracy":{
			if (global.playersfound > 0){
				if (argument1 != ""){
					var args = string_split(argument1, " ")
					if (array_length_1d(args) == 2){
						var numarg = real(args[0]) - 1
						if (player_find(numarg)){
							if (real(args[1])){
								with(Player){
									if (self.index == numarg){
										self.accuracy = real(args[1])
										trace("Player" + args[0] + "'s accuracy is now " + args[1] + ".")}
									}
								}
							
							else if (args[1] == "default"){
								with(Player){
									if (self.index == numarg){
										self.accuracy = self.command_effects[4]
										trace("Player" + args[0] + "'s accuracy is now default.")}
									}
								}
							
							else{
								trace("Accuracy must be between 0.6 and 45, or default.")}
							}
						
						else{
							trace("Player" + args[0] + " not found.")}
						}
					
					else{
						trace("Usage: /accuracy [index] [value]")}
					}
				
				else{
					trace("Usage: /accuracy [index] [value]")}
				}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "damage":{
			if (global.playersfound > 0){
				if (argument1 != ""){
					var args = string_split(argument1, " ")
					if (array_length_1d(args) == 2){
						var numarg = real(args[0]) - 1
						if (player_find(numarg)){
							if (real(args[1])){
								with(Player){
									if (self.index == numarg){
										self.command_effects[6] = real(args[1])
										trace("Player" + args[0] + " now deals " + args[1] + "x their normal damage.")}
									}
								}
							
							else{
								trace("Damage multiplier must be above 0.5.")}
							}
						
						else{
							trace("Player" + args[0] + " not found.")}
						}
					
					else{
						trace("Usage: /damage [index] [multiplier]")}
					}
				
				else{
					trace("Usage: /damage [index] [multiplier]")}
				}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "clear":{
			if (global.playersfound > 0){
				with(enemy){
					my_health = 0}
				trace("Killed all enemies.")}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "clean":{
			if (global.playersfound > 0){
				with(enemy){
					instance_delete(self)}
				trace("Removed all enemies.")}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "escape":{
			if (global.playersfound > 0){
				if (GameCont.area == 7 && GameCont.subarea == 3) || (GameCont.area == 0 && GameCont.subarea == 1) || (GameCont.area == 100) || (GameCont.area == 106 && GameCont.subarea == 3){
					trace("You must leave this level naturally.")}
				
				else{
					with(Player){
						instance_create(self.x, self.y, Portal)}
					trace("Escaping the current level.")}
				}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "level":{
			if (global.playersfound > 0){
				var nums = string_split(argument1, "-")
				if !(GameCont.area == 7 && GameCont.subarea == 3) && !(GameCont.area == 0 && GameCont.subarea == 1) && !(GameCont.area == 100) && !(GameCont.area == 106 && GameCont.subarea == 3){
					if (array_length_1d(nums) == 3 && nums[1] != "?"){
						if (8 > real(nums[0])) && (4 > real(nums[1])) && (real(nums[2]) > -1){
							if (real(nums[0]) == 0) || (real(nums[0]) == 2) || (real(nums[0]) == 4) || (real(nums[0]) == 6){
								nums[1] = 1}
							
							GameCont.loops = real(nums[2])						
							GameCont.area = real(nums[0])
							
							if (real(nums[1]) == 1){
								if (real(nums[0]) != 0){
									GameCont.area -= 1}
								
								else{
									GameCont.area = 7
									GameCont.subarea = 3
									GameCont.loops -= 1}
								
								if (GameCont.area == 2) || (GameCont.area == 4) || (GameCont.area == 6){
									GameCont.subarea = 1}
								
								else{
									GameCont.subarea = 3}
								}
							
							else{
								GameCont.subarea = real(nums[1]) - 1}
							
							if (GameCont.area != 0){		//Thanks for this part, Saniblues!
								var tempcalc = GameCont.area mod 8
								tempcalc *= 3
								tempcalc -= (GameCont.area div 2) * 2
								tempcalc -= 3 - GameCont.subarea
								tempcalc += GameCont.loops * 16
								GameCont.hard = tempcalc}
							
							else{
								GameCont.hard = 16 * GameCont.loops}
							
							with(Player){
								instance_create(self.x, self.y, Portal)}
							
							trace("Traveling to: " + string(nums[0]) + "-" + string(nums[1]) + " L" + string(nums[2]) + ".")}
						}
						
					else if (array_length_1d(nums) == 3 && nums[1] == "?"){
						for (i = 1; 6 > i; i++){
							if (real(nums[0]) == i && real(nums[2]) > -1){
								GameCont.area = 100 + i
								GameCont.subarea = 0
								GameCont.loops = real(nums[2])
								trace("Traveling to " + nums[0] + "-? L" + nums[2] + ".")
								
								switch(i){
									case 1:{
										GameCont.hard = 1 + (GameCont.loops * 16)}
									
									case 2:{
										GameCont.hard = 4 + (GameCont.loops * 16)}
									
									case 3:{
										GameCont.hard = 5 + (GameCont.loops * 16)}
									
									case 4:{
										GameCont.hard = 7 + (GameCont.loops * 16)}
									
									case 5:{
										GameCont.hard = 9 + (GameCont.loops * 16)}
									}
								
								with(Player){
									instance_create(self.x, self.y, Portal)}
								}
							}
						}
						
					else if (array_length_1d(nums) == 2){
						if (nums[0] == "???") && (real(nums[1]) > -1){
							GameCont.area = 100
							GameCont.subarea = 0
							GameCont.loops = real(nums[1])
							GameCont.hard += (GameCont.loops * 16)
							
							with(Player){
								instance_create(self.x, self.y, Portal)}
							
							trace("Traveling to ??? L" + nums[1] + ".")}
						
						if (string_char_at(nums[0], 1) == "H") && (string_char_at(nums[0], 2) == "Q") && (real(nums[1]) > -1){
							if (real(string_char_at(nums[0], 3))){
								var HQnum = real(string_char_at(argument1, 3))
								GameCont.area = 106
								GameCont.subarea = HQnum - 1
								GameCont.loops = real(nums[1])
								GameCont.hard += (GameCont.loops * 16)
								
								with(Player){
									instance_create(self.x, self.y, Portal)}
								
								trace("Traveling to HQ" + string_char_at(nums[0], 3) + " L" + nums[1] + ".")}
							}
						
						if (nums[0] == "$$$") && (real(nums[1]) > -1){
							GameCont.area = 107
							GameCont.subarea = 0
							GameCont.loops = real(nums[1])
							GameCont.hard += (GameCont.loops * 16)
							
							with(Player){
								instance_create(self.x, self.y, Portal)}
							
							trace("Traveling to $$$ L" + nums[1] + ".")}
						}
						
						else{
							trace("Usage: /level [area]-[subarea]-[loop]")}
					}
				
				else{
					trace("You must leave this level naturally.")}
				}
			
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "summon":{
			if (global.playersfound > 0){
				args = string_split(argument1, " ")
				if (array_length_1d(args) == 3){
					var numarg1 = real(args[0]) - 1
					var numarg3 = real(args[2])
					if (player_find(numarg1)){
						with(Player){
							if (self.index == numarg1){
								if (numarg3 > 0){
									if (asset_get_index(args[1]) != -1){
										repeat(numarg3){
											instance_create(mouse_x[numarg1], mouse_y[numarg1], asset_get_index(args[1]))}
										
										trace("Summoned " + args[2] + " " + args[1] + " at Player" + args[0] + "'s cursor.")}
									
									else{
										trace(args[1] + " does not exist.")}
									}
								
								else{
									trace("Count must be at least one.")}
								}
							}
						}
					
					else{
						trace("Player" + args[0] + " not found.")}
					}
				
				else{
					trace("Usage: /summon [index] [name] [count]")}
				}
			
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "bindsummon":{
			if (global.playersfound > 0){
				args = string_split(argument1, " ")
				if (array_length_1d(args) == 3){
					var numarg1 = real(args[0]) - 1
					var numarg3 = real(args[2])
					if (player_find(numarg1)){
						with(Player){
							if (self.index == numarg1){
								if (numarg3 > 0){
									if (asset_get_index(args[1]) != -1){
										self.command_effects[5] = argument1
										
										trace("Player" + args[0] + " will summon " + args[2] + " " + args[1] + " when they press horn/b.")}
									
									else{
										trace(args[1] + " does not exist.")}
									}
								
								else{
									trace("Count must be at least one.")}
								}
							}
						}
					
					else{
						trace("Player" + args[0] + " not found.")}
					}
				
				else{
					trace("Usage: /bindsummon [index] [name] [count]")}
				}
			
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "wep":{
			if (global.playersfound > 0){
				args = string_split(argument1, " ")
				if (array_length_1d(args) > 2){
					for (var i = 2; array_length_1d(args) > i; i++){
						args[1] += " " + args[i]}
					}
				
				if (argument1 != "" && array_length_1d(args) > 1){
					var realid = 0
					var wepmods = mod_get_names("weapon")
					
					for (i = 0; array_length_1d(wepmods) > i; i++){
						if (string_lower(wepmods[i]) == string_lower(args[1])){
							realid = wepmods[i]}
						}
					
					if (realid == 0){
						for (i = 1; 126 > i; i++){
							if (string_lower(weapon_get_name(i)) == string_lower(args[1])){
								realid = i}
							}
						}
					
					var numarg1 = real(args[0]) - 1
					
					if (realid != 0 || args[1] == "random"){
						if (realid != 0){
							if (player_find(numarg1)){
								with(Player){
									if (self.index == numarg1){
										self.wep = realid
										trace("Player" + args[0] + " received primary weapon " + weapon_get_name(realid) + ".")
										if (floor(self.typ_amax[weapon_get_type(self.wep)] / 4) > self.ammo[weapon_get_type(self.wep)]){
											self.ammo[weapon_get_type(self.wep)] = floor(self.typ_amax[weapon_get_type(self.wep)] / 2)}
										
										if (string_count("ultra", string_lower(weapon_get_name(self.wep)))){
											GameCont.rad += 50}
										}
									}
								}
							
							else{
								trace("Player" + args[0] + " not found.")}
							}
						
						if (args[1] == "random"){
							if (player_find(numarg1)){
								var wepmodcheck = mod_get_names("weapon")
								if (array_length_1d(wepmodcheck) > 0){
									var randomchoice = choose("mod", "vanilla", "vanilla", "vanilla")}
								
								else{
									var randomchoice = "vanilla"}
								
								if (randomchoice == "vanilla"){
									var randomwep = irandom_range(1,125)
									while (randomwep == 108 || randomwep == 109){
										randomwep = irandom_range(1,125)}
									}
								
								else if (randomchoice == "mod"){
									var randomwep = wepmods[irandom_range(0,array_length_1d(wepmods) - 1)]}
								
								with(Player){
									if (self.index == numarg1){
										self.wep = randomwep
										trace("Player" + args[0] + " received primary weapon " + weapon_get_name(randomwep) + ".")
										if (floor(self.typ_amax[weapon_get_type(self.wep)] / 4) > self.ammo[weapon_get_type(self.wep)]){
											self.ammo[weapon_get_type(self.wep)] = floor(self.typ_amax[weapon_get_type(self.wep)] / 2)}
										
										if (string_count("ultra", string_lower(weapon_get_name(self.wep)))){
											GameCont.rad += 50}
										}
									}
								}
							
							else{
								trace("Player" + args[0] + " not found.")}
							}
						}
					
					else{
						trace("Could not find weapon " + args[1] + ".")}
					}
				
				else{
					trace("Usage: /wep [index] [name,random]")}
				}
			
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "wepb":{
			if (global.playersfound > 0){
				args = string_split(argument1, " ")
				if (array_length_1d(args) > 2){
					for (var i = 2; array_length_1d(args) > i; i++){
						args[1] += " " + args[i]}
					}
				
				if (argument1 != "" && array_length_1d(args) > 1){
					var realid = 0
					var wepmods = mod_get_names("weapon")
					
					for (i = 0; array_length_1d(wepmods) > i; i++){
						if (string_lower(wepmods[i]) == string_lower(args[1])){
							realid = wepmods[i]}
						}
					
					if (realid == 0){
						for (i = 1; 126 > i; i++){
							if (string_lower(weapon_get_name(i)) == string_lower(args[1])){
								realid = i}
							}
						}
					
					var numarg1 = real(args[0]) - 1
					
					if (realid != 0 || args[1] == "random"){
						if (realid != 0){
							if (player_find(numarg1)){
								with(Player){
									if (self.index == numarg1){
										self.bwep = realid
										trace("Player" + args[0] + " received secondary weapon " + weapon_get_name(realid) + ".")
										if (floor(self.typ_amax[weapon_get_type(self.bwep)] / 4) > self.ammo[weapon_get_type(self.bwep)]){
											self.ammo[weapon_get_type(self.bwep)] = floor(self.typ_amax[weapon_get_type(self.bwep)] / 2)}
										
										if (string_count("ultra", string_lower(weapon_get_name(self.bwep)))){
											GameCont.rad += 50}
										}
									}
								}
							
							else{
								trace("Player" + args[0] + " not found.")}
							}
						
						if (args[1] == "random"){
							if (player_find(numarg1)){
								var wepmodcheck = mod_get_names("weapon")
								if (array_length_1d(wepmodcheck) > 0){
									var randomchoice = choose("mod", "vanilla", "vanilla", "vanilla")}
								
								else{
									var randomchoice = "vanilla"}
								
								if (randomchoice == "vanilla"){
									var randomwep = irandom_range(1,125)
									while (randomwep == 108 || randomwep == 109){
										randomwep = irandom_range(1,125)}
									}
								
								else if (randomchoice == "mod"){
									var randomwep = wepmods[irandom_range(0,array_length_1d(wepmods) - 1)]}
								
								with(Player){
									if (self.index == numarg1){
										self.bwep = randomwep
										trace("Player" + args[0] + " received secondary weapon " + weapon_get_name(randomwep) + ".")
										if (floor(self.typ_amax[weapon_get_type(self.bwep)] / 4) > self.ammo[weapon_get_type(self.bwep)]){
											self.ammo[weapon_get_type(self.bwep)] = floor(self.typ_amax[weapon_get_type(self.bwep)] / 2)}
										
										if (string_count("ultra", string_lower(weapon_get_name(self.bwep)))){
											GameCont.rad += 50}
										}
									}
								}
							
							else{
								trace("Player" + args[0] + " not found.")}
							}
						}
					
					else{
						trace("Could not find weapon " + args[1] + ".")}
					}
				
				else{
					trace("Usage: /wepb [index] [name,random]")}
				}
			
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "curse":{
			if (global.playersfound > 0){
				args = string_split(argument1, " ")
				if (array_length_1d(args) == 2){
					if (args[0] != "" && args[1] != ""){
						if (player_find(real(args[0]) - 1)){
							with(Player){
								if (self.index == real(args[0]) - 1){
									if (args[1] == "cwep"){
										if (self.curse == 0){
											self.curse = 1
											trace("Player" + args[0] + "'s primary weapon now carries a curse.")}
										
										else{
											self.curse = 0
											trace("The curse on Player" + args[0] + "'s primary weapon has been lifted.")}
										}
									
									if (args[1] == "bwep"){
										if (self.bcurse == 0){
											self.bcurse = 1
											trace("Player" + args[0] + "'s secondary weapon now carries a curse.")}
										
										else{
											self.bcurse = 0
											trace("The curse on Player" + args[0] + "'s secondary weapon has been lifted.")}
										}
									}
								}
							}
						
						else{
							trace("Player" + args[0] + " not found.")}
						}
					
					else{
						trace("Usage: /curse [index] [cwep,bwep]")}
					}
				}
			
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "mutate":{
			if (global.playersfound > 0){
				if (argument1 != ""){
					var realid = 0
					var skillmods = mod_get_names("skill")
					
					for (i = 0; array_length_1d(skillmods) > i; i ++){
						if (string_lower(skillmods[i]) == string_lower(argument1)){
							realid = skillmods[i]}
						}
					
					if (realid == 0){
						for (i = 1; 30 > i; i ++){
							if (string_lower(skill_get_name(i)) == string_lower(argument1)){
								realid = i}
							}
						}
					
					if (realid != 0){
						if (!skill_get(realid)){
							skill_set(realid, 1)
							trace("You have received the mutation " + skill_get_name(realid) + ".")}
						
						else{
							trace("You already have " + skill_get_name(realid) + ".")}
						}
					
					else{
						trace("Could not find mutation " + argument1 + ".")}
					}
				
				else{
					trace("Usage: /mutate [name]")}
				}
			
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "unmutate":{
			if (global.playersfound > 0){
				if (argument1 != ""){
					var realid = 0
					var skillmods = mod_get_names("skill")
					
					for (i = 0; array_length_1d(skillmods) > i; i ++){
						if (string_lower(skillmods[i]) == string_lower(argument1)){
							realid = skillmods[i]}
						}
					
					if (realid == 0){
						for (i = 1; 30 > i; i ++){
							if (string_lower(skill_get_name(i)) == string_lower(argument1)){
								realid = i}
							}
						}
					
					if (realid != 0){
						if (skill_get(realid)){
							skill_set(realid, 0)
							trace("You have gotten rid of the mutation " + skill_get_name(realid) + ".")}
						
						else{
							trace("You donn't have " + skill_get_name(realid) + ".")}
						}
					
					else{
						trace("Could not find mutation " + argument1 + ".")}
					}
				
				else{
					trace("Usage: /unmutate [name]")}
				}
			
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "ultra":{
			if (global.playersfound > 0){
				args = string_split(argument1, " ")
				if (array_length_1d(args) >= 2){
					if (string_lower(args[0]) == "big" && array_length_1d(args) == 3){
						args[0] += " " + args[1]
						args[1] = args[2]}
					
					if (args[0] != "" && args[1] != ""){
						var charid = 0
						var racemods = mod_get_names("race")
						var foundchar = 0
						
						for (i = 0; array_length_1d(racemods) > i; i ++){
							if (string_lower(racemods[i]) == string_lower(args[0])){
								charid = racemods[i]}
							}
						
						if (charid == 0){
							for (i = 1; 16 > i; i ++){
								if (string_lower(args[0]) == string_lower(race_get_alias(i))){
									charid = i}
								}
							}
						
						if (charid != 0){
							with(Player){
								if (self.race_id == charid) || (self.race == charid){
									foundchar = 1
									if (string_lower(args[1]) == "a"){
										if (!ultra_get(charid, 1)){
											ultra_set(charid, 1, 1)
											trace("Gained " + string_upper(race_get_name(charid)) + "'s ULTRA A.")}
										
										else{
											trace("You already have " + string_upper(race_get_name(charid)) + "'s ULTRA A.")}
										}
									
									if (string_lower(args[1]) == "b"){
										if (!ultra_get(charid, 2)){
											ultra_set(charid, 2, 1)
											trace("Gained " + string_upper(race_get_name(charid)) + "'s ULTRA B.")}
										
										else{
											trace("You already have " + string_upper(race_get_name(charid)) + "'s ULTRA B.")}
										}
									
									if (string_lower(args[1]) == "c" && charid == 11){
										if (!ultra_get(charid, 3)){
											ultra_set(charid, 3, 1)
											trace("Gained " + string_upper(race_get_name(charid)) + "'s ULTRA C.")}
										
										else{
											trace("You already have " + string_upper(race_get_name(charid)) + "'s ULTRA C.")}
										}
									
									if (string_lower(args[1]) != "a" && string_lower(args[1]) != "b" && string_lower(args[1]) != "c"){
										trace("Invalid ultra for " + string_upper(race_get_name(charid)) + ".")}
									}
								}
							
							if (foundchar == 0){
								trace("At least one player must be " + string_upper(race_get_name(charid)) + ".")}
							}
						
						else{
							trace("Character " + args[0] + " not found.")}
						}
					
					else{
						trace("Usage: /ultra [character] [a,b,c]")}
					}
				
				else{
					trace("Usage: /ultra [character] [a,b,c]")}
				}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "ultraremove":{
			if (global.playersfound > 0){
				args = string_split(argument1, " ")
				if (array_length_1d(args) >= 2){
					if (string_lower(args[0]) == "big" && array_length_1d(args) == 3){
						args[0] += " " + args[1]
						args[1] = args[2]}
					
					if (args[0] != "" && args[1] != ""){
						var charid = 0
						var racemods = mod_get_names("race")
						var foundchar = 0
						
						for (i = 0; array_length_1d(racemods) > i; i ++){
							if (string_lower(racemods[i]) == string_lower(args[0])){
								charid = racemods[i]}
							}
						
						if (charid == 0){
							for (i = 1; 16 > i; i ++){
								if (string_lower(args[0]) == string_lower(race_get_alias(i))){
									charid = i}
								}
							}
						
						if (charid != 0){
							with(Player){
								if (self.race_id == charid) || (self.race == charid){
									foundchar = 1
									if (string_lower(args[1]) == "a"){
										if (ultra_get(charid, 1)){
											ultra_set(charid, 1, 0)
											trace("Removed " + string_upper(race_get_name(charid)) + "'s ULTRA A.")}
										
										else{
											trace("You don't have " + string_upper(race_get_name(charid)) + "'s ULTRA A.")}
										}
									
									if (string_lower(args[1]) == "b"){
										if (ultra_get(charid, 2)){
											ultra_set(charid, 2, 0)
											trace("Removed " + string_upper(race_get_name(charid)) + "'s ULTRA B.")}
										
										else{
											trace("You don't have " + string_upper(race_get_name(charid)) + "'s ULTRA B.")}
										}
									
									if (string_lower(args[1]) == "c" && charid == 11){
										if (ultra_get(charid, 3)){
											ultra_set(charid, 3, 0)
											trace("Removed " + string_upper(race_get_name(charid)) + "'s ULTRA C.")}
										
										else{
											trace("You don't have " + string_upper(race_get_name(charid)) + "'s ULTRA C.")}
										}
									
									if (string_lower(args[1]) != "a" && string_lower(args[1]) != "b" && string_lower(args[1]) != "c"){
										trace("Invalid ultra for " + string_upper(race_get_name(charid)) + ".")}
									}
								}
							
							if (foundchar == 0){
								trace("At least one player must be " + string_upper(race_get_name(charid)) + ".")}
							}
						
						else{
							trace("Character " + args[0] + " not found.")}
						}
					
					else{
						trace("Usage: /ultraremove [character] [a,b,c]")}
					}
				
				else{
					trace("Usage: /ultraremove [character] [a,b,c]")}
				}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "crown":{
			if (global.playersfound > 0){
				if (argument1 != ""){
					var arg = string_lower(argument1)
					var gotcrown = 0
					var crownmods = mod_get_names("crown")
					
					for (i = 0; array_length_1d(crownmods) > i; i ++){
						if (string_lower(crownmods[i]) == string_lower(argument1)){
							if (GameCont.crown != crownmods[i]){
								with(Crown){
									instance_destroy()}
								GameCont.crown = crownmods[i]
								trace("The current crown is now CROWN OF " + string_upper(argument1) + ".")
								with(Player){
									gotcrown = 1
									var newcrown = instance_create(self.x, self.y, Crown)
									newcrown.new = crownmods[i]}
								}
							
							else{
								trace("The current crown is already CROWN OF " + string_upper(argument1) + ".")
								gotcrown = 1}
							}
						}
					
					if (gotcrown == 0){
						for (i = 2; array_length_1d(global.crownarray) > i; i ++){
							if (string_count(global.crownarray[i], arg)){
								if (GameCont.crown != i){
									with(Crown){
										instance_destroy()}
									GameCont.crown = i
									trace("The current crown is now CROWN OF " + string_upper(global.crownarray[i]) + ".")
									with(Player){
										gotcrown = 1
										var newcrown = instance_create(self.x, self.y, Crown)
										newcrown.new = i}
									
									if (GameCont.crown == 8){
										if (28 > GameCont.mut){
											GameCont.skillpoints ++}
										}
									}
								
								else{
									trace("The current crown is already CROWN OF " + string_upper(global.crownarray[i]) + ".")
									gotcrown = 1}
								}
							}
						}
					
					if (string_count(global.crownarray[0], arg)){
						var randomchoice = choose("mod", "vanilla", "vanilla", "vanilla")
						
						if (randomchoice == "vanilla"){
							var randomcrown = irandom_range(2,13)
							while (GameCont.crown == randomcrown){
								randomcrown = irandom_range(2,13)}
							trace("The current crown is now CROWN OF " + string_upper(global.crownarray[randomcrown]) + ".")
							}
						
						if (randomchoice == "mod"){
							var randomcrown = crownmods[irandom_range(0,array_length_1d(crownmods) - 1)]
							while (GameCont.crown == randomcrown){
								randomcrown = crownmods[irandom_range(0,array_length_1d(crownmods) - 1)]}
							trace("The current crown is now CROWN OF " + string_upper(randomcrown) + ".")
							}
						
						with(Crown){
							instance_destroy()}
						GameCont.crown = randomcrown
						with(Player){
							if (gotcrown == 0){
								gotcrown = 1
								var newcrown = instance_create(self.x, self.y, Crown)
								newcrown.new = randomcrown}
							}
						
						if (GameCont.crown == 8){
							if (28 > GameCont.mut){
								GameCont.skillpoints ++}
							}
						}
					
					if (string_count(global.crownarray[1], arg)){
						trace("The current crown has been removed.")
						with(Crown){
							instance_destroy()}
						GameCont.crown = 1
						gotcrown = 1}
					
					if (gotcrown == 0){
						trace("Could not find " + argument1 + ".")}
					
					gotcrown = 0
					}
				
				else{
					trace("Usage: /crown [name]")}
				}
			
			else{
				trace("You must start a run before using this command.")}
			
			return true}
		
		case "onlywep":{
			if (global.playersfound > 0){
				if (argument1 != ""){
					var wepmods = mod_get_names("weapon")
					
					for (i = 0; array_length_1d(wepmods) > i; i++){
						if (string_lower(wepmods[i]) == string_lower(argument1)){
							realid = wepmods[i]}
						}
					
					if (realid == 0){
						for (i = 1; 126 > i; i++){
							if (string_lower(weapon_get_name(i)) == string_lower(argument1)){
								realid = i}
							}
						}
					
					if (realid != 0 || argument1 == "random" || argument1 == "none" || argument1 == "reset"){
						if (realid != 0){
							if (global.temprandommode == -1){
								global.reset_on_game_start[5] = 0
								global.reset_on_game_start[3] = realid
								trace("From now on, the only usable weapon is " + weapon_get_name(global.reset_on_game_start[3]) + ".")}
							
							else{
								trace("Disable RandomMode(TM) first.")}
							}
						
						if (argument1 == "random"){
							if (global.temprandommode == -1){
								global.reset_on_game_start[5] = 1}
							
							else{
								trace("Disable RandomMode(TM) first.")}
							}
						
						if (argument1 == "none"){
							if (global.temprandommode == -1){
								global.reset_on_game_start[5] = 0
								global.reset_on_game_start[3] = 0
								trace("You can no longer hold weapons.")}
							
							else{
								trace("Disable RandomMode(TM) first.")}
							}
						
						if (argument1 == "reset"){
							if (global.temprandommode == -1){
								global.reset_on_game_start[5] = 0
								global.reset_on_game_start[3] = -1
								trace("Weapons can be picked up once again.")}
							
							else{
								trace("Disable RandomMode(TM) first.")}
							}
						}
					
					else{
						trace("Could not find weapon " + argument1 + ".")}
					}
				
				else{
					trace("Usage: /onlywep [name,random,none,reset]")}
				}
			
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "onlyenemy":{
			if (global.playersfound > 0){
				if (argument1 != ""){
					if (asset_get_index(argument1) != -1 || argument1 == "reset" || argument1 == "random"){
						if (global.combined != "7-3" && global.combined != "0-1") && (GameCont.area != 100 && GameCont.area != 106){
							if (asset_get_index(argument1) != -1 && asset_get_index(argument1) != 48 && asset_get_index(argument1) != 65) || (argument1 == "reset" || argument1 == "random"){
								if (asset_get_index(argument1) != -1 && asset_get_index(argument1) != 48 && asset_get_index(argument1) != 65){
									var check = instance_create(500, 500, asset_get_index(argument1))
									if (variable_instance_exists(check, "team") && check.team != 2 && variable_instance_exists(check, "my_health")){
										global.reset_on_game_start[6] = 0
										instance_delete(check)
										global.reset_on_game_start[4] = asset_get_index(argument1)
										trace("All enemies are now " + argument1 + ".")}
									
									else{
										trace("Instance must be an enemy.")
										}
									}
								
								if (argument1 == "reset" || argument1 == "random"){
									if (argument1 == "reset"){
										global.reset_on_game_start[6] = 0
										global.reset_on_game_start[4] = ""
										trace("All enemies will return to normal.")}
									
									if (argument1 == "random"){
										if (global.temprandommode == -1){
											global.reset_on_game_start[6] = 1}
							
										else{
											trace("Disable RandomMode(TM) first.")}
										}
									}
								}
							
							else{
								trace("Replacing enemies with the Nuclear Throne has been disabled.")}
							}
						
						else{
							trace("Cannot replace enemies on this level.")}
						}
					
					else{
						trace("Could not find instance " + argument1 + ".")}
					}
				
				else{
					trace("Usage: /onlyenemy [name,random,reset]")}
				}
			
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "randommode":{
			global.reset_on_game_start[5] = 0
			global.reset_on_game_start[6] = 0
			global.temprandommode *= -1
			
			if (global.temprandommode == 1){
				trace("RandomMode(TM) enabled.")}
			
			else{
				trace("RandomMode(TM) disabled.")}
			
			return true}
		
		case "supermutant":{
			if (global.playersfound > 0){
				if (global.reset_on_game_start[1] == 0){
					for (var i = 1; 30 > i; i++){
						if (!skill_get(i)){
							skill_set(i, 1)}
						}
						
						with(Player){
							if (self.race_id != 11 && self.race_id != 14 && self.race_id != 4){
								if (!ultra_get(self.race, 1)){
									ultra_set(self.race, 1, 1)}
								
								if (!ultra_get(self.race, 2)){
									ultra_set(self.race, 2, 1)}
								}
							
							if (self.race_id == 11){
								if (!ultra_get(self.race, 1)){
									ultra_set(self.race, 1, 1)}
								
								if (!ultra_get(self.race, 2)){
									ultra_set(self.race, 2, 1)}
								
								if (!ultra_get(self.race, 3)){
									ultra_set(self.race, 3, 1)}
								}
							
							if (self.race_id == 4){
								if (!ultra_get(self.race, 1)){
									ultra_set(self.race, 1, 1)}
								}
							
							if (self.race_id == 14){
								if (!ultra_get(self.race, 2)){
									ultra_set(self.race, 2, 1)}
								}
							}
					
					GameCont.level = 10
					trace("You have received all mutations.")
					global.reset_on_game_start[1] = 1}
				}
			
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "kills":{
			if (global.playersfound > 0){
				if (real(argument1)){
					GameCont.kills = real(argument1)
					trace("The kill count has been set to " + argument1 + ".")}
				
				else{
					trace("Kills must be set to a valid number.")}
				}
				
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "hard":{
			if (global.playersfound > 0){
				if (argument1 != ""){
					if (real(argument1) && real(argument1) > 1){
						GameCont.hard = real(argument1)
						trace("Difficulty has been set to " + argument1 + ".")}
					
					else{
						trace("Difficulty must be a number greater than 1.")}
					}
				
				else{
					trace("Usage: /hard [value]")}
				}
				
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "bigdog":{
			if (!race_get_active(13)){
				race_set_active(13, 1)}
			
			return true}
		
		case "money":{
			if (global.playersfound > 0){
				with(enemy){
					instance_create(x, y, MoneyPile)
					instance_delete(self)}
				trace("The Gun God sends his blessings.")
				}
			
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "nopopo":{
			if (global.playersfound > 0){
				global.reset_on_game_start[0] *= -1
				if (global.reset_on_game_start[0] == 1){
					trace("no popo")}
				
				else{
					trace("yes popo")}
				}
			
			else{
				trace("You must start the run before this command can be used.")}
			
			return true}
		
		case "cuz":{
			sound_play(sndCuzGreet)
			
			return true}
		}

#define step
	if (global.combined != string(GameCont.area) + "-" + string(GameCont.subarea)){
		global.combined = string(GameCont.area) + "-" + string(GameCont.subarea)}
	
	for (i = 0; maxp + 1 > i; i ++){
		if (player_find(i)){
			global.playersfound = i + 1}
		wait(1)}
	
	global.alive = [0, 0, 0, 0]
	
	with(Player){
		if (!"command_effects" in self){
			self.command_effects = [-1, -1, -1, 0, 0, "", 1]		//infhp, infammo, noreload, defaultspeed, acccuracy, bindsummon arguments, damage multiplier
			self.command_effects[3] = self.maxspeed
			self.command_effects[4] = self.accuracy}
		
		if ("command_effects" in self){
			if (self.my_health > 0){
				alive[self.index] = 1}
			
			if (alive[self.index] == 1 && array_length_1d(string_split(self.command_effects[5], " ")) == 3 && button_pressed(self.index, "horn")){
				var args = string_split(self.command_effects[5], " ")
				var numarg1 = real(args[0]) - 1
				var numarg3 = real(args[2])
				
				repeat(numarg3){
					instance_create(mouse_x[numarg1], mouse_y[numarg1], asset_get_index(args[1]))}
				}
			
			with(projectile){
				if (instance_exists(self.creator) && self.creator == other && !"multiplied" in self && "damage" in self){
					self.multiplied = 1
					self.damage *= other.command_effects[6]}
				}
			
			if (global.reset_on_game_start[3] != -1 && global.reset_on_game_start[5] == 0){
				if (self.wep != global.reset_on_game_start[3] && self.wep != 0 && alive[index] == 1){
					if (player_get_race_id(self.index) == 7){
						self.wep = global.reset_on_game_start[3]
						self.bwep = global.reset_on_game_start[3]}
					
					else{
						self.wep = global.reset_on_game_start[3]
						self.bwep = 0}
					
					if (floor(typ_amax[weapon_get_type(wep)] / 4) > ammo[weapon_get_type(wep)]){
						ammo[weapon_get_type(wep)] = floor(typ_amax[weapon_get_type(wep)] / 2)}
					
					if (string_count("ultra", string_lower(weapon_get_name(wep)))){
						GameCont.rad += 50
						}
					}
				}
			
			if (global.reset_on_game_start[5] == 1 && global.reset_on_game_start[7] != "") || (global.temprandommode == 1 && global.reset_on_game_start[7] != ""){
				if (global.combined != global.reset_on_game_start[7] && GameCont.area != 100 && alive[index] == 1){
					global.reset_on_game_start[7] = global.combined
					var wepmodcheck = mod_get_names("weapon")
					if (array_length_1d(wepmodcheck) > 0){
						var randomchoice = choose("mod", "vanilla", "vanilla", "vanilla")}
					
					else{
						var randomchoice = "vanilla"}
					
					if (randomchoice == "vanilla"){
						global.reset_on_game_start[3] = irandom_range(1,125)
						while (global.reset_on_game_start[3] == 108 || global.reset_on_game_start[3] == 109){
							global.reset_on_game_start[3] = irandom_range(1,125)}
						}
					
					if (randomchoice == "mod"){
						global.reset_on_game_start[3] = wepmodcheck[irandom_range(0, array_length_1d(wepmodcheck) - 1)]}
					trace("For this level, the only usable weapon is " + weapon_get_name(global.reset_on_game_start[3]) + ".")}
				
				if (self.wep != global.reset_on_game_start[3] && self.wep != 0 && alive[index] == 1){
					if (player_get_race_id(self.index) == 7){
						self.wep = global.reset_on_game_start[3]
						self.bwep = global.reset_on_game_start[3]}
					
					else{
						self.wep = global.reset_on_game_start[3]
						self.bwep = 0}
					
					if (floor(typ_amax[weapon_get_type(wep)] / 4) > ammo[weapon_get_type(wep)]){
						ammo[weapon_get_type(wep)] = floor(typ_amax[weapon_get_type(wep)] / 2)}
					
					if (string_count("ultra", string_lower(weapon_get_name(wep)))){
						GameCont.rad += 50
						}
					}
				}
			
			if (global.reset_on_game_start[2] == 1){
				GameCont.rad = 600 + GameCont.radmaxextra}
			
			if (global.reset_on_game_start[1] == 1){
				global.reset_on_game_start[1] = 2
				wait(30)
				GameCont.skillpoints = 0
				GameCont.endpoints = 0}
			
			if (global.reset_on_game_start[0] == 1){
				with(WantVan){
					instance_destroy()}
				with(WantPopo){
					instance_destroy()}
				with(IDPDSpawn){
					instance_destroy()}
				}
			
			if (self.command_effects[0] == 1){
				self.my_health = self.maxhealth}
			
			if (self.command_effects[1] == 1){
				self.infammo = 5
				self.ammo[1] = self.typ_amax[1]
				self.ammo[2] = self.typ_amax[2]
				self.ammo[3] = self.typ_amax[3]
				self.ammo[4] = self.typ_amax[4]
				self.ammo[5] = self.typ_amax[5]
				if (player_get_race_id(self.index) == 12){
					self.rogueammo = 3}
				}
			
			if (self.command_effects[2] == 1){
				self.reload = 0
				self.breload = 0
				self.can_shoot = 1
				self.bcan_shoot = 1}
			}
		}
	
	with(enemy){
		if (global.reset_on_game_start[4] != ""){
			if (!instance_is(self, global.reset_on_game_start[4]) && !instance_is(self, 48) && !instance_is(self, 65) && !instance_is(self, 78)){
				if (!asset_get_index("Grunt") && !asset_get_index("EliteGrunt") && !asset_get_index("Shielder") && !asset_get_index("EliteShielder") && !asset_get_index("Inspector") && !asset_get_index("EliteInspector")){
					if (variable_instance_exists(self, "x") && variable_instance_exists(self, "y")){
						instance_create(self.x, self.y, global.reset_on_game_start[4])
						instance_delete(self)}
					}
				
				else{
					if (variable_instance_exists(self, "x") && variable_instance_exists(self, "y")){
						instance_create(self.x, self.y, global.reset_on_game_start[4])
						instance_destroy()}
					}
				}
			}
		
		if (global.reset_on_game_start[6] == 1 && global.reset_on_game_start[8] != "") || (global.temprandommode == 1 && global.reset_on_game_start[8] != ""){
			if (string(GameCont.area) + "-" + string(GameCont.subarea) != global.reset_on_game_start[8]){
				global.reset_on_game_start[8] = string(GameCont.area) + "-" + string(GameCont.subarea)
				if (global.reset_on_game_start[8] != "7-3" && global.reset_on_game_start[8] != "0-1" && GameCont.area != 100 && GameCont.area != 106){
					var num = irandom_range(0,array_length_1d(global.validrandomenemies) - 1)
					global.reset_on_game_start[4] = asset_get_index(global.validrandomenemies[num])
					trace("All enemies are " + global.validrandomenemies[num] + " for this level.")}
				
				else{
					global.reset_on_game_start[4] = ""}
				}
			}
		}
	
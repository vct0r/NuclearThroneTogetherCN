//Enorht Raelcun
#define init
	global.areaconverted = -1
	global.subareaconverted = -1
	global.difficulty = "NORMAL"
	global.startmutations = 3
	global.maxweaponarea = 12
	global.ammomultiplier = 0.75
	trace("Type /backwardspresets for a list of difficulties.")

#define game_start
	with(Player){
		if (global.difficulty != "THISISFINE"){
			self.wep = irandom_range(1, 125)
			self.bwep = irandom_range(1, 125)
		
			self.ammo[weapon_get_type(self.wep)] = floor(self.typ_amax[weapon_get_type(self.wep)] * global.ammomultiplier)
			while (self.wep == 108 || self.wep == 109 || self.wep == 32 || self.wep == 46 || self.wep == 48 || self.wep == 56 || self.wep == 81 || self.wep == 82 || self.wep == 104 || self.wep == 115 || self.wep == 120 || self.wep == 121 || weapon_get_area(self.wep) > global.maxweaponarea){
				self.wep = irandom_range(1, 125)
				self.ammo[weapon_get_type(self.wep)] = floor(self.typ_amax[weapon_get_type(self.wep)] * global.ammomultiplier)}
			
			self.ammo[weapon_get_type(self.bwep)] = floor(self.typ_amax[weapon_get_type(self.bwep)] * global.ammomultiplier)
			while (self.bwep == 108 || self.bwep == 109 || self.bwep == 32 || self.bwep == 46 || self.bwep == 48 || self.bwep == 56 || self.bwep == 81 || self.bwep == 82 || self.bwep == 104 || self.bwep == 115 || self.bwep == 120 || self.bwep == 121 || weapon_get_area(self.bwep) > global.maxweaponarea){
				self.bwep = irandom_range(1, 125)
				self.ammo[weapon_get_type(self.bwep)] = floor(self.typ_amax[weapon_get_type(self.bwep)] * global.ammomultiplier)}
			
			if (string_count("ultra", string_lower(weapon_get_name(self.wep))) || string_count("ultra", string_lower(weapon_get_name(self.bwep)))){
				GameCont.rad += 50}
			}
		
		else{
			self.wep = 1
			self.bwep = 1
			self.ammo[1] = floor(self.typ_amax[1] * global.ammomultiplier)}
		}
	
	global.randommutations = ds_list_create()
	
	while (global.startmutations > ds_list_size(global.randommutations)){
		var randomnum = irandom_range(1, 29)
		if (!skill_get(randomnum)){
			ds_list_add(global.randommutations, randomnum)
			skill_set(randomnum, 1)}
		}
	
	ds_list_destroy(global.randommutations)
	
	if (global.difficulty = "THISISFINE"){
		GameCont.level = 10
		wait(30)
		GameCont.skillpoints = 0
		GameCont.endpoints = 0}

#define chat_command
	switch(argument0){
		case "backwardspresets":{
			trace("---")
			trace("/backwardscakewalk - Start with seven mutations, any two weapons, and full ammo.")
			trace("/backwardseasy - Start with five mutations, weapons from 0-1-L1 and before, and full ammo.")
			trace("/backwardsnormal - Start with three mutations, weapons from 6-1-L0 and before, and 3/4 ammo.")
			trace("/backwardshard - Start with one mutation, weapons from 4-1-L0 and before, and 3/4 ammo.")
			trace("/backwardschallenge - Start with no mutations, weapons from 2-1-L0 and before, and 1/2 ammo.")
			trace("/backwardsthisisfine - Start with no mutations (ever), two revolvers, and 1/2 ammo.")
			trace("SET THE DIFFICULTY BEFORE STARTING A RUN!")
			trace("---")
			
			return true}
		
		case "backwardscakewalk":{
			if (!player_find(0) && !player_find(1)){
				global.difficulty = "CAKEWALK"
				global.startmutations = 7
				global.maxweaponarea = 20
				global.ammomultiplier = 1
				
				trace("Backwards' difficulty has been set to " + global.difficulty + ".")}
			
			else{
				trace("The difficulty can only be set before the run begins.")}
			
			return true}
		
		case "backwardseasy":{
			if (!player_find(0) && !player_find(1)){
				global.difficulty = "EASY"
				global.startmutations = 5
				global.maxweaponarea = 16
				global.ammomultiplier = 1
				
				trace("Backwards' difficulty has been set to " + global.difficulty + ".")}
			
			else{
				trace("The difficulty can only be set before the run begins.")}
			
			return true}
		
		case "backwardsnormal":{
			if (!player_find(0) && !player_find(1)){
				global.difficulty = "NORMAL"
				global.startmutations = 3
				global.maxweaponarea = 12
				global.ammomultiplier = 0.75
				
				trace("Backwards' difficulty has been set to " + global.difficulty + ".")}
			
			else{
				trace("The difficulty can only be set before the run begins.")}
			
			return true}
		
		case "backwardshard":{
			if (!player_find(0) && !player_find(1)){
				global.difficulty = "HARD"
				global.startmutations = 1
				global.maxweaponarea = 8
				global.ammomultiplier = 0.75
				
				trace("Backwards' difficulty has been set to " + global.difficulty + ".")}
			
			else{
				trace("The difficulty can only be set before the run begins.")}
			
			return true}
		
		case "backwardschallenge":{
			if (!player_find(0) && !player_find(1)){
				global.difficulty = "CHALLENGE"
				global.startmutations = 0
				global.maxweaponarea = 4
				global.ammomultiplier = 0.5
				
				trace("Backwards' difficulty has been set to " + global.difficulty + ".")}
			
			else{
				trace("The difficulty can only be set before the run begins.")}
			
			return true}
		
		case "backwardsthisisfine":{
			if (!player_find(0) && !player_find(1)){
				global.difficulty = "THISISFINE"
				global.startmutations = 0
				global.maxweaponarea = 0
				global.ammomultiplier = 0.5
				
				trace("Backwards' difficulty has been set to " + global.difficulty + ".")}
			
			else{
				trace("The difficulty can only be set before the run begins.")}
			
			return true}
		
		
		}

#define step
	with(GameCont){
		if (!"start" in self){
			self.start = 1
			GameCont.area = 0
			GameCont.subarea = 1
			GameCont.loops = 0
			global.beginthrone2 = 0
			with(Player){
				if (global.beginthrone2 == 0){
					global.beginthrone2 = 1
					instance_create(self.x, self.y, BecomeNothing2)
					var update = instance_create(self.x, self.y, Maggot)
					update.my_health = 0}
				}
			}
		}
	
	if (instance_exists(Portal) || instance_exists(BigPortal)){
		with(Portal){
			if (!"setconverted" in self){
				self.setconverted = 1
				global.areaconverted = 0
				global.subareaconverted = 0}
			}
		
		with(BigPortal){
			if (!"setconverted" in self){
				self.setconverted = 1
				global.areaconverted = 0
				global.subareaconverted = 0}
			}
		}
	
	if (8 > GameCont.area) && (4 > GameCont.subarea){
		if (8 > GameCont.area){
			if (GameCont.area != 0 && global.areaconverted == 0 && GameCont.subarea == 1){
				global.areaconverted = 1
				GameCont.area --}
			
			if (GameCont.area == 0 && global.areaconverted == 0 && GameCont.subarea == 1){
				global.areaconverted = 1
				GameCont.area = 7}
			
			else{
				global.areaconverted = 1}
			}
		
		if (4 > GameCont.subarea && global.areaconverted == 1){
			if (GameCont.subarea == 3 && global.subareaconverted == 0){
				global.subareaconverted = 1
				GameCont.subarea = 1}
			
			if (GameCont.subarea == 2 && global.subareaconverted == 0){
				global.subareaconverted = 1
				GameCont.subarea = 0}
			
			if (GameCont.subarea == 1 && GameCont.area != 0 && global.subareaconverted == 0){
				global.subareaconverted = 1
				if (GameCont.area == 2 || GameCont.area == 4 || GameCont.area == 6){
					GameCont.area --
					GameCont.subarea = 3}
				
				else{
					GameCont.subarea = 2}
				}
			
			if (GameCont.area == 0 && global.subareaconverted == 0){
				global.subareaconverted = 1
				GameCont.area = 7
				GameCont.subarea = 3}
			}
		}
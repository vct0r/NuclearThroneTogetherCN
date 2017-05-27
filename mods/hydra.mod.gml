//Hydra by Morty
#define init
trace('Hydra (type /hydra_help)');
global.split = 2
global.boss_split = 0
global.times_split = 1
global.worms_split = 0
global.radsplit = 1

#define chat_command
switch(argument0)
{
	case "hydra_help":
	{
		trace('/set_split_count [n] - enemies will split into n other enemies')
		trace('/set_split_times [n] - enemies will split n times')
		trace('/set_boss_split [n] - 0 = Bosses cant split')
		trace('/set_worms_split [n] - 0 = Anything maggot related cant spawn')
		trace('/set_rad [n] - 0 = Clones cant drop rads')
		return 1
	}
	case "set_split_count":
	{
		global.split = int64(string_upper(argument1))
		trace('Enemies will split in '+string(global.split)+' other enemies')
		return 1
	}
	case "set_split_times":
	{
		global.times_split = int64(string_upper(argument1))
		trace('Enemies will now split '+string(global.times_split)+' times')
		return 1
	}
	case "set_boss_split": //eh...
	{
		global.boss_split = int64(string_upper(argument1))
		if global.boss_split == 0
			trace('Bosses cant split')
		else
			trace('Blame yourself...')
		return 1
	}
	case "set_worms_split": //WAERNING: GAEM BRAEKING!!!
	{
		global.worms_split = int64(string_upper(argument1))
		if global.worms_split == 0
			trace('Maggots cant split')
		else
			trace('Blame yourself...')
		return 1
	}
	case "set_rad":
	{
		global.radsplit = int64(string_upper(argument1))
		if global.worms_split == 0
			trace('Clones cant drop rads')
		else
			trace('Clones can drop rads')
		return 1
	}
}

#define step
with(enemy)
{
	
	if "splitable" not in self
		splitable = 1
	if "split_id" not in self
		split_id = 0
	
	if(object_index == Nothing //throne, lol
	|| object_index == Nothing2) //thrones are banned from splitting cuz nothing interesting happens
		splitable = 0
	
	if(global.boss_split = 0)
		if(object_index == BanditBoss
		|| object_index == ScrapBoss
		|| object_index == LilHunter
		|| object_index == FrogQueen
		|| object_index == HyperCrystal
		|| object_index == TechnoMancer)
			splitable = 0
	
	if(global.worms_split = 0)
		if(object_index == Maggot
		|| object_index == MaggotSpawn
		|| object_index == BigMaggot
		|| object_index == RadMaggot)
			splitable = 0
	
	if splitable == 1 and split_id < global.times_split and my_health <= 0
		for(i=0;i<global.split;i++)
			with(instance_copy(true))
			{
				split_id = other.split_id+1
				if global.radsplit == 0
					raddrop = 0
			}
}

/*
NOTES:
 -Scorpions can split into Golden Scorpions
 -Anything maggot related cant spawn (except Flies)
*/
#define init
global.hammerkey = "key1";
 
#define step
with(Player) if(hammerhead > 0 || "_hammerhead" in self && _hammerhead > 0){
	 // Disable Some Functions Tied To Normal Keys:
	if(button_check(index, global.hammerkey)){
		for(var i = 1; i <= 6; i++) if(global.hammerkey = "key" + string(i)){
			with(EmoteIndicator) if(image_index = i){
				instance_destroy();
			}
		}
		if(global.hammerkey = "horn"){
			if(race = "venuz") sound_stop(sndVenuz);
		}
	}

	 // Button Toggleable Hammerhead:
	if("_hammerhead" in self && button_check(index, global.hammerkey)){
		if(hammerhead = 0){
			hammerhead = _hammerhead;
			_hammerhead = 0;
		}
	}
	else if(hammerhead > 0){
		_hammerhead = hammerhead;
		hammerhead = 0;
	}
}
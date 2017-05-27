#define step
with Player if (race == "venuz" && button_check(index,"spec")) {
	wait(0)
	var _t = weapon_get_type(wep);
	var _c = weapon_get_cost(wep);
	var _l = weapon_get_load(wep);
	var _b = 2 * skill_get(5)
	if (weapon_get_auto(wep) && reload <= 0 && ammo[_t] >= ((2 + _b) * _c) && _t != 0){
		repeat(2 + _b) {player_fire(gunangle)};
		reload = ((2 + skill_get(5))* _l) - 1;
		motion_add(180 + gunangle, 4)
		if !skill_get(5){sound_play_pitchvol(sndPopPop,1,.5)};
		if skill_get(5) {sound_play_pitchvol(sndPopPopUpg,1,.5)};
		if (ultra_get("venuz",2)) {
			repeat(1 + skill_get(5)){
				player_fire(gunangle);
				ammo[_t] += _c;
				reload -= _l
			};
			repeat(irandom_range(2,4)){
				with instance_create(x,y,Feather) {
					sprite_index = sprMoney
				};
			}
		}
	}
}
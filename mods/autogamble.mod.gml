#define step
with Player if race = "skeleton" && button_check(index,"spec") {
	wait(0);
	var _t = weapon_get_type(wep);
	var _c = weapon_get_cost(wep);
	var _h = 0;
	if (weapon_get_auto(wep) && reload <= 0) {
		player_fire(gunangle);
		ammo[_t] += _c
		with instance_create(x,y,BloodGamble) {image_angle = other.gunangle};
		sound_play(sndBloodGamble)
		if (ultra_get(14,2)) {reload *= .2};
		if (irandom(typ_ammo[_t] - 1) <= _c) {_h = 1};
		if (skill_get(5) && irandom(2) = 1) {_h = 0};
		if (_h = 1){my_health -= 1}
	}
}
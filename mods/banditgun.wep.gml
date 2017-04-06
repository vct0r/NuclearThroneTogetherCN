#define init
global.sprWep = sprBanditGun;

#define weapon_sprt
return global.sprWep;

#define weapon_name
return "Bandit Gun"

#define weapon_text
return "Pew Pew";

#define weapon_type
return 1;

#define weapon_auto
return false;

#define weapon_load
return 100;

#define weapon_cost
return 1;

#define weapon_area
return 1;

#define weapon_swap
return sndSwapPistol;

#define weapon_fire
// weapon' sound:
sound_play_gun(sndPistol, 0.2, 0.3);
// weapon shift, camera offset, screenshake:
weapon_post(0, 0, 0);

repeat (1)
{
wait(0)
// creating the actual projectile:
with (instance_create(x, y, EnemyBullet1)) {
speed = 7;
    creator = other;
    team = other.team;
    direction = other.gunangle + random_range(4, -4);
    image_angle = direction;
}}


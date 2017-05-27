#define init
global.sprHorrorGun = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAABEAAAANCAYAAABPeYUaAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAD1SURBVHjanJKxakIxFIa/c69ISuF26+xjCG7Fwb7QHXRw63Bfws1X0EHcBN+hy527lCsUhDacDiVpEnNt8YcQkpN8/Cf5RVXpk4hcFFVV0r3Btcsza6gztRQ0yF3eW0MD1MBiOQTg/tnwU7sEiWtHRHRmjQfWQLO68+uutR40H594Ks++tSIFOPuL5ZCutR7yMCr52JwBeDlW7K3xzoscIFTXWg8LQaGKyH5QeH/99OMvFaoq2zKm18BorREwbK3XSZPMJKDwcefjU3Qu+h2Xjf/o61gBsJu8/ebEfVcupTlND1V/YnOx7kv19PAYt3OLnOvvAQBEanauUDvUUwAAAABJRU5ErkJggg==", 4, 3);

#define weapon_name
return "HORROR";

#define weapon_sprt
return global.sprHorrorGun;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 0.5;

#define weapon_cost
return 0;

#define weapon_swap
return sndHorrorPortal;

#define weapon_area
return 25;

#define weapon_text
return "SQUEEZE IT";

#define weapon_fire

sound_play(sndHorrorBeam)
wkick = 8

weapon_post(2, -20, 5);

if GameCont.rad > 0{
		GameCont.rad -= 1
		ammo[1] -= 1
		repeat (3){
		with instance_create(x,y,HorrorBullet){
			motion_add(point_direction(x,y,mouse_x,mouse_y)+(random(4)-2)*other.accuracy,10+random(0))
			image_angle = direction
			team = other.team
			creator = other
		}
	}
}


else{
    sound_play(sndHorrorEmpty)
	reload = 15;
    with instance_create(x,y,PopupText)
    {
        mytext = "NOT ENOUGH RADS"
    }
}
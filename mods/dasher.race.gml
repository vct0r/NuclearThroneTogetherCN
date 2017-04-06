#define init
//load the sprites in! im pretty sure YAL made a base64 plugin for paint.net to get this
global.spr_idle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAATgAAAAYCAYAAABupOHoAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAL5SURBVHhe7ZlBjtNAEEWznRtwAVbDDRDiCNxhxIItB2HDHZBYsUccLpNfdrXK7Xa5y3EFWvwnfbnjVL1yO4k1ggshhBBCCCGEEEJInOucLNSfNeNR158F/T7qz5yRzvAbGIzypfn++a1kfn0WxY8k+gH9a0b1q2cR+BP2YElxW2nmBtQ7or92n+G/vrx7I8G6kTPI8Nt++tfY/hH9oDwH4HdmaI7Q8pz2/LGSrJuktLyaM2h5NffSctocZeH58vWb5NfvPxKszftRbK9kx49EsF9CyY4/Cv0+2X7QPcM8O6KUGR0PUCRE5k2yfSX0F+Te2w/VejU4f+DLI+5EP6DfZ3Q/ODIDiSAzcETgtzOwxnn4j+yDH/I2Up/pt2543n/8JP7rzw/XH0/Pska0Fkc0dlDqe/0mEej3GdlfenpnBL+jiu0TF+bY4DyuQa/jlhAjfwgg0y/1PX5z83v9Cze8CGbcTogba7326AMOgZv+JlJLv4v0ZM9A1A8X/PBtPUAjM4o8aQNSS3+TUoujzoAHPhvMQ51JD8X7j/l7od8n2w8eOgNreBA4byeavy8EazTvkb2B/86POhyl22fhxFpfWz/WWoujdPZDvw/9+2TPWHhrt6b6/YZmpG9gYL/UJ/m1duW3c2zm+giuX0M//Q7ZM1ZurE/6/QrSVA+po+/P9RHo30brS//WDFMbZeVvzdA6NASh32d0P8icsXDXTo2+P9eHWQzR1EO0Dg1BVv7aPbof57QODQHKn99b123cR6Dfh/590veAwGFTz9A6NER5+IdQzxnJX7vv9Itb41z3ETeg34f+fbJniBfH2t2YcYiHbGB0P/4tIMFf3Oq3s+watVNLiOKwzlZQO7WEkF76N5Hegf1A+rP9moTfr7C4SXYz9hzqpvIwI/tLP/1Nmn4b+of2g5XLZgD/NAD/a4F1neq9I9DvQ78P/T707yBPSRynlwu893qh34d+H/p96N/BE9wtv0G/D/0+9PvQTwghhBBCCCGE/G0ul1cvJ+8a8r1WZgAAAABJRU5ErkJggg==", 13, 12, 12);
global.spr_walk = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAYAAAAVpXQNAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALySURBVGhD7VVLjtVAEHtbbsAFWMENEOII3AGxYMtB2MwdkFixRxzuEVfaJafy7Z80kdqSlaS7yuW482YeAwMDAwMDA63wFA7s47Y59TAdw3i+fHvXek5LrSPQd495qt0jI6K5phptZZwarvv1w1tdU5Yi9tbq7YG6RuTT8HAX2gcZgTWI/dWaKtDlcEPQxu8/fhr//P1nxL3sX0Gs1eeWB6uwfDodbm5GYClco0VOPQ43wmZo8KpPYl1qzhBf/uxgwVKstG6SEcHa2L/FbPQ0rvB+6H38/MXmPH9/ev56897uwyFcmXP546/13jkj140Z4YpZzAlrWj/xKhZ9ezklZqPH4QJeD33OgD7DmRZshr5E+MtyhM2Djd6xrjUTS7DKiJ5bHC7fYysjzakgI2D3B6D+sS41l+BNW8anhZrDJdy8hsQXUIYDOILuu3dq4DottPAOWA99414z0lmvLCOF1dM/dag5LZr/Eu3exgnXxhzO0jkF4VsddXEPjxpMhbbC/fIavZOvNSOQ2rhvnVMP4xHWF+couQem+jN4n/arb7L2YEHqq9/GGQGrOVvEPmrnllN4D69gy5ysgcJqVMn9VF+CxZy9WanuKlZauO9xsOCRb5D7qb4EizlKnZPqcrDSwX3LnKyJQ+IwknVoKIB/4VvaINaxn3gFrnekSab6UixmkXFeqitFTka52PVMch+1c8t19Dhcwvswg4xz8Ix1/ipSzxVYLfpJ1SVTXQ1yMqrBIieS74b9uSwb7l0Z3yHVZWNlVkXxjBphDlwXHwfJZ92LdeidJQ5hPbhuBcNn7CfWYOExzqGPubQKpqNZyI+qVH+RE30rJadsuFGQxnHlPWoSS7D6X5vBM7hPeo3eec38y7YF66eWzuGMVNMKPg/66bkG7jV+RDUfDxAD3mItWmopFgeK58gOB7zQB0N+raGzamE6zGPjzItggrjOj7fDWQC93++O+TX9Ud3t5XPR+/3umh9939H7wMDAwMDAOR6P/x9btx2wn0ngAAAAAElFTkSuQmCC", 6, 12, 12);
global.spr_hurt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEgAAAAYCAYAAABZY7uwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHxSURBVFhH5ZmxTsMwEIazMYDEwsDCgtSNN2DgEXgH1IGVN8iMhIQqdWOAtQM7YsmbhfyX/1LHdRzbJXICn3Tq2fH9vt+pEqktpmTz/MpsGpauX3y8vTObhqXrF1VVMZuGpev/zwOqCYdeEg1Ae1n6PBMRZSrIRQ8RBsym6816ZY4HyarPMxARpk5k8QAjBswm64ebSx3bMUhWffoPhmU9xgwYd1Li8elF4vPrWwK5cf2ArPr0HQVLO0IMmHdWm1eQY95Y0yNV3wzMJ+o3FQmwVBjdwGgOzd7e3VNlj3WXj9aHnoI8SZ/1SVBC8BiQZtC8GkDzvgNyPVhT9HFQCvIkfdZHc3VxQoUWnwH9+usnAs3aBmAK6xG/pW9Gon6zOgGWdng3aLbQxmFCjZgmfHcXZNWn5yhY2jFmAGGbsEOvc32PzPpNRSQs6xjdwDKhYZvQdSgwya5P38GwrCPEgD4DXI0jMI/rjB7Z9ek7CpYKu92O2SBiQMM2gTHm9bmB9W1ZS3Z9eo6G5cV2u2U2iDSnoc2qITtHoKYtnYV+2iGxtCjLkpmX3hslMIRZ6NOzwCkn16sVsz2hBnAH8dkO3cxW//TsvDskTh2ANS5CNmCt18Cc9Y9i6g2Wrv83Dgh/beDXe7zzUwKvQjztIeaKZeuXxQ+ycFgvnxH+FgAAAABJRU5ErkJggg==", 3 , 12, 12)
global.spr_dead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAANSURBVBhXY/j//z8DAAj8Av6IXwbgAAAAAElFTkSuQmCCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==", 1, 0, 0);
global.spr_chrg = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEgAAAAYCAYAAABZY7uwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGjSURBVFhH7ZVBTsMwEEWz5QZcgBXcAKEegTsgFmw5CBvugMSqe8ThAn/yZzSxEnfs2BJIftJXXXvmd36TptNgMBj8I2an1njv5v5zArebsBr8/flGxPdH2fRu5c/vYheWHWZ+ursWYb2jWsy7hz+/h4uwvIh0QAvw8vomOn99i7BmTRTz9Grlz8zFsD2M3erplfXDq9x5hNVPqbU/81ZBizAylA+AYe9PjxJi/nyYP65uZe2uMhTB6nv4M28VtMhiw2B4HwDDQwjyuyEBsEYA3A2sy2FeUGt/ZjwErbKsbn99VWFYDO2FUOhb2rOYdw9/ZqyGNiFkIB06DeVDYK31aAxg9T38mbUKWhSxGcJLz1G7tBTR1Z+5w7CtGBtSlYZADVVDV39mD8GWKnaHxx7Ol7JquvozfxaWVmH/LmkIN/yRD7joH31Ib8H8IdhShAyHByWkaw2ka9Qt5cWE/PGK2qUlDnOHYVsYGw7/Jni/JXdWSld/Zi6CrWH8ldtqzp1FEP/M3XHIn5lX8EjglsHtIqqHC6L+XT6DuQVuDQaDv8Y0/QCn4nFyqmqOMwAAAABJRU5ErkJggg==", 3, 12, 12);
global.spr_slct = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAYAAADzoH0MAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAD2SURBVDhP3ZAhDsJAEEXHIvBNk0pqwKIQHIE7EASWg2C4AxZPuABn4QLULf2T/M10mV2agEK8FHb+fzut1E0bvuFfBCJSJC1Z+rmE1Xqj7A9H5XK9KfiN85IkCmwRPLtOwflHQVq2EjxLW4h3u0duE+HQBh/3Opwn88E5N00lKrAfEGXQJ6MEIEORK8ATQRSJ3SIrsHZKUBz9ClyfwRwoIutuMEbA298Ey2qq5pIEM2SQ3S6qgUROu5keUpKKWEYGWeYpETsAvIXgv50zEwXpMEcqHWwAvFIO5KMANru2V/D43St44RK2HL8Bh/YGCzN42nLdtOEFm0fV+JjR/zwAAAAASUVORK5CYII=", 1, 0, 0);
global.spr_car = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACQAAAAYCAYAAACSuF9OAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFiSURBVEhL7ZC9TQUxEIQvI6GKlyEyJMKX0AANIAqgAZqgCRqhteONn+c03h3bF3DJEyN98no9+3O3GK2Bo7RrhpoUqncfQeld3zXfaH14Pq/n1zdnLszeR+yoTdqKeLIBY9dUvQryo1r1VJLsQBKbjryRWItT+1Rf0nRg7x0x74Q54Pw46UV8Iakp0pPEpoz3EP2mPskupPQWYgwQ089c9HdIaor0dE0Z81SQA/ARV8t7JakpcrimGgPE9DMX/czr+4UkW4SYuCUYq88R/UQ8SY0Jpy6EWHMx5j2CvOtnSFo/vn8SyGtzDiCuhtAzq633pPXp5bPw+P61oY1jU7yp9+7+VGAPvPc+RmtrLqk8xoUAihXmoo/DtUesJXyHF7OvK7QqzWhigQN/weXJrD6C2dcVsoph1hC+ESOf9hn9HVXTwNEbRkbLmPyfaLhUfMNdcodpGzQD3srh0mEj/nWrWpZfqAlbWLcCsbkAAAAASUVORK5CYII=", 1, 18, 24);
global.spr_port = sprite_add_base64("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", 1, 20, 243);
global.spr_icon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADoSURBVDhP1VCxDQIxEEvLBixABRsgxAjsgChoGYTmd0CiokcMxncBJ3HkXD7PU74lK4nP9h+4WcMnWrT0Ctbou9NqkpZYwR83Sx2Gt2j2Ddh3gSrMu2XDl5EHSmjny9U/nq+C0Fr+xDjEfwOqwZa9+z6czNjcYCEIDZu0NuSWmtFCoCjFm2GcX8HfFutCg6dVRgSRQ93G33ehkG8WShFYIW+JO4Lb/aHaEBpm8IxtB4ShlrJQCQ0zlo0VAtnIkz8RxF1n/HCMthHMDAyRc3hj5DdySItVgydap6Mo01LMouV/MGw5Wzj3AS1xgSYnXeumAAAAAElFTkSuQmCC", 1, 10, 10);
global.spr_ult[1] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAF6SURBVEhLtZaxSsNQGIUvxcGlOBWK4KZOrr6QOLj6IC7uvoK7COJb2UXSnFtPPPfn5N40UX4+2jS535eEtDStzzZd5PziehbOVQTcojmocwi4A5dQBNwBf8G/BVI/J5+rTHIHHEsW/Qze675FARVz4jGzAk6MiWcPjgqMiTluzaRAS4xxZw+agSj/+D4t4Oerl0u7vhpQeRSrHOPWg9EA5U4MftWHcQ5gAyrna02OcR5QBFLqD430EwMuoh4lByi7u9l2z/dXGbwH3BflGhl7gkC/1ovB7XY9wAjlGhh7gkBy8ritEQYoxzgxSZQpD49P3evb+wC23ZVMCugZU/y122U0whADfNJq9x8UgZqcMIL7PikwJq+FZgUo1EAUE15F6/6DHMAiDZAoVhBonT1YFKg9/8QGdFul/ByviwMqUzQw6RbhMdWFDhdFwAmV/L+I34NaAHD/0QF8/adeBcF2KwB5EdCfCRWTOfIcgJw/ZIxEKG8FVHxg0+0BHKq783U7HgcAAAAASUVORK5CYII=", 1, 12, 16);
global.spr_ult[2] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHmSURBVEhLjZaxSgNBFEXTiWCwCgTBRlAQrYRUEgR/ID8gFmIhdlb+hDb+gYVgZS+Cv2W6MXfC2dx9O7NZ4bjvvbnv3p1okdHqJ8F4f5KhPzg8ybimhnS+a15d8elsnuaLm858CJ1dNQyoSwHMIppv2d2YiCgqhdWIu/lZMqgFqKYHZqKkzx+RmrjkIuohdPSl5VoAtVCNnlnUZ2hqImo3B81EY1bYXT03hxBFscYcPbOoz08/hL4A15Xo6H0gVEeR1/QRzaM+8/j+m4QaF7MA6EqgKe6e3b4k4cIo0hk6sbN3lLm4fm52qy/ni7wRMHONwIwAEXehFRDRW5bm4AE1egOaa1bo09lZ9xC2hfSZN/1sOk5wdz5t0REH4pl6n2UPGb/dH2f6QobgxuyOVGBeChAsbqO4J3M1NXMh4cPTa7q8WuRn+pynj92zZlYyZy/fQHgAoY6MmoDVYi2Aj1uzr++fNJJIqBFR6GGuA8xdL3T2t1yuA2hK5o7O3Fy4nn1u2gpgUFp0NJdWlDT4yUt1DlAiQxGXhsDbEwAj/+P5AdRuEvGbifwftGZd+CHmhPN2NWPMzXTzVVK/at8//XaAIaZuzHdZaAIIcTygjz7zVsDQEL8NAXHPPVsBgDAGuDl4QNdrkv4BlJYCESrVWFsAAAAASUVORK5CYII=", 1, 12, 16);
//ultras cant be tracked atm, gotta make my own thing to track them
global.ultra[1] = 0;
global.ultra[2] = 0;



#define race_soundbank
//givin it robot sounds
return 8;

#define create
//charge variable to stop active
charge = 0;
//since im having trouble setting this up with wait, i made my own timer
timer = 0; 

//for ultra B, so the game knows were carrying the car
carrying = 0;

//set the sprites. spr_chrg is the only one that isnt a default character sprite
spr_idle = global.spr_idle;
spr_walk = global.spr_walk;
spr_hurt = global.spr_hurt;
spr_dead = global.spr_dead;
spr_chrg = global.spr_chrg;

#define step
if my_health <= 0{ //death explosion, because im too lazy to actually make a sprite for death
	instance_create(x,y,Explosion);
	sound_play(sndExplosion);
}

if global.ultra[2] = 1{
	with Car{ //collect cars!!
		if point_distance(x,y,other.x,other.y) < 12 && other.carrying = 0
		{
			sound_play(sndSnowBotPickup);
			other.charge = 0;
			other.carrying = 1;
			other.timer = 0;
			instance_change(Wind,false);
		}
	}
	with enemy{ //cool car passive thing
		if my_health <= 0 && random(5) < 1 && !(object_index = Car and object_index = RadChest and object_index = VenuzCar and object_index = VenuzCarFixed)
		{
			instance_create(x,y,Car);
		}
	}
}



if button_pressed(index,"spec") and charge = 0{ //active stuff
	if global.ultra[2] = 0 or carrying = 0 //make sure you cant charge while throwing cars
	{
		charge = 1;
		timer = 60;
		spr_walk = spr_chrg;
		
		if global.ultra[1] = 1{ //CHARGE SPAWNS BULLETS
			sound_play(sndWolfRoll);
			for (i = -15; i <= 15; i += 15) if (fork()){
				with instance_create(x,y,EnemyBullet1){
					motion_add(point_direction(other.x,other.y,mouse_x[other.index],mouse_y[other.index])+other.i,8);
					team = 2;
					image_angle = direction;
				}
				exit;
			}
		} else{ //sound for active
			sound_play(sndSnowBotSlideStart);
		}
	}
	else if carrying = 1 //THROW A CAR HELL YEAH
	{
		sound_play(sndSnowBotThrow)
		with instance_create(x,y,CarThrow)
		{
			team = 2;
			motion_add(point_direction(other.x,other.y,mouse_x[other.index],mouse_y[other.index]),12)
		}
		carrying = 0;
	}
}

with enemy{
	//make sure contact damage is decreased, by creating a variable if one does not exist so it only decreases once
	if ("meleedamage" not in self){meleedamage = 0;}
	
	if ("pass" not in self){
		pass = 0;
		if meleedamage > 0
		meleedamage -= 1;
		cdmg = meleedamage;
	} else { //for snowbots since their contact damage changes
		if meleedamage != cdmg{
			if meleedamage > 0
			meleedamage -= 1;
			cdmg = meleedamage;
		}
	}

	//damage enemies close enough. jw did a bad with damaging stuff
	if other.charge = 1 && point_distance(x,y,other.x,other.y) < 16{
		sprite_index = spr_hurt;
		image_index = 0;
		sound_play(snd_hurt);
		my_health -= GameCont.level * (1*max(1,skill_get(5)*2)); //makes sure you dont have 0 damage
		motion_add(direction,4);
	}
}

//active code
if charge = 1{
	motion_add(point_direction(x,y,mouse_x[index],mouse_y[index]),3); //move forward
	timer -= 1;
	
	//cute lil trail!
	if skill_get(5) = 0
	instance_create(x,y,Dust);
	else
	instance_create(x,y,Smoke);
	
	//stop the charge with the ultra
	if global.ultra[1] = 1 && button_released(index,"spec"){
		charge = 0;
		timer = 0;
	}
	//charge timer stuff
	if timer = 0
	charge = 0;
} else { //visual stuff
	spr_walk = global.spr_walk;
}

//make sure youre not charging when u leave
if instance_exists(Portal){
	charge = 0;
	timer = 0;
}

#define draw
//car code
if carrying = 1
draw_sprite_ext(global.spr_car,0,x,y,-1,1,0,c_white,1);

//menu sprites and stuff
#define race_portrait
return global.spr_port;

#define race_mapicon
return global.spr_icon;

#define race_menu_button
sprite_index = global.spr_slct;

//name, abilities, starting weapon, and throne butt
#define race_name
return "Dasher";

#define race_text
return "Less contact damage taken#Charge";

#define swep
return 1;

#define race_tb_text
return "double charge damage";

#define race_ultra_button
sprite_index = global.spr_ult[argument0];

#define race_ultra_name
switch(argument0){ //ultra names
	case 1: return "Sonic Speed";
	case 2: return "Car Mechanic";
}

#define race_ultra_text 
switch (argument0){ //ultra words
	case 1: return "CHARGE STOPS WHEN NOT RIGHT-CLICKING#CHARGE SHOOTS BULLETS"; //ITS A MEME OK
	case 2: return "AUTO-PICKUP CARS WHILE CHARGING#CHARGE AGAIN TO THROW THEM#KILLS SPAWN CARS"; //probably bad
}

#define race_ultra_take
//make sure you get the ultras
global.ultra[argument0] = 1;

#define race_ttip
return["prancer", "for glory!", "warm", "bundled up", "christmas jingles", "payback", "charge damage scales with#your level"];//i really love tips ok

#define game_start
//reset ultras
global.ultra[1] = 0;
global.ultra[2] = 0;
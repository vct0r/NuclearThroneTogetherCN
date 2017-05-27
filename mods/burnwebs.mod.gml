#define step

with SnowFloor if place_meeting(x,y,Flame)
	{
	instance_destroy()
	}
	
with Floor if styleb == 1 && place_meeting(x,y,Flame) && (GameCont.area = 4|| GameCont.area = 5|| GameCont.area = 104)
	{
	styleb = 0
	if GameCont.area == 4 {sprite_index = sprFloor4}
	if GameCont.area == 5 {sprite_index = sprFloor5}
	if GameCont.area == 104 {sprite_index = sprFloor104}
	sound_play(sndBurn)
	repeat(random(16))
	instance_create(x+random_range(-16,16)+16,y+random_range(-16,16)+16,GroundFlame)
	}
#define step
if GameCont.crown = 2{
	with MeatExplosion{
		cod_execute();
	}
	
	with PopoExplosion{
		cod_execute();
	}
}

#define cod_execute
if ("split" not in self){
	split = 1
	repeat(2)
	with instance_create(x+lengthdir_x(sprite_width/2,random(360)),y+lengthdir_y(sprite_height/2,random(360)),self.object_index){
		split = 1;
		image_xscale = 0.5; image_yscale = 0.5; team = other.team;
		if other.object_index = PopoExplosion{mask_index = mskExplosion;}
		if other.object_index = MeatExplosion{mask_index = mskSmallExplosion;}
	}
}
// /loadmod mods/enemyallies.mod.gml

#define step
with(enemy)
{
	if(instance_exists(self)
	&& object_index != Wind
	&& object_index != BigMaggotBurrow
	&& my_health <= 0
	&& !(object_index == CustomEnemy && "name" in self && name == "GunAlly")
	&& object_index != Nothing
	&& object_index != Nothing2
	&& object_index != BanditBoss
	&& object_index != ScrapBoss
	&& object_index != LilHunter
	&& (object_index == Bandit
	|| object_index == MeleeBandit
	|| object_index == JungleBandit))
	{
		if(!irandom(GameCont.loops))
		{
			with(instance_create(x, y, Ally))
			{
				if("spr_idle" in other) spr_idle = other.spr_idle;
				if("spr_walk" in other) spr_walk = other.spr_walk;
				if("spr_hurt" in other) spr_hurt = other.spr_hurt;
				if("spr_dead" in other) spr_dead = other.spr_dead;
				if("snd_hurt" in other) snd_hurt = other.snd_hurt;
				if("snd_dead" in other) snd_dead = other.snd_dead;
			}
			image_speed = 10;
			//instance_change(Wind, 0);
			var _x = x;
			var _y = y;
			var _spr_dead = spr_dead;
			wait(1);
			with(Corpse)
			{
				if(sprite_index == _spr_dead)
				{
					instance_destroy();
				}
			}
		}
	}
}

// This shit was made by the god KONAMI KODE! NO ONE ELSE... except for blaac, the creator of the oh-so-amazing eternal labs mod 

#define init
global.spr_idle = sprSpookyBanditIdle
global.spr_hurt = sprSpookyBanditHurt
global.spr_dead = sprSpookyBanditDead
global.spr_walk = sprSpookyBanditWalk

#define step
with (Bandit) if ("transformcheck" not in self)
    {
	transformcheck = 1
   if random(100) < 3.5 // 3.5 Percent Chance, I believe.
        {
		spr_idle = global.spr_idle
		spr_hurt = global.spr_hurt
		spr_dead = global.spr_dead
		spr_walk = global.spr_walk
        }
    }
	
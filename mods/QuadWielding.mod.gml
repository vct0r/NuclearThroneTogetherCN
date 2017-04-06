//Written by jsburg

//Creating a list of projectiles to not double
#define init
global.dontdupe[0] = LaserCannon
global.dontdupe[1] = PlasmaBig
global.dontdupe[2] = PlasmaHuge
global.dontdupe[3] = FlakBullet
global.dontdupe[4] = SuperFlakBullet
global.dontdupe[5] = CustomProjectile
global.dontdupe[6] = Laser
global.dontdupe[7] = Lightning

#define step
//Adding a variable to the projectiles on the dontdupe list
for(i = 0; i < array_length_1d(global.dontdupe); i++){
	with(global.dontdupe[i]) dontdupe = 1;
}

if(ultra_get(7,1)){ //Checking for Ambidextrious
	with(Player){
		if(race = "steroids") { //Only affects Steroids
			with(projectile) if (creator = other && "duped" not in self) { //Only affects projectiles created by Steroids, that haven't been duped
				duped = 1;
				var _c = creator;
				var _p = self
				if(instance_is(self, Laser)){ //Special case for lasers, since they act weirdly with instance_clone
					with(_c){
						with instance_create(x,y,Laser){
							damage =(_p.damage*(1/2)) //Deals half the damage of the original laser
							duped = 1;
							team = _c.team;
							alarm0 = 1;
							image_angle = _p.image_angle + (random_range(-7,7) * _c.accuracy); //Uses image_angle instead of direction
							creator = _c;
							image_yscale = (_p.image_yscale*(2/3)) //The laser lasts for 2/3 the time of the original laser
						}
					}
				};
				if(instance_is(self,Lightning)){ //Special case for lasers, since they act weirdly with instance_clone
					with(_c){
						with instance_create(x,y,Lightning){
							damage = _p.damage*.5; //Has half the damage of the original lightning rail
							duped = 1;
							team = _c.team;
							alarm0 = 1; //Makes sure the lightning shoots, I think, I didn't actually try removing it, it's important for lasers tho
							creator = _c;
							ammo = _p.ammo*(2/3); //Has 2/3 the length of the orignial lightning rail
							image_angle = _p.image_angle + (random_range(-7,7) * _c.accuracy); //Uses image_angle instead of direction
						}
					}
				};
				if("dontdupe" not in self) { //Everything that isn't on the dontdupe list gets doubled here
					with instance_copy(true){
						direction += (random_range(-7,7) * _c.accuracy); //Adding some spread to the doubled projectile (the initial direction is handled by instance_clone)
						image_angle = direction;
						team = _c.team;
						creator = _c;
						duped = 1; //Prevents the doubled projectile from being doubled again
						damage = round(damage/3) //The doubled projectile does ~1/3 the damage of the original
						image_xscale *= .75;
						image_yscale *= .75;
						omega = 1; //Prevents weird behavior with Omega Weapons and its multiplicative enchants
						if("index" in other) index = other.index; //Literally only for Nuke Launchers and their mouse homing
					}
				}
			}
		}
	}
}
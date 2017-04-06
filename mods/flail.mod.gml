//add this code to something to add chains
//create_chain creates a new chain from objects a to b
//it will follow those object
//future updates will allow the chain to pull the objects back together
//change the thing in chain_proj, chain_enem, and chain_wall to define what
//happens when it hits a projectile/wall/enemy
#define init
global.chainsprite = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAGCAYAAADKfB7nAAAEDWlDQ1BJQ0MgUHJvZmlsZQAAOI2NVV1oHFUUPrtzZyMkzlNsNIV0qD8NJQ2TVjShtLp/3d02bpZJNtoi6GT27s6Yyc44M7v9oU9FUHwx6psUxL+3gCAo9Q/bPrQvlQol2tQgKD60+INQ6Ium65k7M5lpurHeZe58853vnnvuuWfvBei5qliWkRQBFpquLRcy4nOHj4g9K5CEh6AXBqFXUR0rXalMAjZPC3e1W99Dwntf2dXd/p+tt0YdFSBxH2Kz5qgLiI8B8KdVy3YBevqRHz/qWh72Yui3MUDEL3q44WPXw3M+fo1pZuQs4tOIBVVTaoiXEI/MxfhGDPsxsNZfoE1q66ro5aJim3XdoLFw72H+n23BaIXzbcOnz5mfPoTvYVz7KzUl5+FRxEuqkp9G/Ajia219thzg25abkRE/BpDc3pqvphHvRFys2weqvp+krbWKIX7nhDbzLOItiM8358pTwdirqpPFnMF2xLc1WvLyOwTAibpbmvHHcvttU57y5+XqNZrLe3lE/Pq8eUj2fXKfOe3pfOjzhJYtB/yll5SDFcSDiH+hRkH25+L+sdxKEAMZahrlSX8ukqMOWy/jXW2m6M9LDBc31B9LFuv6gVKg/0Szi3KAr1kGq1GMjU/aLbnq6/lRxc4XfJ98hTargX++DbMJBSiYMIe9Ck1YAxFkKEAG3xbYaKmDDgYyFK0UGYpfoWYXG+fAPPI6tJnNwb7ClP7IyF+D+bjOtCpkhz6CFrIa/I6sFtNl8auFXGMTP34sNwI/JhkgEtmDz14ySfaRcTIBInmKPE32kxyyE2Tv+thKbEVePDfW/byMM1Kmm0XdObS7oGD/MypMXFPXrCwOtoYjyyn7BV29/MZfsVzpLDdRtuIZnbpXzvlf+ev8MvYr/Gqk4H/kV/G3csdazLuyTMPsbFhzd1UabQbjFvDRmcWJxR3zcfHkVw9GfpbJmeev9F08WW8uDkaslwX6avlWGU6NRKz0g/SHtCy9J30o/ca9zX3Kfc19zn3BXQKRO8ud477hLnAfc1/G9mrzGlrfexZ5GLdn6ZZrrEohI2wVHhZywjbhUWEy8icMCGNCUdiBlq3r+xafL549HQ5jH+an+1y+LlYBifuxAvRN/lVVVOlwlCkdVm9NOL5BE4wkQ2SMlDZU97hX86EilU/lUmkQUztTE6mx1EEPh7OmdqBtAvv8HdWpbrJS6tJj3n0CWdM6busNzRV3S9KTYhqvNiqWmuroiKgYhshMjmhTh9ptWhsF7970j/SbMrsPE1suR5z7DMC+P/Hs+y7ijrQAlhyAgccjbhjPygfeBTjzhNqy28EdkUh8C+DU9+z2v/oyeH791OncxHOs5y2AtTc7nb/f73TWPkD/qwBnjX8BoJ98VVBg/m8AAAB9SURBVBgZnVDBDcAgCITEJXQNHcM9nMk5dAxdQ8ewQFrSGB9NSQyHBxc4BIBFT8JaK9k5B713vL8lee/XGEPwnFMpbK2pAA1BSknJE8g5A4kpZUopUvBwrRVIUMkTCCFAjFFFzN70Xm/nTjXSBnoC3/jlBPboCTZKBf6YeAHIojZUm15j1AAAAABJRU5ErkJggg==", 1, 0, 3);
global.projectileObject = -1
global.flailendsprite = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAABm0lEQVRYR+1WO27DMAx1DtLMQQEvnnIbzzlRZ1+gt+jqxUCQOTmIC7J6Ak1TXxvw0GhIAivie3x8pHxqtq3ZHT/Vhqk+6AAPJTCP48g8uq6jr6pkqg4h+2EYmrZt/yeBmbLH2qJCrAQxg5UQiBo1SoBM5gymTYaguvtkPP6PiGFipUyonc6AMJ9GF2QZOKdDkgRQ677vGVguemYRIiK5HZIiQPFZSgv8ef9iAufPm98nQ4rMk/Mhi4AGp6iU/c/3tfm49AsCtKdIRDGKCUB2ApIEUBqQzW3NEAHvcpk9gUN2Anw9/jxBKmChHEYpzHKs2gatgzpqApR1aOlyQAXVETjO2PTh+xU70zTxz5jzUyWAF9AR0hvSpJ5AyGjW85QJkQgU0DGEPxZX6KrulgIIHuuCEAFpYFzfRSaUtc8hAKXEuRVecRuWKOAy3ncOHEKAQK1RHJqESvpNCvh7P3UZaX/sdRktCOhxqweSdPkeBBhcBF1MzcDVvOsLSfYrmai5Ve/qV7LgzHcb+rUsp6VXMasOpZiV7L8JvBX4BSp4+B+6wRtZAAAAAElFTkSuQmCC",1,16,16)
global.flailhandlesprite = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAQAAAAHCAYAAAAvZezQAAAAM0lEQVQYV2NkYGD4z4AEGEECQTYSDC/e/2Q4dvU9A1jASluQQUKQnWHdkRcQATJUINsCAAssHwFJqN8LAAAAAElFTkSuQmCC",1,2,7)
#define weapon_name
return "DEUS VULT"
#define weapon_type
return 0
#define weapon_auto
return 0
#define weapon_load
return 1
#define weapon_cost
return 0
#define weapon_sprt
return global.flailhandlesprite
#define weapon_area
return 10
#define weapon_text
return "SWING IT"
#define weapon_swap
return sndSwapSword

#define create_chain(a, b)
var chain = instance_create(0, 0, CustomObject);
with (chain) {
  on_draw = script_ref_create(chain_draw);
  on_step = script_ref_create(chain_step);
  startobj = a;
  endobj = b;
  spr = global.chainsprite;
}
return chain;

#define chain_step
if ("hitid" not in self) hitid = 0;
if ("team" not in self) team = 0;
if ("startweight" not in self) startweight = 1;
if ("endweight" not in self) endweight = 1;
if ("do_max_length" not in self) do_max_length = 0;
if ("max_length" not in self) max_length = 1;
if (instance_exists(startobj) && instance_exists(endobj)) {
  var x1 = startobj.x;
  var y1 = startobj.y;
  var x2 = endobj.x;
  var y2 = endobj.y;
  var chain = self;
  var type = team;
  if (do_max_length && false) {
    var dist;
    var dir = point_direction(x1, y1, x2, y2);
    var rdir = degtorad(dir);
    with (startobj) {
      dist = distance_to_point(x2, y2);
    }
    if (dist>max_length) {
      var sub = dist-max_length;
      var aweight = .0+startweight/(startweight+endweight);
      var suba = aweight*sub;
      var subb = (1.0-aweight)*sub;
      var dx = cos(rdir);
      var dy = -sin(rdir);
      var ndir = dir+90;
      with (startobj) {
        var raddir = degtorad(direction);
        var xspd = speed*cos(raddir);
        var yspd = speed*sin(raddir);
        xspd+=dx*suba;
        yspd+=dy*suba;
        direction = point_direction(x, y, x+xspd, y+yspd);
        speed = distance_to_point(x+xspd, y+yspd);
        //x+=dx*suba;
        y+=dy*suba;
      }
      with (endobj) {
        var raddir = degtorad(direction);
        var xspd = speed*cos(raddir);
        var yspd = -speed*sin(raddir);
        var ox = x;
        var oy = y;
        x-=dx*subb;
        y-=dy*subb;
        var raddir = degtorad(direction);
        var xspd = speed*cos(raddir);
        var yspd = -speed*sin(raddir);
        xspd+=dx*subb;
        yspd+=dy*subb;
        //direction = point_direction(ox, oy, ox+xspd, oy+yspd);
        //speed = distance_to_point(ox+xspd, oy+yspd);
      }
    }
  }
  if (instance_exists(enemy)) with (enemy) {
    if (team != type && collision_line(x1, y1, x2, y2, self, 0, 0)) {
      var hit = self;
      with (chain) {
        chain_enem(hit, hitid);
      }
    }
  }
  if (instance_exists(projectile)) with (projectile) {
    if (team != type && collision_line(x1, y1, x2, y2, self, 0, 0)) {
      var hit = self;
      with (chain) {
        chain_proj(hit, hitid);
      }
    }
  }
  if (instance_exists(Wall)) with (Wall) {
    if (collision_line(x1, y1, x2, y2, self, 0, 0)) {
      var hit = self;
      with (chain) {
        chain_wall(hit, hitid);
      }
    }
  }
}
else
{
instance_delete(self)
}

#define chain_draw
depth = -9
if (instance_exists(startobj) && instance_exists(endobj)) {
  var dist;
  var startx = startobj.x;
  var starty = startobj.y;
  with (endobj) {
    dist = distance_to_point(startx, starty);
  }
  var dir = point_direction(endobj.x, endobj.y, startobj.x, startobj.y);
  var dx = 16*cos(degtorad(dir));
  var dy = -16*sin(degtorad(dir));
  var xpos = endobj.x;
  var ypos = endobj.y;
  for (var i = 0;i<dist;i+=16) {
    draw_sprite_ext(spr, 0, xpos, ypos, 1, 1, dir, c_white, 1);
    xpos+=dx;
    ypos+=dy;
  }
} else {
  instance_destroy();
}

#define chain_enem(other, hitid)

#define chain_proj(other, hitid)

#define chain_wall(other, hitid)

#define weapon_fire
if ("proj_active" not in self) proj_active = 0;
var playerIndex = index
if (!proj_active)
{
    proj_active = 1;
    var plyrParent = self
    var objFling = instance_create(mouse_x,mouse_y,CustomObject)
    with(objFling)
    {
		sprite_index = global.flailendsprite
        on_step = script_ref_create(proj_step)
		on_draw = script_ref_create(proj_draw)
		playerParent = plyrParent;
    }
    create_chain(objFling,self);
}

#define proj_step
if (instance_exists(playerParent)) 
{
image_angle = point_direction(playerParent.x,playerParent.y,x,y)-90
	{
		var gdir = point_direction(x,y,playerParent.x,playerParent.y)
		var proj = self
		with (playerParent)
		{
			if (button_check(index,"fire"))
			{
				with (proj)
				{
					motion_add(gdir, 1)
					speed /= 1.04
				}
			}
			else
			{
				with (proj)
				{
					motion_add(gdir, .2)
					speed /= 1.02
				}
			}
		}
	}
	if (place_meeting(x,y,enemy))
	{
		with(instance_nearest(x,y,enemy))
		{
			my_health-=proj.speed
			sprite_index = spr_hurt
			sound_play = snd_hurt
		}
	}
} else {
instance_destroy();
}
if (instance_exists(Portal)) {
playerParent.proj_active = false
instance_destroy();
}
#define proj_draw
depth = -10

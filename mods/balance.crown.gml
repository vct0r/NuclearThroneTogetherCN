// Define Sprites
#define init
global.spr_idle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABmJLR0QAtwCoAHjSEZqtAAAACXBIWXMAAAsTAAALEwEAmpwYAAAA0klEQVQ4y6VSsQ0CMQy8ULAAEUV2oEEUSCBoUtCxBsU36LufIUyRVSiyQTagiPQL0JjiSRReCcnrLVmxLcu+8wWYaSxTp9reRW6yVRzOCFjFq9FQ5ABAzggaoRn3BARkFYeW8BspNdwjckaEHpbibBXH6rgEAPTPd4jX+1ftDYeNVnFKwa45IgMQNn/zSSqQh/9H1iwH0hLYXXiMwPNnRSm1HLg7Iyi2hKTpAYfzlfzrPa4Xb7DZnkLcdk3I266Z9BsBgG73x09eQwGJr1tUYpZ9ANzSaezbX/rxAAAAAElFTkSuQmCC",1,8,8);
global.spr_walk = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAQCAYAAADpunr5AAACFklEQVRYR+1YvS5EQRQ+23gBS8ETKKgkJCQaP9tJNF6BRGNXpVS7q6TXqxedkJCIgsITULBeYJsrM7kzOTtzZubMHZu4rq3I3nu++b7v/M02YDSfnAjbGA0UGbUy+C5RUgnkr8dNGF8eg6/bAcwc9IVKMQbUBt9pQAkBsWgibv5xPwWTi+9YfPMZV1GUMbCS+NiAFAJSsMdeH+ZbTZXxgAyQQov/RUWIyjCMEV/XEl8ZkCrgUMtQ1SNUVYKLvwvRcdbXHl8LgFUpIaDZSqQhIk7R/9X3rJlTJ3yvIBECUr2cmgHcRSjWwMri+zaTnxYwZguSM4EY4ikG/kr8mArgEsjPV0EOYzFs1YcYuj4xqQr4k/gUqRQB5bt3sxkcbWcwsfCmRf58mKY2H7J1JBg4dPYq4JsGpBKQmbuzn8HZSceV4d62h8V3COi71OltbGllEzqHe3DVe9Znubi8hq2NNe/7Jv5uuwun3TYwEigP8CYXEcsARpBQKyBFWG/NhcibdwHLQIaAMobi4OHC2sYoEz03esV76G6FY1AaWAYUrPV6ShwiZIAWUr1bZJ0v87DYUsCXpxsrg42zuSrMzESKo9MAZJq8zWMTGQkgTOAktX6GnAFGkBAh7zA1CHG2GFcGc4xX8SkhWNiEyTizqSyPiWslIZdUWWBVDVwcLCDZMzlsi581YjG55qWYa52p7CGZOvw/FlLgG8iA6yAnHKNeAAAAAElFTkSuQmCC",6,8,8);
global.spr_icon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAAABmJLR0QAtwCoAHjSEZqtAAAACXBIWXMAAA7DAAAOwwHHb6hkAAACkklEQVRIx61WPWsbMRh+Lj1c+kGh+GIS31DIlCxxQhxiiEuWAydD8ZLVg9ebSvEP6NBuppQOR6CFG7xmcZd60BISg0NsaLq4XQptcetezmRPh+vgSJFk3YeTvIvuJL3P835JerWd3ZUAksxlDFxHhp4/MaffBrCszxPpScFdh7Dvqm3FElESnQfnQXgg1yHo1w2kiymMji6wVCPCmixV22Ik2s7uSjCXMeA6BA0LyG+PydLFFDKF34Ki18lOzFFiKmMDfFRtC0PPh86HpkIAEF8ApEr83OjogoHKhHKodN4t1yFCfDMFEuuBnA8ZQ49KFr/RdQjzJC7JvMzIzKqkUeFjHVZpMsbMNHXO52JqD+Iso9XSrxuRXl6L4CaSmKDb8oVxKgLqsjzyUiHiOLUHQRDA62TRrxuR5RpWpmFG6lRB07TIw+N1spjdGMDrmMgUiJKEnvJuy2eealXbCuIqiIKfHZsCgMoQ2UglAb+RhozepHzS+XyEnW49rOb50zu7Mbj8M9mBy28baOCqoiqOOmzKu2ipdqXYsABAi6yUqMpSEqQfm3i7Nra69CrLeQCcHZsT1wf1pHIZWt4TIQeuQ7C5VcbXL10AYCR7/8rIrT0FAJz2DvHhWVvIhbzePmgyEuVJXlzOAwCe90ymbJVybL34+i66LZ+BU7FKOUaU6D0YnQ8A5GPi3sTmVjl5Dmh4FpfzaB8MkORBcp0mC08kAX0sZItOe4eC8uh8MFGSNDTOm1qyJ5MmynWasF/UBTKVyMmlcmf+yaOXDx/cZxOr6wv4uP+Jfa+uL+D9uz2kUvfw989PJcjnk+/49ePbxPzQ89UeTPOox+3XaPObtHVMSk5bR43vrm/a/Kq6bF21cJvt+39efFSUqtBrdwAAAABJRU5ErkJggg==",1,12,16);

//Set Sprites
#define crown_object
spr_idle = global.spr_idle;
spr_walk = global.spr_walk;
#define crown_button
sprite_index = global.spr_icon;

#define step

with(enemy){
	//Weak Enemy HP * 200%
	if maxhealth < 35 && "new" not in self{
		new = 1;
		my_health *= 2;
	}
	//Strong Enemy HP * 50%
	if maxhealth >= 35 && "new" not in self{
		new = 1;
		my_health *= 0.5;
	}
}
	
#define crown_name // Crown Name
return "CROWN OF BALANCE";

#define crown_text // Description
return "@gSTRONGER @sWEAK @wENEMIES#@dWEAKER @sSTRONG @wENEMIES";

#define crown_tip // Loading Tip
return "DON'T UNDERESTIMATE THE MAGGOTS";

#define crown_avail // L1+
if(GameCont.loops > 0) return 1;
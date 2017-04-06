#define crown_name
return "Crown of Limitless"

#define crown_text
return "The power of gods at your finger tip"

#define crown_tip
return "NTT X10 is coming. Stay tuned!"

#define crown_take
GameCont.skillpoints += 10

#define crown_button
sprite_index = sprCrownSelect;
image_index = 8;

#define crown_avail // L1
return GameCont.loops > 0;
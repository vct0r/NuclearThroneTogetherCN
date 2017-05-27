#define init
global.ctrldraw = "key1";
global.ctrlsize = "key2";
global.ctrlclear = "key6";

for(var i = 0; i < maxp; i++){
	global.surface[i] = noone;
}

trace("Draw Mod | Controls:");
trace("    - Hold 1 To Draw");
trace("    - Hold 2 To Select Your Draw Size");
trace("    - Press 6 To Clear Your Drawing");

#define draw
	with(Player){
		if("drawwidth" not in self) drawwidth = 6;

		 // Create Surface:
		if(!surface_exists(global.surface[index])){
			global.surface[index] = surface_create(2000, 2000);
		}
		surface_set_target(global.surface[index]);

		var surfx = 9000;
		var surfy = 9000;
		var drawx = mouse_x[index] - surfx;
		var drawy = mouse_y[index] - surfy;

		 // Drawing:
		draw_set_color(player_get_color(index));
		if(button_check(index, global.ctrldraw)){
			draw_circle(drawx, drawy, drawwidth, 0);
		}

		 // Clear Drawing:
		if(button_pressed(index, global.ctrlclear)){
			draw_clear_alpha(0, 0);
		}

		 // Draw Surface:
		surface_reset_target();
		draw_surface(global.surface[index], surfx, surfy);
		//draw_rectangle(surfx, surfy, surfx + 2000, surfy + 2000, 1);

		 // Changing Drawing Size:
		if(button_check(index, global.ctrlsize)){
			for(var i = 0; i < maxp; i++) draw_set_visible(i, 0);
			draw_set_visible(index, 1);

			 // Main Background Rectangle:
			draw_set_color(make_color_rgb(140, 140, 140));
			draw_rectangle(x + 20, y - 40, x + 50, y + 34, 0);

			 // Circle Example:
			draw_set_color(player_get_color(index));
			draw_circle(x + 35, y - 60, drawwidth, 0);

			 // Outlines, Rectangle & Circle:
			draw_set_color(c_black);
			draw_rectangle(x + 19, y - 41, x + 50, y + 34, 1);
			draw_circle(x + 35, y - 60, drawwidth, 1);

			for(var i = 5; i < 75; i += 5){
				 // Size Lines:
				draw_set_color(c_black);
				draw_line_width(x + 20 + (i/5), y + i - 41, x + 49 - (i/5), y + i - 41, 1); 
			
				 // Bar Thing:
				draw_set_color(player_get_color(index));
				draw_roundrect_ext(x + 34.5 - drawwidth, (y + 36) - (drawwidth * 5), x + 34.5 + drawwidth, (y + 32) - (drawwidth * 5), 4, 2, 0);
				if(point_in_rectangle(mouse_x[index], mouse_y[index], x + 20, y - 40, x + 50, y + 34)){
					if(reload <= 2) reload = 2;
					can_shoot = 0;
					clicked = 0;
					if(button_check(index, "fire")){
						drawwidth = round(((y + 36) - mouse_y[index]) / 5);
						draw_set_color(c_white);
					}
					else draw_set_color(c_gray);
				}
				else draw_set_color(c_black);
			}
			draw_roundrect_ext(x + 34.5 - drawwidth, (y + 36) - (drawwidth * 5), x + 34.5 + drawwidth, (y + 32) - (drawwidth * 5), 4, 2, 1);

			 // Draw Width In Text:
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			draw_set_font(fntSmall);
			draw_text_nt(x + 53, (y + 34) - (drawwidth * 5), string(drawwidth));

			for(var i = 0; i < maxp; i++) draw_set_visible(i, 1);
		}

		 // Kill Emote Indicators:
		for(var i = 1; i <= 6; i++){
			if(global.ctrldraw  = "key" + string(i)	||
			   global.ctrlclear = "key" + string(i)	||
			   global.ctrlsize  = "key" + string(i)	){
				if(button_check(index, "key" + string(i)) && fork()){
					wait 1;
					with instances_matching(EmoteIndicator, "image_index", i) instance_destroy();
					exit;
				}
			}
		}
	}
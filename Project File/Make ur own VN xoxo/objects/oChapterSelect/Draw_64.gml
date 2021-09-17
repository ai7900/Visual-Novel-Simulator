draw_text(10,10,act_numbers);

function MouseInGuiArea(_x1,_y1,_x2,_y2)
{
	
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);
	
	if ( point_in_rectangle( _mx, _my, _x1, _y1, _x2, _y2) )
	{
		return true;	
	}
}

draw_set_valign(fa_top);
draw_set_halign(fa_center);
var _gui_middle = display_get_gui_width() / 2;
draw_text(_gui_middle,0,"HELLO");
draw_text(_gui_middle,22,"PLEASE SELECT A CHAPTER :)))");


for( var _i = 0; _i < act_numbers; _i++ )
{
	
	var _text_y = 100 + ( _i * 25 );
	
	var _x1 = ( _gui_middle / 2 );
	var _x2 = ( _gui_middle / 2 ) + 115 +  ( string_width(ds_list_find_value(act_names,_i)) );
	var _y1 = _text_y + 6;
	var _y2 = _text_y + 26;
	
	draw_set_alpha(0.1);
	draw_set_color(c_teal);
	draw_rectangle(_x1,_y1,_x2,_y2,false);
	
	draw_set_alpha(1);
	draw_set_color(c_lime);
	draw_set_halign(fa_left);
	draw_text(_gui_middle / 2,_text_y,"Chapter " + string(_i) + ": " + string(ds_list_find_value(act_names,_i) ) );
	
	if ( MouseInGuiArea(_x1, _y1, _x2, _y2) )
	{
		draw_set_alpha(0.3);
		draw_set_color(c_teal);
		draw_rectangle(_x1,_y1,_x2,_y2,false);
		draw_set_alpha(1);
		
		if ( mouse_check_button_pressed(mb_left) )
		{
			var _inst = instance_create_layer(0,0,"Instances",oController);
			act_number = _i - 1;
			with( _inst )
			{
				nextAct = true;
				currentActNumber = other.act_number;	
			}
			
			instance_destroy();
		}
	}
}

draw_set_color(c_white);
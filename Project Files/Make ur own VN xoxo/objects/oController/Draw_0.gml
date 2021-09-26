/*
var db = dialogueList;

for( var i = 0; i < array_length(db); i++)
{
	draw_text(0,0+(i*16),db[i]);
}
*/
var _bot = camera_get_view_height(MainCamera);
var _border_top = _bot - 100;
var _width = camera_get_view_width(MainCamera);
var _textpos_y = _border_top + 30;
var _textpos_x = 100 

draw_set_valign(fa_top);
draw_set_halign(fa_left);

//drawage of background
if ( background != noone )
{
	if ( sprite_exists(background) )
	{
		draw_sprite_stretched(background,0,0,0,_width,_bot);
	}
	else
	{
		draw_sprite_stretched(sSecretBackground,0,0,0,750,420)
	}
}

if ( display_choices )
{
	for ( var _i = 1; _i < array_length(choices_id)+1; _i++ )
	{

		
		draw_set_font(fnt_urmom_bold);
		draw_set_color(c_black);
		draw_rectangle(50,155 + (_i * 30),200,175 + (_i * 30),false);
		draw_set_color(c_white);
		draw_text_ext(55,150 + (_i * 30),choices_text[_i],25,680);
		
		if ( MouseInGuiArea(50,155 + (_i * 30),200,175 + (_i * 30)) )
		{
			draw_set_alpha(0.25);
			draw_set_color(c_green);
			
			draw_rectangle(50,155 + (_i * 30),200,175 + (_i * 30),false);
			
			draw_set_alpha(1);
			draw_set_color(c_white);
			
			if ( mouse_check_button_pressed(mb_left) )
			{
				current_choice = _i;
				nextLine = true;
				display_choices = false;
				
				Goto_Answer(string(choices_id[_i-1]));
				
				array_resize(choices_id,0);
				array_resize(choices_text,0);
			}
		}
	}
}
/*
////////drawing them sprites
var sprites = ds_list_create()


if ( ds_list_size(spriteList) > 0 )
{
	var spr;
	for( var i = 0; i < ds_list_size(spriteList); i++)
	{
		spr = sprite_add(ds_list_find_value(spriteList,i),0,false,false,0,0);
		if ( !sprite_exists(spr) )
		{
			draw_sprite_ext(sSecretMan,0,40+(i*180),90,0.75,0.75,0,c_white,1);	
		}
		else
		{
			draw_sprite_ext(spr,0,40+(i*180),90,0.75,0.75,0,c_white,1);
			draw_text(-300,0+(i*32),ds_list_find_value(spriteList,i)); //spirte names draws on screen 4 debugging
			sprite_delete(spr);
		}
		
	}
}
ds_list_destroy(sprites);
*/

//draw text & border


if ( !surface_exists(surf) )
{
	surf = surface_create(_width*8,_border_top*8);
}
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_sprite_tiled_ext(border,0,border_x,border_y,8,8,c_white,1);
surface_reset_target();
draw_surface_stretched(surf,0,_border_top,_width,_border_top);



draw_set_alpha(0.60);
draw_rectangle_color(90,_border_top+5,_width-90,_bot-5,c_black,c_black,c_black,c_black,false);
draw_set_alpha(0.25);
draw_rectangle_color(85,_border_top+3,_width-85,_bot-3,c_black,c_black,c_black,c_black,false);
draw_set_alpha(1);



// if surface somehow does not exist
// Create new surface
if(!surface_exists(textSurface)){
	var _w = camera_get_view_width(MainCamera);
	var _h = camera_get_view_height(MainCamera);
	textSurface = surface_create(_w,_h);
}

surface_set_target(textSurface)

draw_set_color(c_white);
draw_set_font(font);
draw_text_ext_transformed(_textpos_x,_textpos_y,dialogue_typewriter,30,1200,0.75,0.75,0);
draw_set_font(fnt_urmom_bold);
draw_text_transformed(_textpos_x+10,_textpos_y-25,dialogueName,0.75,0.75,0);

surface_reset_target()

/*
shader_set(shOutline);
shader_set_uniform_f(upixelW, texelW);
shader_set_uniform_f(upixelH, texelH);
*/
draw_surface(textSurface, 0, 0);

//shader_reset();

if ( next_text )
{
	var _tri_x = _width - 130;
	var _tri_y = _border_top + 80 + ( sin(get_timer()/100000) * 2.5 );
	draw_triangle(_tri_x,_tri_y,  _tri_x+16,_tri_y,  _tri_x+8,_tri_y+8,false);
	
}


//draw actors

for( var _i = 0; _i < array_length(actors); _i++ )
{

	if ( sprite_exists( actors[_i] ) )
	{
		var _sprite_height = sprite_get_height(actors[_i]);
		var _sprite_width = sprite_get_width(actors[_i]);
		
		//187 93.5
		var _w = _width / 5;
		var _x = ( _i * ( _width / 5 ) ) + 93.5 - ( _sprite_width / 2)
		var _y = _border_top-_sprite_height;
		
		if( !actor_mirror[_i] )
		{
			draw_sprite_ext(actors[_i],0,_x ,_y,1,1,0,c_white,1);
		}
		else
		{
			draw_sprite_ext(actors[_i],0,_x+(_sprite_width/2) ,_y,-1,1,0,c_white,1);	
		}
		

	}
}

draw_set_alpha(0.75);
draw_set_color(c_black);
draw_rectangle(0,_border_top-1,_width,_border_top+1,false);
draw_set_color(c_white);
draw_set_alpha(1);

var _subimg = 0;
if ( MouseInArea(0,_border_top-11,38,_border_top) )
{
	_subimg = 1;
	can_advance = false;
	
	if ( mouse_check_button_pressed(mb_left) )
	{
		if ( dialogue_history_toggle )
		{
			dialogue_history_toggle = false;
		}
		else
		{
			dialogue_history_toggle = true;
		}
	}
}

draw_sprite(sDialogueHistory,_subimg,0,_border_top);

if ( dialogue_history_toggle )
{
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(5,10,800,20+clamp(array_length(dialogue_history),0,40)*7,false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	for ( var _i = dialogue_history_scroll; _i < clamp(array_length(dialogue_history),dialogue_history_scroll,dialogue_history_scroll+40); _i++ )
	{	
		draw_text_ext_transformed(5,7+((_i - dialogue_history_scroll)*7),dialogue_history[_i],15,900,0.4,0.4,0);
	}
}


var _subimg = 0;
if ( MouseInArea(64,_border_top-11,103,_border_top) )
{
	_subimg = 1;
	can_advance = false;
	
	if ( mouse_check_button_pressed(mb_left) )
	{
		if ( instance_exists(oSnake_Controller) )
		{
			instance_destroy(oSnake_Controller);
		}
		else
		{
			instance_create_layer(0,0,"snake",oSnake_Controller);
		}
	}
}
draw_sprite(sSnakeButton,_subimg,64,_border_top);

/*
var _recx = 65;
var _recy = 280;
var _recx2 = 680;
var _recy2 = 396;

var _col = make_color_rgb(10,10,10);

draw_set_color(_col);
draw_circle(_recx,_recy + (( _recy2 -  _recy) / 2 ),58,false);
draw_circle(_recx2,_recy + (( _recy2 -  _recy) / 2 ),58,false);
draw_rectangle(_recx,_recy,_recx2,_recy2,false);
draw_set_color(c_white);
draw_set_font(fnt_urmom);
draw_text_ext(55,315,dialogue_typewriter,25,680);
draw_set_font(fnt_urmom_bold);
draw_text(55,280,dialogueName);

*/
/*
draw_text(mouse_x,mouse_y,"X");
draw_text(mouse_x,mouse_y+16,"X: "+string(mouse_x));
draw_text(mouse_x,mouse_y+32,"Y: "+string(mouse_y));

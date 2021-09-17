// Shader stuff
upixelH = shader_get_uniform(shOutline, "pixelH");
upixelW = shader_get_uniform(shOutline, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index,0));
texelW = texture_get_texel_height(sprite_get_texture(sprite_index,0));


//

//C:\Users\Andreas\Documents\GameMakerStudio2\Make ur own VN xoxo\datafiles
//this obj handles basically everything lmao
draw_set_font(fnt_urmom);
//array of act.txt file names
actFiles = fetch("!","lore.txt");

font = font_add("font.ttf",20,false,false,32,255);

currentActNumber = 0; //current act in the list
currentAct = noone;

dialogue = ""; //current dialogue being displayed
dialogue_typewriter = "";
dialogue_typewriter_pos = 0;
dialogue_typewriter_speed = 1;
dialogueName = "";
actors = array_create(5,noone);
actor_mirror = array_create(5,false);
background = noone;

dialogue_history_toggle = false;
dialogue_history = array_create(1,"");
dialogue_history_scroll = 0;


border = sDefaultBorder;

next_text = false;

surf = noone;
border_x = 0;
border_y = 0;
border_x_speed = 0.1;
border_y_speed = 0.05;
//read = true; //read at the start of an act
nextLine = true; //reads next line of the act lollel

currentAct = file_text_open_read(actFiles[currentActNumber]) //temp pls fix
audio = noone;
bgm = noone;

nextAct = true;

auto_advance = false;
auto_advance_timer = 0;

display_choices = false;
choices_text = [];
choices_id = [];
current_choice = 0;

can_advance = true;

function Goto_Answer(_answer_id)
{
	file_text_close(currentAct);
	
	currentAct = file_text_open_read(actFiles[currentActNumber]);
	
	var _line = "";
	var _id = "";
	while ( _id != _answer_id )
	{
		_line = file_text_read_string(currentAct);
		
		_id = string_copy(_line,9,60);
		
		//show_debug_message(_failsafe);
		//show_debug_message(_id);
		

		file_text_readln(currentAct);
	}
	show_debug_message(_id);
}

function MouseInGuiArea(_x1,_y1,_x2,_y2)
{
	
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);
	
	if ( point_in_rectangle( _mx, _my, _x1, _y1, _x2, _y2) )
	{
		return true;	
	}
}

function MouseInArea(_x1,_y1,_x2,_y2)
{
	
	var _mx = mouse_x;
	var _my = mouse_y;
	
	if ( point_in_rectangle( _mx, _my, _x1, _y1, _x2, _y2) )
	{
		return true;	
	}
	else
	{
		return false;	
	}
}
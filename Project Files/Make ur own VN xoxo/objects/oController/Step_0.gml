border_x += border_x_speed;
border_y += border_y_speed;

border_x_speed = sin(current_time / 10000) / 2;
border_y_speed = cos(current_time / 10000) / 2;

if ( keyboard_check_pressed(ord("Q")) )
{
	if ( !instance_exists(oSnake_Controller) )
	{
		instance_create_layer(0,0,"snake",oSnake_Controller);
	}
	else
	{
		instance_destroy(oSnake_Controller);	
	}
}

if ( nextAct )
{
	background = noone;
	currentActNumber++;
	currentAct = file_text_open_read(actFiles[currentActNumber])
	nextAct = false;
}

var action, line, isAction;
var maxLineRead = 0; //empty lines before auto end of act lol english

var _repeat = true;

choice_number = 0;

while (_repeat )
{
	_repeat = false;
	maxLineRead++;
	
	if (  maxLineRead >= 69 )
	{
		break;
	}
	
	
	if ( nextLine )
	{
		nextLine = false;
		dialogue_typewriter_pos = 0;
		line = file_text_read_string(currentAct);
		
		isAction = string_copy(line,0,1);
		
		if ( isAction != "!" ) //check if current line is an action. if not; skip current line
		{
			_repeat = true;
		}
				
		var _i = 1; //
		var _find = "";
		while( _find != " " )
		{
			_i++;
			_find = string_copy(line,_i,1);
		}
			
		action = string_copy(line,2,_i-2);
		
		_i++;
		
		switch(action)
		{
			case "choice":
				
				var _o = _i;
				var _empty = "";
				while(_empty != " ")
				{
					_o++;
					_empty = string_copy(line,_o,1);	
				}
				
				choices_id[array_length(choices_id)] = string_copy(line,_i,_o - _i);
				//show_debug_message(choices_id);
				
				choices_text[array_length(choices_id)] = string_copy(line,_o+1,90);
				//show_debug_message(choices_text);
				
				nextLine = true;
				_repeat = true;
			
			break;
		
			case "choice_end":
			
				display_choices = true;
				
			break;
		
			case "goto":
			
				var _goto_line = string_copy(line,_i,10);
			
				file_text_close(currentAct);
	
				currentAct = file_text_open_read(actFiles[currentActNumber]);
				
				repeat(real(_goto_line) - 2)
				{
					file_text_readln(currentAct);	
				}
				
				nextLine = true;
			//	_repeat = true;
				
			break;
			
			
			break;
			
			case "actor": //sprite
				
				var _o, _sprite_name, _pos = 0;
				
				for( var _e = 2; _e < 40; _e++)
				{
					_o = string_copy(line,_e,1);
					if ( _o == " ")
					{
						_sprite_name = string_copy(line,_e+1,200);
						_pos = string_copy(line,_i,_e - _i);
						
					}
				}

				var _realpos =  real(_pos);
				
				if ( actors[_realpos] != noone ) 
				{
					sprite_delete( actors[_realpos]);
					actors[_realpos] = noone;
				}
				
				actors[_realpos] = sprite_add(_sprite_name,0,false,false,0,0);
				
				nextLine = true;
				_repeat = true;
				
			break;
		
			case "killactor":
			
				var _p = string_copy(line,_i,1);
				if ( sprite_exists( actors[_p] ) )
				{
					sprite_delete(actors[_p] );	
				}
				nextLine = true;
			
			break
		
			case "border":
			
				if ( sprite_exists(border) )
				{
					sprite_delete(border);	
				}
				border = sprite_add(string_copy(line,_i,300),0,false,false,0,0);
				
				nextLine = true;
			
			break;
		
			case "dia": //dialogue
			
				//filters out name / actual dialogue
				var o;
				for( var i = 2; i < 20; i++ )
				{
					o = string_copy(line,i,1);
					if ( o == "!")
					{
						dialogueName = string_copy(line,_i,i - _i);
						dialogue = string_copy(line,i+1,200);
						
						dialogue_history[array_length(dialogue_history)] = string(dialogueName) + ": " + string(dialogue);
						
						break;
					}
				}
			
			break;
		
			case "bg": //background
		
				background = sprite_add(string_copy(line,_i,60),0,false,false,0,0);
				nextLine = true;
				_repeat = true;
		
			break;
		
			case "audioplay"://audio effect start
				if ( audio_exists(audio) )
				{
					audio_destroy_stream(audio);
				}
				audio = audio_create_stream(string_copy(line,_i,60));
				audio_play_sound(audio,true,false);
				nextLine = true;
				_repeat = true;
			
			break;
			
			case "nextact":
				nextAct = true; //temp pls fix
				nextLine = true;
			break;
			
			case "bgmplay": //BGM start
			
				if ( audio_exists(bgm) )
				{
					audio_destroy_stream(bgm);
				}
				bgm = audio_create_stream(string_copy(line,_i,60));
				audio_play_sound(bgm,true,true);
				nextLine = true;
				_repeat = true;
			
			break;
			
			case "audiostop": //Audio effect stop
			
				audio_stop_sound(audio);
				if ( audio_exists(audio) )
				{
					audio_destroy_stream(audio);
				}
				nextLine = true;
				_repeat = true;
				
			break;
		
			case "bgmstop"://Bgm stop
			
				audio_stop_sound(bgm);
				if ( audio_exists(bgm) )
				{
					audio_destroy_stream(bgm);
				}
				nextLine = true;
				_repeat = true;
				
			break;
			
			case "autoadvance":
			
				auto_advance_timer = real(string_copy(line,_i,9));
				
				
				nextLine = true;
			
			break;
			
			case "typewriterspeed":
			
			dialogue_typewriter_speed = real(string_copy(line,_i,9));
			
			if ( dialogue_typewriter_speed == 0 ) { dialogue_typewriter_speed = 999999; }
			
			nextLine = true;
			
			break;
			
			case "mirror_actor":
				
				var _pos = string_copy(line,_i,1) 
				var _realpos = real(_pos);
				if( actor_mirror[_realpos] == false )
				{
					actor_mirror[_realpos] = true;	
				}
				else
				{
					actor_mirror[_realpos] = false;	
				}
				nextLine = true;
			
			break;
/*	
			case "choice":
			
				choices[choice_number] = string_copy(line,_i,99);
				choice_number++;
			
				nextLine = true;
				_repeat = true;
			
			break;
			
			case "answer":
			
				
				nextLine = true;
				_repeat = true;
			
			break;
*/
			default:
				nextLine = true;
			break;
		
			
		}
		file_text_readln(currentAct);
		
		if ( _repeat ) { maxLineRead++; }
	}
}




if ( mouse_check_button_pressed(mb_left) && !auto_advance && dialogue_typewriter_pos >= string_length(dialogue) && !display_choices  && can_advance )
{
	
	dialogue = "";
	nextLine = true;
	
}


if ( auto_advance_timer > 0 )
{
	
	auto_advance = true;
	auto_advance_timer--;
	if ( auto_advance_timer == 1 )
	{
		nextLine = true;	
	}

}
else
{
	auto_advance = false;	
}


if ( mouse_check_button(mb_right) && can_advance )
{
	dialogue = "";
	nextLine = true;
}


if ( mouse_check_button_pressed(mb_middle) )
{
	game_restart();	
}


//typewriter effct lol

dialogue_typewriter = string_copy(dialogue,0,dialogue_typewriter_pos);

if ( dialogue_typewriter_pos <= string_length(dialogue) )
{
	dialogue_typewriter_pos += dialogue_typewriter_speed;
	next_text = false;
}
else
{
	next_text = true;	
}

if ( dialogue_typewriter_pos <= string_length(dialogue) && mouse_check_button_pressed(mb_left) && !auto_advance  && can_advance )
{
	dialogue_typewriter_pos = string_length(dialogue);
}



//Dialogue history
if ( keyboard_check_pressed(ord("F")) )
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

if ( dialogue_history_toggle )
{
	if ( mouse_wheel_up() )
	{
		if ( dialogue_history_scroll > 0 )
		{
			dialogue_history_scroll--;
		}
	}
	else if ( mouse_wheel_down() )
	{
		if ( dialogue_history_scroll < array_length(dialogue_history) - 1 )
		{
			dialogue_history_scroll++;
		}
	}
}

can_advance = true;








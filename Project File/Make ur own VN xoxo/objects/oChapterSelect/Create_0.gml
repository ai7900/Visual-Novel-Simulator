draw_set_font(fnt_urmom);
act_number = 0;//used for stuff
act_numbers = 0; //the number of act files
lore = file_text_open_read("lore.txt");

act_names = ds_list_create();

var action, line;
repeat(30)
{
	
	line = file_text_read_string(lore);
	action = string_copy(line,0,1);
	
	switch(action)
	{
		
		case "!":
	
			act_numbers++;
			
			//get act name without the '!' & '.txt'
			var _name, _i = 0, _check;
			repeat(30)
			{
				_name = string_copy(line,2,_i);
				_check = string_copy(_name,_i,1);
				if ( _check == "." )
				{
					break;	
				}
				_i++;
			}
			
			
			ds_list_add(act_names,_name);
	
			break;
			
		case "#":
		
			exit;
			
			break;
			
	}
	
	file_text_readln(lore);
	
}
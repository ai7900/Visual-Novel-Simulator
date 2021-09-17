//feed it a letter & .txt file name and it will return an array of stuff lol
function fetch(letter,txtfile)
{
	arr = array_create(0,0);
	var lore = file_text_open_read(txtfile);

	var l, s;	   //line, sign	
	
	while(!file_text_eof(lore))
	{
		
		l = file_text_read_string(lore);
		s = string_copy(l,1,1);
		
		if ( s == letter )
		{
			arr[array_length(arr)] = string_copy(l,2,40);
		}
		
		file_text_readln(lore);

	}
	file_text_close(lore);
	return arr
}

//Fetch dialogue
function fetchDialogue(txtfile)
{
	arr = array_create(0,0);
	var lore = file_text_open_read(txtfile);
	var l, s;	   //line, sign	
	
	while(!file_text_eof(lore))
	{
		
		l = file_text_read_string(lore);
		s = string_copy(l,0,1);
		
		if ( s == "?" )
		{
			arr[array_length(arr)] = string_copy(l,1,40);
		}
		
		file_text_readln(lore);

	}
	file_text_close(lore);
	return arr

}


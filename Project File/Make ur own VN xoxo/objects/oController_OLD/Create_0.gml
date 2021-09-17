//C:\Users\Andreas\Documents\GameMakerStudio2\Make ur own VN xoxo\datafiles


lore = file_text_open_read("lore.txt");

actorSpr = array_create(1,noone);

var l

for( var i = 0; i < 100; i++ )
{
	l = file_text_read_string(lore);
	de = string_copy(l,0,1);
	
	switch(de)
	{
		
		case "#":
			actorSpr[0] = sprite_add(string_copy(l,2,100),0,false,false,0,0);
		break;
		
	}
	
	file_text_readln(lore);
	
}

file_text_close(lore);

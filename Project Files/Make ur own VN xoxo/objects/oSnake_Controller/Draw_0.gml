
var _x1 = snake_arena_grid_x * snake_grid_size;
var _y1 = snake_arena_grid_y * snake_grid_size;
var _x2 = (snake_arena_grid_x * snake_grid_size) + snake_grid_size;
var _y2 = (snake_arena_grid_y * snake_grid_size) + snake_grid_size;
var _offset = snake_grid_size * snake_arena_size;

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(_x1,_y1,_x2+_offset,_y2+_offset,false);
draw_set_alpha(1);
draw_set_color(c_white);

draw_rectangle(_x1,_y1,_x2+_offset,_y2,false);
draw_rectangle(_x1,_y1,_x2,_y2+_offset,false);
draw_rectangle(_x1+_offset,_y1,_x2+_offset,_y2+_offset,false);
draw_rectangle(_x1,_y1+_offset,_x2+_offset,_y2+_offset,false);


draw_rectangle(snake_x,snake_y,snake_x+snake_grid_size,snake_y+snake_grid_size,false);

for( var _i = 0; _i < array_length(snake_body); _i++ )
{
	var _x = snake_body[_i][0];
	var _y = snake_body[_i][1];
	draw_rectangle(_x,_y,_x+snake_grid_size,_y+snake_grid_size,false);
}

draw_rectangle(candy.x,candy.y,candy.x+snake_grid_size,candy.y+snake_grid_size,false);
draw_set_color(c_black);
draw_rectangle(candy.x+(snake_grid_size/4),candy.y+(snake_grid_size/4),candy.x+(snake_grid_size/1.25),candy.y+(snake_grid_size/1.25),false);
draw_set_color(c_white);

var _textx = 20;
var _texty = (snake_arena_grid_x + snake_arena_size * snake_grid_size) + 25;
draw_set_font(fnt_urmom);
draw_text(_textx,_texty,"Score:" + string(snake_score));


if( snake_gameover )
{
	draw_text(_textx,_texty+25,"GAME OVER LOOOOOL");	
}



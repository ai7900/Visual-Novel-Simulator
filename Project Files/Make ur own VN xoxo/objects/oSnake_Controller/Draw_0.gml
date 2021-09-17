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


draw_set_font(fnt_urmom);
draw_text(10,5,snake_score);


if( snake_gameover )
{
	draw_text(90,5,"GAME OVER LOL WHAT A NOOB");	
}
var _gridx = 

draw_rectangle(0,0,0,0,false);/*
draw_rectangle(20,20,30,_i,false);
draw_rectangle(20,20,30,30,false);
draw_rectangle(20,20,30,30,false);
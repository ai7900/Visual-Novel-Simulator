enum DIRECTION
{
	LEFT = 0,
	UP = 90,
	RIGHT = 180,
	DOWN = 270,
}

snake_arena_size = 20;
snake_arena_grid_x = 2;
snake_arena_grid_y = 2;

snake_gameover = false;

snake_score = 0;

snake_speed = 0.2;
snake_countdown = 0;

snake_move_direction = DIRECTION.LEFT;

snake_x = 90;
snake_y = 90;

snake_grid_size = 10;


snake_body[0][0] = 0; //x
snake_body[0][1] = 0; //y
snake_body[1][0] = 0;
snake_body[1][1] = 0;
snake_body[2][0] = 0;
snake_body[2][1] = 0;
snake_body[3][0] = 0;
snake_body[3][1] = 0;

candy = 
{
	x : 0,
	y : 0,
}

function Candy_Spawn()
{
	candy.x = irandom_range(snake_arena_grid_x+1,snake_arena_size-1) * snake_grid_size;
	candy.y = irandom_range(snake_arena_grid_y+1,snake_arena_size-1) * snake_grid_size;
	snake_speed += 0.0025;
}
Candy_Spawn();

function Body_Update()
{
	snake_body[0][0] = snake_x;
	snake_body[0][1] = snake_y;
	
	for( var _i = array_length(snake_body) - 1; _i > 0; _i-- )
	{
		snake_body[_i][0] = snake_body[_i-1][0];
		snake_body[_i][1] = snake_body[_i-1][1];
	}
}

function Snake_Collision()
{
	for( var _i = 0; _i < array_length(snake_body); _i++; )
	{
		if( snake_x == snake_body[_i][0] && snake_y == snake_body[_i][1] )
		{
			snake_gameover = true;
		}
	}
	
	if( snake_x / snake_grid_size > snake_arena_size + 1 || snake_x / snake_grid_size < snake_arena_grid_x + 1 )
	{
		snake_gameover = true;	
	}
	
	if( snake_y / snake_grid_size > snake_arena_size + 1 || snake_y / snake_grid_size < snake_arena_grid_y + 1 )
	{
		snake_gameover = true;	
	}
}
var _ihor = keyboard_check(vk_left) - keyboard_check(vk_right);
var _iver = keyboard_check(vk_up) - keyboard_check(vk_down);

if ( _ihor < 0 )
{
	if ( snake_move_direction != DIRECTION.LEFT )
	{
		snake_move_direction = DIRECTION.RIGHT;
	}
}
else if ( _ihor > 0 )
{
	if ( snake_move_direction != DIRECTION.RIGHT )
	{
		snake_move_direction = DIRECTION.LEFT;
	}
}

if ( _iver > 0 )
{
	if ( snake_move_direction != DIRECTION.DOWN )
	{
		snake_move_direction = DIRECTION.UP;
	}
}
else if ( _iver < 0 )
{
	if ( snake_move_direction != DIRECTION.UP )
	{
		snake_move_direction = DIRECTION.DOWN;
	}
}

if ( !snake_gameover )
{

	snake_countdown -= snake_speed;

	if ( snake_countdown <= 0 )
	{

		Body_Update();

		switch(snake_move_direction)
		{
			case DIRECTION.DOWN:

				snake_y += snake_grid_size;
				break
		
			case DIRECTION.UP:
				snake_y -= snake_grid_size;
				break
		
			case DIRECTION.RIGHT:
				snake_x += snake_grid_size;
				break
		
			case DIRECTION.LEFT:
				snake_x -= snake_grid_size;
				break
		}
	
		if ( snake_x == candy.x && snake_y == candy.y )
		{
			Candy_Spawn();
			
			snake_score += 100;
			
			var _len = array_length(snake_body);
			snake_body[_len][0] = snake_body[_len-1][0];
			snake_body[_len][1] = snake_body[_len-1][1];
		}
	
		Snake_Collision();
	
		snake_countdown = 1;
	}

}
else
{
		
}






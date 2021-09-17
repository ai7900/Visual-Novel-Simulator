//Resolution settings pls change to a menu or something pls
if ( keyboard_check_pressed(ord("P")) ){
	
	if ( zoom > MaxZoom ){ zoom = 1 }
	zoom++;
	window_set_size(IdealWidth*zoom,IdealHeight*zoom);
	surface_resize(application_surface,IdealWidth*zoom,IdealHeight*zoom);
	alarm[0] = 1;
}

if ( keyboard_check_pressed(ord("O")) ){
	if ( window_get_fullscreen() ){
		window_set_fullscreen(false);
	}else{
		window_set_fullscreen(true);
	}
}


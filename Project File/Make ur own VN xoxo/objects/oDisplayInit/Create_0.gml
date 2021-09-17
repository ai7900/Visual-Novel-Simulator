IdealWidth = 0;
IdealHeight = 600;
zoom = 1; //game resolution
MaxZoom = 1; //max game resolution

//AspectRatio = display_get_width() / display_get_height(); //gets the monitor aspect ratio
AspectRatio = 1.78  //limit aspect ratio

IdealWidth = round(IdealHeight * AspectRatio); //rounds the aspect ratio 

/*pixel perfect math ROFL
if ( display_get_width() mod IdealWidth != 0 ){
	
	var _d	= round(display_get_width()/IdealWidth);
	IdealWidth = display_get_width()/_d;
}

if ( display_get_height() mod IdealHeight != 0 ){
	
	var _d	= round(display_get_height()/IdealHeight);
	IdealHeight = display_get_height()/_d;
}
*/

//check for odd numba and fixes it
if ( IdealWidth & 1 ){ IdealWidth++ }
if ( IdealHeight & 1 ){ IdealHeight++ }

MaxZoom = floor(display_get_width()/IdealWidth); //limits the max resolution to the monitor

//sets up the main camera
globalvar MainCamera;
MainCamera = camera_create_view(0,0,IdealWidth,IdealHeight,0,noone,0,0,0,0);
camera_set_view_size(MainCamera,IdealWidth,IdealHeight);

for ( var _i = 0; _i <= room_last; _i++ ){ //sets all the room resolution
	
	if ( room_exists(_i) ){
		
		room_set_viewport(_i,0,true,0,0,IdealWidth,IdealHeight);
		room_set_view_enabled(_i,true);
		room_set_camera(_i,0,MainCamera);
	}
}

surface_resize(application_surface,IdealWidth*4,IdealHeight*4);
display_set_gui_size(IdealWidth,IdealHeight);
window_set_size(IdealWidth*zoom,IdealHeight*zoom);
alarm[0] = 1;
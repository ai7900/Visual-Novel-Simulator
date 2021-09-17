//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelH;	// Pixel hight
uniform float pixelW;	// Pixel width


void main()
{
	vec2 offsetx;
	offsetx.x = pixelW;
	vec2 offsety;
	offsety.y = pixelH;
	
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;					// finds the transparency of the pixel we're currently drawing
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetx).a);		// round up value and offset 1 pixel to the right
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetx).a);		// round up value and offset 1 pixel to the left
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsety).a);		// round up value and offset 1 pixel to the above
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsety).a);		// round up value and offset 1 pixel to the below
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.a = alpha;
}

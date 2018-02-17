//getting player input
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));

//calculating movement	
var verticle = up - down;
var horizontal = left - right;

horizontalspeed = horizontal * walkspeed;
verticlespeed = verticle * walkspeed;

//horizontal collision
if (place_meeting(x-horizontalspeed,y,all)) 
{
	while (!place_meeting(x-sign(horizontalspeed),y,all))
	{
		x = x - sign(horizontalspeed);
	}
	horizontalspeed = 0;
}

//verticle collision
if (place_meeting(x,y-verticlespeed,all))
{
	while (!place_meeting(x,y-sign(verticlespeed),all))
	{
		y = y - sign(verticlespeed);
	}
	verticlespeed = 0;
}

x = x - horizontalspeed;
y = y - verticlespeed;



//Tile Collision Horizontal
var bbox_side;
if (horizontalspeed > 0) bbox_side = bbox_right;
	else bbox_side = bbox_left;

if (tilemap_get_at_pixel(tilemap,bbox_side+horizontalspeed,bbox_top) != 0) or (tilemap_get_at_pixel(tilemap,bbox_side+horizontalspeed,bbox_bottom) != 0)
{
	if (horizontalspeed > 0) x = x - (x mod 64) + 63 - (bbox_right - x);
	else x = x - (x mod 64) - (bbox_left - x);
	horizontalspeed = 0;
}


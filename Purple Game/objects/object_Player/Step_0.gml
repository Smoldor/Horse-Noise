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

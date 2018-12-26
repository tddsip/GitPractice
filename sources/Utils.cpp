#include "Utils.h"
#include <iostream>
#include <math.h>
#include <stdlib.h>

bool Utils::IsPointInRect(Vector2 point, Rect rect)
{
	return (point.x >= rect.position.x && point.x <= (rect.position.x + rect.size.x) 
		 && point.y >= rect.position.y && point.y <= (rect.position.y + rect.size.y));		
}

/*
Xét theo trục Ox.

│(x1 + W1/2)│ - │( x2+W2/2 )  ≤ │(W1+W2)/2│

Xét theo hướng Oy.

│(y1 + H1/2)│ - │( y2+H2/2 )  ≤ │(H1+H2)/2│
*/
bool Utils::IsRectIntersectRect(Rect r1, Rect r2)
{
	float distSubX = (r1.position.x + r1.size.x / 2) - (r2.position.x + r2.size.x / 2);
	distSubX = fabsf(distSubX);

	float distSubY = (r1.position.y + r1.size.y / 2) - (r2.position.y + r2.size.y / 2);
	distSubY = fabsf(distSubY);

	float distW = (r1.size.x + r2.size.x) / 2;
	float distH = (r1.size.y + r2.size.y) / 2;

	if (distSubX <= distW && distSubY <= distH)
		return true;

	return false;
}

int Utils::Random(int min, int max)
{
	int random = rand() % (max - min + 1) + min;
	return random;
}
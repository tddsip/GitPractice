#ifndef _UTILS_H_
#define _UTILS_H_

#include "GameEngine.h"
#include "Object.h"

class Utils
{
public:
	static bool IsPointInRect(Vector2 point, Rect rect);

	static bool IsRectIntersectRect(Rect r1, Rect r2);

	static int Random(int min, int max);
};
#endif
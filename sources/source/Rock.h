#ifndef _ROCK_H_
#define _ROCK_H_

#include "Object.h"

class Rock : public Object
{
public:
	Rock();
	Rock(const char* imageUrl);
	~Rock();
	virtual void Update(float deltaTime);

	void Start();

private: 
	int mDownStep;
};
#endif
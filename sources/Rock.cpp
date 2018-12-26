#include "Rock.h"
#include "Utils.h"
#include "Defines.h"

Rock::Rock()
	:Object(),
	mDownStep(0)
{
	this->mType = OBJECT_TYPE_ROCK;	
}

Rock::Rock(const char* imageUrl)
	: Object(imageUrl),
	mDownStep(0)
{
	this->mType = OBJECT_TYPE_ROCK;
}

Rock::~Rock()
{

}

void Rock::Start()
{
	mPosition.x = Utils::Random(mImage->GetWidth()/2, SCREEN_WIDTH - ((int)mImage->GetWidth())/2);
	mPosition.y = -Utils::Random(mImage->GetHeight(), 3*mImage->GetHeight());
	mIsAlive = true;
}

void Rock::Update(float deltaTime)
{
	if (!mIsAlive)
	{
		return;
	}

	if (mDownStep == 0) //once
	{
		mDownStep = Utils::Random(ROCK_DOWN_STEP, 2 * ROCK_DOWN_STEP);
	}

	mPosition.y += mDownStep;

	if (mPosition.y > (SCREEN_HEIGHT + mImage->GetHeight()))
	{
		mIsAlive = false;
	}
}
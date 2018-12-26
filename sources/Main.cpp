#ifdef WIN32
#include <GameEngine.h>
#include <stdlib.h>
#include "Defines.h"
#include <vld.h>
#include "SceneManager.h"


/**
* The main Program
**/
int main()
{
    // Init Graphics 
    Device *device = Device::GetInstance();
    device->InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT);
	
    Graphics *graphics = device->GetGraphics();
    InputManager *inputManager = InputManager::GetInstance(); 	
	SceneManager* sceneManager = SceneManager::GetInstance();
	sceneManager->Init("../");
    while (device->IsRunning())
    {		
        float deltaTime = GameTime::GetFrameTime();  	
		sceneManager->Update(deltaTime);
		sceneManager->Render(graphics);
    }
	SceneManager::DestroyInstance();
    InputManager::DestroyInstance();
    Device::DestroyInstance();	
    return 0;
}
#endif



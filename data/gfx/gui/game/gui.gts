
//-----------------------------------------------------------------------------
// DEFINITIONS
//-----------------------------------------------------------------------------

DATA_TYPE LIST "Boolean"
{
	0 = "FALSE"
	1 = "TRUE"
}

DATA_TYPE LIST "Draw_Direction"
{  
	0 = "TOP"
	1 = "DOWN"
	2 = "LEFT"
	3 = "RIGHT"
}

DATA_TYPE LIST "Font"
{
	0 = "Font Small"
	1 = "Font Big"
    2 = "Font Huge"
}

DATA_TYPE LIST "V_Align_options"
{
	0 = "Top"
	1 = "Center"
	2 = "Bottom"
}

DATA_TYPE LIST "H_Align_options"
{
	0 = "Left"
	1 = "Center"
	2 = "Right"
}

DATA_TYPE LIST "Sprites"
{
	0	=	"MENU_BUTTONS"
    1   =   "MENU_CURSOR"
	2	=   "PORTRAIT"
    3	=   "MENU 2 "
    4   =   "MISSINON_FAILED"
    5   =   "MISSION_SUCCESS"
    6   =   "MEDAL"
}

DATA_TYPE LIST "text_type"
{
    -1	=   "city name"
    -2  =   "city description"
    -3	=   "Success rate "
    -4  =   "level up to next level"
    -5  =   "mission name"
    -6  =   "choose place"
    -7  =   "mission reward exp"
    -8  =   "loading bar mission"
    -9  =   "assassinate rescued"
   -10  =   "retry time"
   -11  =   "enemy killed"
   -12  =   "bonus"
   -13  =   "level clear time"
   -14  =   "level clear score"
}


//-----------------------------------------------------------------------------
/// Gui data
//-----------------------------------------------------------------------------

TEMPLATE OBJECT_LAYER "____GUIData____"
{
	ID 200
  
	EXPORT_FORMAT
	{
		TEMPLATE_ID   INT8
		NUM_PARAMS    INT8
		PARAMS        CUSTOM
	}
}

// --- rect: draw rect with specified color
TEMPLATE OBJECT_LAYER "GUI_Rect"
{
	ID 201
  
	SET MODULE -1  
	SET FRAME 0
	SET RECT_AREA 0 0 PARAM[0] PARAM[1] RGB( 0, 255, 255)
	//PARAM[3] , PARAM[4] , PARAM[5])  
  
	PARAMS
	{
		50  "Width"        "Area width in pixels"  EXPORT INT16                                           
		50  "Height"       "Area height in pixels" EXPORT INT16                                            
		//0   "ALPHA COLOR"  "fillRect Alpha Color" EXPORT INT8                                      
		0   "RED COLOR"    "fillRect Red Color" EXPORT INT8                                      
		0   "GREEN COLOR"  "fillRect Green Color" EXPORT INT8                                   
		0   "BLUE COLOR"   "fillRect Blue Color" EXPORT INT8                                 
		1   "visible"      "if the object is visible or not"              TYPE "Boolean" EXPORT INT8
		0   "static"       "if true paints the object on the backbuffer"  TYPE "Boolean"  EXPORT INT8
	}
 
	EXPORT_FORMAT
	{
		TEMPLATE_ID   UINT8
		LAYER_ID      UINT16
		LAYER_POS_XY  INT16
		NUM_PARAMS	  UINT8		
		PARAMS		  CUSTOM	
	}
}

// --- fill rect: fill the rectangle with the specified color
TEMPLATE OBJECT_LAYER "GUI_FillRect"
{
	ID 202

	SET MODULE -1  
	SET FRAME 0
	SET RECT_AREA 0 0 PARAM[0] PARAM[1] RGB( 0, 255, 255)
	//PARAM[3] , PARAM[4] , PARAM[5])  
  
	PARAMS
	{
		50  "Width"        "Area width in pixels"  EXPORT INT16                                           
		50  "Height"       "Area height in pixels" EXPORT INT16                                            
		255 "ALPHA COLOR"  "fillRect Alpha Color" EXPORT INT8                                      
		0   "RED COLOR"    "fillRect Red Color" EXPORT INT8                                      
		0   "GREEN COLOR"  "fillRect Green Color" EXPORT INT8                                   
		0   "BLUE COLOR"   "fillRect Blue Color" EXPORT INT8                                 
		1   "visible"      "if the object is visible or not"              TYPE "Boolean" EXPORT INT8
		0   "static"       "if true paints the object on the backbuffer"  TYPE "Boolean"  EXPORT INT8
	}
 
	EXPORT_FORMAT
	{
		TEMPLATE_ID   UINT8
		LAYER_ID      UINT16
		LAYER_POS_XY  INT16
		NUM_PARAMS	  UINT8		
		PARAMS		  CUSTOM	
	}
}

// --- rect: fill the rectangle with the specified gradient color
TEMPLATE OBJECT_LAYER "GUI_GradientRect"
{
	ID 203

	SET MODULE -1  
	SET FRAME 0
	SET RECT_AREA 0 0 PARAM[0] PARAM[1] RGB( 0, 255, 255)
	//PARAM[3] , PARAM[4] , PARAM[5])  

	PARAMS
	{
		50  "Width"      "Area width in pixels" EXPORT INT16                                                        
		50  "Height"     "Area height in pixels" EXPORT INT16                                                      
		1   "Visible"    "If the object is always visible (automatic drawing)"  TYPE "Boolean" EXPORT INT8
		1   "direction"  "Direction of the drawing (towards ... )"              TYPE "Draw_Direction" EXPORT INT8  
		255 "Color1_A"   "Gradient starting alpha color" EXPORT INT8                                           
		0   "Color1_R"   "Gradient starting Red Color" EXPORT INT8                                      
		0   "Color1_G"   "Gradient starting Green Color" EXPORT INT8                                     
		0   "Color1_B"   "Gradient starting Blue Color" EXPORT INT8                                    
		255 "Color2_A"   "Gradient ending alpha color" EXPORT INT8                                    
		0   "Color2_R"   "Gradient ending Red Color" EXPORT INT8                                       
		0   "Color2_G"   "Gradient ending Green Color" EXPORT INT8                                   
		0   "Color2_B"   "Gradient ending Blue Color" EXPORT INT8                                    
	}
  
	EXPORT_FORMAT
	{
		TEMPLATE_ID   UINT8
		LAYER_ID      UINT16
		LAYER_POS_XY  INT16
		NUM_PARAMS	  UINT8		
		PARAMS		  CUSTOM
	}
}

// --- TextareaItem: used to display texts
TEMPLATE OBJECT_LAYER "GUI_TextItem"
{
	ID 204

	SET MODULE -1  
	SET FRAME 0
	SET RECT_AREA 0 0 PARAM[0] PARAM[1] RGB(0, 255, 255)  
  
	PARAMS
	{
		50 "Width"             "Area width in pixels" EXPORT INT16                                                     
		50 "Height"            "Area height in pixels" EXPORT INT16                                              
		0 "Font"              "Font used for DrawString" TYPE "Font" EXPORT INT8      
		-1 "Palette"           "Palette used for DrawString (-1=internal)" EXPORT INT8               
		1 "H_align"           "Horizonal alignment" TYPE "H_Align_options" EXPORT INT8 
		1 "V_align"           "Vertical alignment" TYPE "V_Align_options" EXPORT INT8 
		0 "ResetValOnUpdate"  "If true, will reset it's values on each update" TYPE "Boolean" EXPORT INT8     
		// 0 "specialProp"	   "Special Property" TYPE "Text_options"
		0 "delay"			   "movement delay in milliseconds for intro-outro animations" EXPORT INT16
		0 "offsetX"				"x offset used for intro-outro animations in pixels" EXPORT INT16
		0 "offsetY"				"y offset used for intro-outro animations in pixels" EXPORT INT16
	}
	
	EXPORT_FORMAT
	{
		TEMPLATE_ID   UINT8
		LAYER_ID      UINT16
		LAYER_POS_XY  INT16
		NUM_PARAMS	  UINT8		
		PARAMS		  CUSTOM
	}
}

// --- GUI_GfxItem: paint a sprite animation or frame
TEMPLATE OBJECT_LAYER "GUI_GfxItem"
{
	ID 205

	SPRITE "..\sprites\Menu_buttons.sprite"	// 0
    SPRITE "..\sprites\menu.sprite"	// 1
    SPRITE "..\sprites\portrait.sprite" //2
    SPRITE "..\sprites\menu2.sprite"	// 3
    SPRITE "..\sprites\missinon_failed.sprite" // 4
    SPRITE "..\sprites\mission_success.sprite" // 5

	SET SPRITE PARAM[0]
	SET PALETTE PARAM[3]
	SET MODULE -1
	SET FRAME PARAM[1]
	SET ANIM PARAM[2]
	SET AFRAME 0
	SET RECT_AREA 0 0 5 5 RGB(0, 255, 255)
	//ARGB(255, 255, 255, 255)
  
	PARAMS
	{
		//graph common parameters
		0 "SpriteId"          "Sprite id"                                                                       TYPE "Sprites" EXPORT INT8
		0 "FrameId"           "frame id, if it is an anim -1:loop -2:play once -3:play once and disappear"      TYPE FRAMESDESC[PARAM[0]] EXPORT INT8
		-1 "AnimId"            "anim id, if it is a frame set it to -1"                                         TYPE ANIMSDESC[PARAM[0]] EXPORT INT8
		0 "Palette"           "Palette used to draw the sprite(-1=internal)" EXPORT INT8                                                     
		1 "UseThisPal"        "If true uses the palette specified, otherwise uses the palette set from code"    TYPE "Boolean" EXPORT INT8
		1 "Visible"           "if the object is visible or not"                                                 TYPE "Boolean" EXPORT INT8
		0 "ResetValOnUpdate"  "If true, will reset it's values on each update"                                  TYPE "Boolean" EXPORT INT8
		0 "EndedOnceAnim"     "0 - running, 1 - ended" EXPORT INT8    
		0 "CrtAFrameTime"     "Current animation frame time" EXPORT INT16
		0 "delay"			   "movement delay in milliseconds for intro-outro animations" EXPORT INT16
		0 "offsetX"				"x offset used for intro-outro animations in pixels" EXPORT INT16
		0 "offsetY"				"y offset used for intro-outro animations in pixels" EXPORT INT16
		-1 "AnimIndex"			"FOR INTERNAL USE!" EXPORT INT16
	}

	EXPORT_FORMAT
	{
		TEMPLATE_ID   UINT8
		LAYER_ID      UINT16
		LAYER_POS_XY  INT16
		NUM_PARAMS	  UINT8		
		PARAMS		  CUSTOM
	}
}

// --- GUI_Menu: paint a menu
TEMPLATE OBJECT_LAYER "GUI_Default_Menu"
{
	ID 206

	SET MODULE -1  
	SET FRAME -1
	SET ANIM -1
	SET RECT_AREA 0 0 PARAM[1] PARAM[2] RGB(255, 0, 255)  
  
	PARAMS
	{
		1 "Visible"            "if the object is visible or not"																TYPE "Boolean" EXPORT INT8
		50 "Width"             "Area width in pixels"																			EXPORT INT16                                                     
		50 "Height"            "Area height in pixels"																			EXPORT INT16                                                   
		10 "Visible Items"     "Number of visible menu items"																	EXPORT INT8
		
		50 "Item height"       "Height of menu items"																			EXPORT INT8 
		10 "Item spacing"      "Spacing between menu items"																		EXPORT INT8 
		
		1 "Item H_align"       "Horizontal button alignment relative to menu zone"												TYPE "H_Align_options" EXPORT INT8 
		1 "Item V_align"       "Vertical button alignment relative to menu zone"												TYPE "V_Align_options" EXPORT INT8 
		             
		1 "Text H_align"       "Horizonal text alignment"																		TYPE "H_Align_options" EXPORT INT8 
		1 "Text V_align"       "Vertical text alignment"																		TYPE "V_Align_options" EXPORT INT8              
	}

	EXPORT_FORMAT
	{
		TEMPLATE_ID   UINT8
		LAYER_ID      UINT16
		LAYER_POS_XY  INT16
		NUM_PARAMS	  UINT8		
		PARAMS		  CUSTOM
	}
}

// --- GUI_MenuItem: menu buttons
TEMPLATE OBJECT_LAYER "GUI_MenuItem"
{
	ID 207
	
	SPRITE "..\sprites\Menu_buttons.sprite"	// 0
    SPRITE "..\sprites\menu.sprite"	// 1
    SPRITE "..\sprites\portrait.sprite" //2
    SPRITE "..\sprites\menu2.sprite"	// 3
    SPRITE "..\sprites\missinon_failed.sprite" // 4
    SPRITE "..\sprites\mission_success.sprite" // 5
	

	SET SPRITE PARAM[0]
	SET PALETTE PARAM[4]
	SET MODULE -1
	//SET FRAME PARAM[1]
	SET ANIM PARAM[1]
	SET AFRAME 0
	SET RECT_AREA 0 0 PARAM[1] PARAM[2] RGB(255, 0, 255)  
  
	PARAMS
	{
		0 "SpriteId"          "Sprite id"                                                                       TYPE "Sprites" EXPORT INT8
		-1 "AnimId"           "anim id, if it is a frame set it to -1"											TYPE ANIMSDESC[PARAM[0]] EXPORT INT8
		-1 "Activate AnimID"  "Animation ID when selecting an item"												TYPE ANIMSDESC[PARAM[0]] EXPORT INT8
		-1 "Touch AnimID"	  "Animation ID when pressing the button, if using touch screen"					TYPE ANIMSDESC[PARAM[0]] EXPORT INT8     
		0 "Palette"           "Palette used to draw the sprite(-1=internal)"									EXPORT INT8     
		-1 "Select Pal"       "Palette used when the item is selected; -1 if not used"							EXPORT INT8     
		-1 "Disable Pal"      "Palette used when the item is disabled; -1 if not used"							EXPORT INT8     
		-1 "Special Pal"      "Special palette, if needed; -1 if not used"										EXPORT INT8            
		0 "Font"			  "Font used for basic button text"													TYPE "Font" EXPORT INT8      
		0 "Font Palette"	  "Palette used for basic button text (-1=internal)"								EXPORT INT8  
		-1 "Select FontPal"	  "Font palette used when the item is selected; -1 if not used"						EXPORT INT8            
		-1 "Disable FontPal"  "Font palette used when the item is disabled; -1 if not used"						EXPORT INT8            
		-1 "Special FontPal"  "Special font palette, if needed; -1 if not used"									EXPORT INT8                         
	}

	EXPORT_FORMAT
	{
		TEMPLATE_ID   UINT8
		LAYER_ID      UINT16
		LAYER_POS_XY  INT16
		NUM_PARAMS	  UINT8		
		PARAMS		  CUSTOM
	}
}

// --- GUI_Menu: paint a menu
TEMPLATE OBJECT_LAYER "GUI_Custom_Menu"
{
	ID 208

	SET MODULE -1  
	SET FRAME -1
	SET ANIM -1
	//SET RECT_AREA 0 0 PARAM[1] PARAM[2] RGB(255, 0, 255)  
  
	PARAMS
	{
		1 "Visible"            "if the object is visible or not"																TYPE "Boolean" EXPORT INT8
	}

	EXPORT_FORMAT
	{
		TEMPLATE_ID   UINT8
		LAYER_ID      UINT16
		LAYER_POS_XY  INT16
		NUM_PARAMS	  UINT8		
		PARAMS		  CUSTOM
	}
}

// --- TextareaItem: used to display texts
TEMPLATE OBJECT_LAYER "GUI_NewTextItem"
{
	ID 209

	SET MODULE -1  
	SET FRAME 0
	SET RECT_AREA 0 0 PARAM[0] PARAM[1] RGB(0, 255, 255)  
  
	PARAMS
	{
		50 "Width"             "Area width in pixels" EXPORT INT16                                                     
		50 "Height"            "Area height in pixels" EXPORT INT16                                              
		0 "Font"              "Font used for DrawString" TYPE "Font" EXPORT INT8      
		-1 "Palette"           "Palette used for DrawString (-1=internal)" EXPORT INT8          
		1 "H_align"           "Horizonal alignment" TYPE "H_Align_options" EXPORT INT8 
		1 "V_align"           "Vertical alignment" TYPE "V_Align_options" EXPORT INT8 
		0 "ResetValOnUpdate"  "If true, will reset it's values on each update" TYPE "Boolean" EXPORT INT8     
		// 0 "specialProp"	   "Special Property" TYPE "Text_options"
		0 "delay"			   "movement delay in milliseconds for intro-outro animations" EXPORT INT16
		0 "offsetX"				"x offset used for intro-outro animations in pixels" EXPORT INT16
		0 "offsetY"				"y offset used for intro-outro animations in pixels" EXPORT INT16
        -1 "sel Palette"        "select Palette used for DrawString (-1=internal)" EXPORT INT8   
        -1 "unuse Palette"      "unuse Palette used for DrawString (-1=internal)" EXPORT INT8  
        -1 "sel Font"           "sel Font" TYPE "Font"  EXPORT INT8
        0 "text id"				"text id (0)" TYPE "text_type" EXPORT INT16
	}
	
	EXPORT_FORMAT
	{
		TEMPLATE_ID   UINT8
		LAYER_ID      UINT16
		LAYER_POS_XY  INT16
		NUM_PARAMS	  UINT8		
		PARAMS		  CUSTOM
	}
}

// --- GUI_GfxItem: paint a sprite animation or frame
TEMPLATE OBJECT_LAYER "GUI_NewGfxItem"
{
	ID 210

	SPRITE "..\sprites\Menu_buttons.sprite"	// 0
    SPRITE "..\sprites\menu.sprite"	// 1
    SPRITE "..\sprites\portrait.sprite" //2
    SPRITE "..\sprites\menu2.sprite"	// 3
    SPRITE "..\sprites\missinon_failed.sprite" // 4
    SPRITE "..\sprites\mission_success.sprite" // 5

	SET SPRITE PARAM[0]
	SET PALETTE PARAM[3]
	SET MODULE -1
	SET FRAME PARAM[1]
	SET ANIM PARAM[2]
	SET AFRAME 0
	SET RECT_AREA 0 0 5 5 RGB(0, 255, 255)
	//ARGB(255, 255, 255, 255)
  
	PARAMS
	{
		//graph common parameters
		0 "SpriteId"          "Sprite id"                                                                       TYPE "Sprites" EXPORT INT8
		0 "FrameId"           "frame id, if it is an anim -1:loop -2:play once -3:play once and disappear"      TYPE FRAMESDESC[PARAM[0]] EXPORT INT8
		-1 "AnimId"            "anim id, if it is a frame set it to -1"                                         TYPE ANIMSDESC[PARAM[0]] EXPORT INT8
		0 "Palette"           "Palette used to draw the sprite(-1=internal)" EXPORT INT8                                                     
		1 "UseThisPal"        "If true uses the palette specified, otherwise uses the palette set from code"    TYPE "Boolean" EXPORT INT8
		1 "Visible"           "if the object is visible or not"                                                 TYPE "Boolean" EXPORT INT8
		0 "ResetValOnUpdate"  "If true, will reset it's values on each update"                                  TYPE "Boolean" EXPORT INT8
		0 "EndedOnceAnim"     "0 - running, 1 - ended" EXPORT INT8    
		0 "CrtAFrameTime"     "Current animation frame time" EXPORT INT16
		0 "delay"			   "movement delay in milliseconds for intro-outro animations" EXPORT INT16
		0 "offsetX"				"x offset used for intro-outro animations in pixels" EXPORT INT16
		0 "offsetY"				"y offset used for intro-outro animations in pixels" EXPORT INT16
		-1 "AnimIndex"			"FOR INTERNAL USE!" EXPORT INT16
        -1 "sel or uclock"       "Sel frame id or unlock FrameId"    EXPORT INT16
	}

	EXPORT_FORMAT
	{
		TEMPLATE_ID   UINT8
		LAYER_ID      UINT16
		LAYER_POS_XY  INT16
		NUM_PARAMS	  UINT8		
		PARAMS		  CUSTOM
	}
}


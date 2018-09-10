/*
 * MeggyJrSimple.cpp
 *
 * A copy of the MeggyJrSimple.h file implementations.
 * Put prototypes in MeggyJrSimple.h.
 * Moved implementations here to enable separate
 * compilation and simplify .s files that MeggyJava
 * compiler needs to generate.
 */
/*
  MeggyJrSimple.h - Meggy Jr RGB library for Arduino
   The Meggy Jr Simplified Library (MJSL)
   
  Version 1.4 - 4/17/2010       http://www.evilmadscientist.com/
  Copyright (c) 2010 Windell H. Oskay.  All right reserved.

    This library is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this library.  If not, see <http://www.gnu.org/licenses/>.
	  
*/

#include "MeggyJrSimple.h"

MeggyJr Meg;
byte GameSlate[8][8];       
byte lastButtonState;

byte Button_A;		 
byte Button_B;
byte Button_Up;
byte Button_Down;
byte Button_Left;
byte Button_Right;
 
//Color lookup Table
byte ColorTable[26][3] = 
{
  { MeggyDark  },  
  { MeggyRed  }  ,
  { MeggyOrange  },
  { MeggyYellow  },
  { MeggyGreen  },
  { MeggyBlue  } ,
  { MeggyViolet  },
  { MeggyWhite  },  
  { MeggyDimRed  },  
  { MeggyDimOrange  },  
  { MeggydimYellow  },  
  { MeggyDimGreen  },  
  { MeggydimAqua  },  
  { MeggyDimBlue  },  
  { MeggydimViolet  },   
  { MeggyCursorColor},      //Extra bright cursor position color (not white).
  {0,0,0},					//CustomColor0 (dark, by default)
  {0,0,0},			        //CustomColor1 (dark, by default)
  {0,0,0},					//CustomColor2 (dark, by default)
  {0,0,0},					//CustomColor3 (dark, by default)	
  {0,0,0},					//CustomColor4 (dark, by default)
  {0,0,0},					//CustomColor5 (dark, by default)
  {0,0,0},					//CustomColor6 (dark, by default)
  {0,0,0},					//CustomColor7 (dark, by default)
  {0,0,0},					//CustomColor8 (dark, by default)
  {0,0,0}					//CustomColor9 (dark, by default)
}; 

  
void CheckButtonsDown()
	{ 
	 byte i = Meg.GetButtons(); 
	 
 	 Button_B  = (i & 1);      
     Button_A = (i & 2);     
     Button_Up = (i & 4);
     Button_Down = (i & 8);
     Button_Left = (i & 16);
     Button_Right = (i & 32);
	 
	 lastButtonState = i; 
	}
	 
void CheckButtonsPress()
	{
	 byte j;
	 byte i = Meg.GetButtons();
	 j = i & ~(lastButtonState);  // What's changed?
	 
 	 Button_B  = (j & 1);      
     Button_A = (j & 2);     
     Button_Up = (j & 4);
     Button_Down = (j & 8);
     Button_Left = (j & 16);
     Button_Right = (j & 32);
	 
	 lastButtonState = i;
	}
 
 
// Write a byte to the Auxiliary LED set at the top of the LED matrix display.  
void SetAuxLEDs(byte InputLEDs)
	{
		Meg.AuxLEDs = InputLEDs;
	}

 

// Write a byte to the Auxiliary LED set at the top of the LED matrix display.  
// This version reverses bit order, so you can call it with an explicit binary number
void SetAuxLEDsBinary(byte n)
{
n = (n & 240) >> 4 | (n & 15) << 4; 
n = (n & 204) >> 2 | (n & 51) << 2; 
Meg.AuxLEDs = (n & 170) >>1 | (n & 85) << 1; 
}

 


// Simple function to color in a pixel at position (x,y,color):
void DrawPx(byte xin, byte yin, byte color)
{
		GameSlate[xin][yin] = color;
}


// Same as above, except checks to see if pixel is onscreen
// This function is new as of v 1.4
void SafeDrawPx(byte xin, byte yin, byte color)
{
    if ((xin >= 0) && (xin <= 7) && (yin >= 0) && (yin <= 7))
		GameSlate[xin][yin] = color;
}

// function to read color of pixel at position (x,y):
byte ReadPx(byte xin, byte yin)
{   
	return	GameSlate[xin][yin];
}


//Empty the Game Slate:
void ClearSlate(void)
{
  byte i;
  byte j;
  i = 0;
  while (i < 8) { 
    j = 0;
    while ( j < 8)
    {
      GameSlate[i][j] = 0;
      j++;
    }
    i++;
  }
}


// DisplaySlate() :: Write the Game Slate to the Display Memory it.
// This function looks up each color number (name) stored in the Game Slate,
// retreives its R,G,B components from the color table, and writes them to the
// R,G,B parts of the display memory.

void DisplaySlate (void) {	
  byte  j = 0; 
  while (j < 8) 
  {
    Meg.SetPxClr(j, 7, ColorTable[ GameSlate[j][7] ]);   
    Meg.SetPxClr(j, 6, ColorTable[ GameSlate[j][6] ]);  
    Meg.SetPxClr(j, 5, ColorTable[ GameSlate[j][5] ]);   
    Meg.SetPxClr(j, 4, ColorTable[ GameSlate[j][4] ]);  
    Meg.SetPxClr(j, 3, ColorTable[ GameSlate[j][3] ]);   
    Meg.SetPxClr(j, 2, ColorTable[ GameSlate[j][2] ]);  
    Meg.SetPxClr(j, 1, ColorTable[ GameSlate[j][1] ]);   
    Meg.SetPxClr(j, 0, ColorTable[ GameSlate[j][0] ]);  
    j++; 
  }  	 
}  
  
 
 // other sound functions:
void Tone_Start(unsigned int divisor, unsigned int duration_ms)
{
  Meg.StartTone(divisor, duration_ms);
}



#define Tone_Update(); {}			// For backwards compatibility.

/*
  // Stop the note if its completion time has come.
void Tone_Update(void)
{
 // Obsolete with current version of library; sounds stop automatically.
 // please remove this function from your program if it is there.
}
*/


void EditColor(byte WhichColor, byte RedComponent, byte GreenComponent, byte BlueComponent)
{
   ColorTable[WhichColor][0] = RedComponent;
   ColorTable[WhichColor][1] = GreenComponent;
   ColorTable[WhichColor][2] = BlueComponent;
 } 




void MeggyJrSimpleSetup(void) 
  {
		Meg = MeggyJr();  
		
	    lastButtonState = Meg.GetButtons();
		
		 Meg.StartTone(0, 0);
	//	 Tone_Update();
		 SoundOff();
  }

/* MMS, added this */  
void delay_ms(unsigned int time) {
    _delay_ms(time);
    
	/*uint32_t i;
	for (i = 0; i < time; i++) {
		_delay_ms(1);
	}*/
}

byte GetButtons() {
    return Meg.GetButtons();
    
    // FIXME: make consistent with rest of interface
}

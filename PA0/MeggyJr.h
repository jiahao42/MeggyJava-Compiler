/*
  MeggyJr.h - Meggy Jr RGB library for Arduino
  Version 1.4 - 4/17/2010
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
	
	Thanks to Arthur J. Dahm III and Jay Clegg for code written for the Peggy 2.0,
	which was adapted to make this library.  
	
*/


#ifndef byte
#define byte uint8_t
#endif

#ifndef MeggyJr_h
#define MeggyJr_h

#include <inttypes.h>
#include <avr/interrupt.h>
#include <avr/io.h>
#include <util/delay.h>

#define FPS 120						// Frames per second; value can be changed somewhat.
#define DISP_BUFFER_SIZE 192		// 8 rows * 24 bytes per row == 192. Don't mess with it. :)
#define MAX_BRIGHTNESS 15			// 16 steps of brightness per pixel

// Predefined Colors: 
#define MeggyDark      0,  0,   0
#define MeggyRed       6,  0,   0
#define MeggyOrange   12,  5,   0
#define MeggyYellow    7,  10,  0
#define MeggyGreen     0,  15,  0
#define MeggyBlue      0,   0,  5
#define MeggyViolet    8,   0,  4
#define MeggyWhite     3,  15,  2 
 
#define MeggyDimRed    1,  0,   0
#define MeggyDimGreen  0,  1,   0
#define MeggyDimBlue   0,  0,   1
#define MeggyDimOrange 1,  1,   0 
#define MeggydimYellow 1,  1,   0
#define MeggydimAqua   0,  3,   1
#define MeggydimViolet 2,  0,   1

//#define SoundEnabled (TCCR1B > 0)

// Optional timing test routine; can be used to measure
// duration of interrupt refresh routine.
//#define  timingtest 1


class MeggyJr
{
	public:
		MeggyJr(void);										// Constructor
		
		static byte MeggyFrame[DISP_BUFFER_SIZE];
		static byte AuxLEDs;
		
		static byte SoundEnabled;		static byte SoundAllowed;	 
		
	//	 static volatile byte ToneInProgress;		// Removed, v 1.3		 
	//	static unsigned long SoundStopTime;			// Removed, v 1.3
		
		void ClearMeggy (void);	
		void ClearPixel(byte x, byte y);
		byte GetButtons(void);

		byte GetPixelR(byte x, byte y);
		byte GetPixelG(byte x, byte y);
		byte GetPixelB(byte x, byte y);
		 
		void SetPxClr(byte x, byte y, byte rgb[3]);
		static byte *currentColPtr;
		static byte  currentCol;
		static byte  currentBrightness;

		void SoundState(byte t);
        void StartTone(unsigned int Tone, unsigned int duration)  ;  
//		void SoundCheck(void) ;  // End sound if it's time to do so.   // Removed, v 1.3

 		static unsigned int ToneTimeRemaining;			// new, v 1.3

#ifdef timingtest
	static unsigned int testTime;
#endif
	    
	private: 
		
};

#endif


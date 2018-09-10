/*
 * PA3buttondot.cpp
 *
 *  Created on: Feb 15, 2011
 *      Author: Saleh Alkhalaf
 */


#include "MeggyJrSimple.h"

int main (void)
{
	MeggyJrSimpleSetup();



	DrawPx(7, 7, Orange);
	DisplaySlate();


	// infinite loop that checks for button presses every half second
	for(;;) {
		CheckButtonsDown();
		if (Button_A) {
			ClearSlate();
			DrawPx(0, 0, Violet );
			DisplaySlate();

		}

		else if (Button_B) {
			ClearSlate();
			DrawPx(7, 0, Green );
			DisplaySlate();
		}
		else {
			ClearSlate();
			DrawPx(7, 7, Orange );
			DisplaySlate();

		}

	}

	// tenth second delay, 100 milliseconds
	delay(100);


	return 0;
}

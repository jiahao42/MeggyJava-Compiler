/*
    PA2bluedot.cpp
    
    C++ version of PA2bluedot.java.
    
*/
#include "MeggyJrSimple.h"

int main (void)
{
    MeggyJrSimpleSetup();
    
    // Meggy.setPixel( (byte)1, (byte)2, Meggy.Color.BLUE );
    DrawPx(1, 2, Blue);
    DisplaySlate();


    // Infinite while loop we will be generating for the end of each main.
    while (1);
    return 0;
}

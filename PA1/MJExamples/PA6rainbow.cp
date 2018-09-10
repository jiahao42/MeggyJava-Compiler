/*
    PA6rainbow.cpp
    
    C++ version of PA6rainbow.java.
        
    MMS, 2/2/11
*/
#include "MeggyJrSimple.h"
#include <stdlib.h>

struct Rainbow {
    byte * p;
};

void run(struct Rainbow * thisptr, byte row);
void displayRow(struct Rainbow * thisptr, byte row, byte *p);

// Draws a rainbow on the given row
int main (void)
{
    struct Rainbow * rptr = (struct Rainbow*)malloc(sizeof(struct Rainbow));

    // display a rainbow on row 5
    run(rptr, 5);

    while (1) {}
    
    return 0;
}

void run(struct Rainbow * thisptr, byte row) {
    
    thisptr->p = (byte*)malloc(8);
    thisptr->p[0] = Red;
    thisptr->p[1] = Orange;
    thisptr->p[2] = Yellow;
    thisptr->p[3] = Green;
    thisptr->p[4] = Blue;
    thisptr->p[5] = Violet;
    thisptr->p[6] = White;
    thisptr->p[7] = Dark;

    displayRow(thisptr,5,thisptr->p);
    

}

void displayRow(struct Rainbow * thisptr, byte row, byte *p) {
    int i;

    i=0;
    while (i<8) {
        DrawPx(i, row, p[i]);
        DisplaySlate();        
        i = i+1;
    }
}

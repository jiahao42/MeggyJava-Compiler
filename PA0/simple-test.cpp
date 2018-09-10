#include "MeggyJrSimple.h"

int main (void)
{
    MeggyJrSimpleSetup();
    

    while (1) {
        DrawPx(3, 6, 1);    // should display red LED
        DisplaySlate();

    }

    return 0;
}

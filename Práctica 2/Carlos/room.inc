#include "colors.inc"

/* ROOM */
#declare room = 
    union {
        difference {
            box {
            <20, -7, 11>,
            <-11, 7, -11>
            }

            box {
            <19, -6, 10>,
            <-10, 6, -10>
            }
        }

        pigment {
            White
        }
    }
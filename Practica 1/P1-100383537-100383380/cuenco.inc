// **** Includes **** //
#include "stones1.inc"

// **** Figuras **** //
#declare cuenco =
    union {
        sor {
            4,
            <0, 0>, <0.6, 0>, <0.5, 0.4>, <0, 0.4>
        }

        sor {
            4,
            <0, 0.4>, <0.5, 0.4>, <1.2, 1.35>, <0, 1.35>

            open
        }

        texture {
            T_Stone8
        }
    }
//  **** Especificar version POV-Ray **** //
#version 3.7;

// **** Includes **** //
#include "colors.inc"

// ****  Ejes de coordenadas tridimensionales **** //
#macro ejes (longtiud)
    union {
        #local radio_ejes = 0.02;
        #local centro = 0;
        // Eje X
        cylinder {
            centro,
            longtiud*x,
            radio_ejes
            pigment { Red }
        }
        // Eje Y
        cylinder {
            centro,
            longtiud*y,
            radio_ejes
            pigment { Green }
        }
        // Eje Z
        cylinder {
            centro,
            longtiud*z,
            radio_ejes
            pigment { Blue }
        }
    }
#end
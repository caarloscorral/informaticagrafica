#include "colors.inc"

#declare cuenco = 
    union {
        // Base
        sor {
            4,
            <0,0>, <2.1,0>, <2,1.8>, <0,1.8> 
                
            texture {
                pigment {
                    color White
                }
            }
        }

        // Parte de arriba    
        sor {
            4,
            <0,0.5>, <1,0.5>, <4,3.5>, <0,3.5> 
            open
            texture {
                pigment {
                    color White
                }
            }
        }
    }
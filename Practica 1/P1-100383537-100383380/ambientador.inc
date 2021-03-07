// **** Includes **** //
#include "colors.inc"
#include "textures.inc"

// **** Figuras **** //
#declare ambientador = 
union {
    // Caja con huecos //
    difference {
        // Caja sin huecos
        box {
            <0.7, 0, 0>,
            <0, 1, 1>
        }

        // Hueco lateral
        cylinder {
            <0.7, 0.5, 0.5>, 
            <0, 0.5, 0.5>, 
            0.3

            open
        }

        // Hueco techo
        cylinder {
            <0.35, 1, 0.5>, 
            <0.35, 0.7, 0.5>, 
            0.2

            open   
        }

        texture {
            DMFWood4
        }
    }

    // Cilindro interno //
    union {
        difference {
            // Cilindo interno entero
            cylinder {
                <0.35, 0.95, 0.5>,
                <0.35, 0.1, 0.5>,  
                0.23
            }

            // Cilindro hueco del techo
            cylinder {
                <0.35, 0.95, 0.5>, 
                <0.35, 0.7, 0.5>, 
                0.15

                open
            }

            texture {
                Glass3
            }
        }

        // Cilindro para el liquido //
        cylinder {
            <0.35, 0.3, 0.5>, 
            <0.35, 0.1, 0.5>, 
            0.22

            pigment { 
                Green
            }
        }
    }

    // Palillos //
    union {
        // Palillo izquierda
        cylinder {
            <0.35, 0, 0.7>, 
            <0.35, 2.35, 0.7>, 
            0.02

            translate <-0.35, 0, -0.7> 
            rotate <-18, 0, -4> 
            translate <0.35, 0, 0.7>
        }

        //  Palillo central //
        cylinder {
            <0.5, 0, 0.65>,  
            <0.5, 2.35, 0.65>, 
            0.02

            translate <-0.5, 0, -0.65> 
            rotate <-8, 0, 13> 
            translate <0.5, 0, 0.65> 
        }

        // Palillo derecha //
        cylinder {
            <0.45, 0, 0.4>, 
            <0.45, 2.35, 0.4>, 
            0.02

            translate <-0.45, 0, -0.4> 
            rotate <11, 0, 12>
            translate <0.45, 0, 0.4> 
        }
        
        texture { 
            Jade
        }
    }
}

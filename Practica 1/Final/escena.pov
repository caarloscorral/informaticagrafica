#include "colors.inc"

#include "cuenco.inc"
#include "ambientador.inc"
#include "portavelas.inc"
#include "esfera.inc"

#include "ejes.inc"
ejes(10)

camera {
    //location <4, 13,-20>
    //look_at <0,5,0>
    //location <5, 5,-16>
    location <5, 3, 1.6>
    look_at <-0.5, 0, 0.5>
    right (x * image_width) / image_height
}

light_source {
    //<10, 10, -25>
    <-6.2, 9, -1>
    color White
}
   
// Plano vertical
// plane {
//     <1, 0.5, 0.3>, -2.3

//     texture {
//         pigment {
//             color DarkGreen
//         }
//     }                                                                          
// }

plane {
    <3, 1, 1.2>, -3.2

    texture {
        pigment {
            color DarkGreen
        }
    }                                                                          
}

// Plano horizontal
plane {
    y, 0

    texture {
        pigment {
            color White
        }
    }                                                                          
}

object {
    cuenco

    scale 0.45
    translate <1.44, 0, 1.28>
}


object {
    ambientador

    translate <0, 0, 0>
}

object {
    portavelas

    scale <0.22, 0.45, 0.22>
    rotate <0, 20, 0>
    translate <-0.5, 0, -0.8>
}

object {
    esfera

    scale 0.5
    translate <1.35, 0.5, -0.45>
}                         

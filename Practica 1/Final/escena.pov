#include "colors.inc"

#include "cuenco.inc"
#include "ambientador.inc"
#include "portavelas.inc"
#include "esfera.inc"

#include "ejes.inc"
ejes(10)

camera {
    //location <4,13,-20>
    //look_at <0,5,0>
    //location <5, 5,-16>
    location <2, 1, 2>
    look_at <0, 0, 0>
}

light_source {
    //<10, 10, -25>
    <-5, 50, 30>
    color White
}

// plane {
//     <-0.1,1.2,0.18>, 0.5

//     texture {
//         pigment {
//             color White
//         }
//     }

//     //rotate <0, 0, 2>
//     //translate <0, -999999.9, 0>                                                                                 
// }

object {
    cuenco

    //translate <4, 2.5, -6>
    //scale <0.7, 0.7, 0.7>
}


// object {
//     ambientador

//     scale 6
//     rotate <0, -94, 3.1>
//     translate <1, -0.7, 4>
// }

// object {
//     portavelas

//     translate <-6, -0.64, 8>
//     scale <1.75, 3, 1.75>
//     rotate <0, -8, 0>
// }

// object {
//     esfera

//     scale 2.3
//     translate <-4.5, 3.35, -5> // <x, y, z>
// }                         

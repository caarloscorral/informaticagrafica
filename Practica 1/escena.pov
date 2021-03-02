#include "colors.inc"

#include "cuenco.inc"
#include "ambientador1.inc"
#include "portavelas.inc"
#include "esfera.inc"

camera {
    //location <4,13,-20>
    //look_at <0,5,0>
    location <5,13,-20>
    look_at <0,5,1>
}

light_source {
    <10, 10, -25>
    //<0, 10, 30>

    color White
}

plane {
    <-0.1,1.2,0.18>, 0.5

    texture {
        pigment {
            color White
        }
    }

    //rotate <0, 0, 2>
    //translate <0, -999999.9, 0>                                                                                 
}

object {
    cuenco

    translate <4, 2.5, -6>
    scale <0.7, 0.7, 0.7>
}

// object {
//     ambientador

//     translate <-4, 0, 1>
//     rotate <0, -0.5, 0>
//     scale 1.1
// }

object {
    ambientador

    scale 6
    rotate <0, -94, 0>
    translate <1, 0, 4>
    
    
}

object {
    portavelas

    translate <-6, 0, 8>
    scale <1.75,3,1.75>
    rotate <0, -8, 0>
}

object {
    esfera

    scale 2.3
    translate <-4.5, 5, -5> // <x, y, z>
}                         

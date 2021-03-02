#include "colors.inc"

#include "cuenco.inc"
#include "ambientador.inc"
#include "portavelas.inc"

camera {
    //location <4,13,-20>
    //look_at <0,5,0>
    location <5,11,-20>
    look_at <0,5,1>
}

light_source {
    //<10, 10, -25>
    <3, 15, -16>

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

    translate <4.5, 2.5, -7>
    scale 0.65
}

object {
    ambientador

    translate <-4, 0, 1>
    rotate <0, -0.5, 0>
    scale 1.1
}

object {
    portavelas

    translate <-5.5, 0, 8>
    scale <1.75,3,1.75>
    rotate <0, -8, 0>
}
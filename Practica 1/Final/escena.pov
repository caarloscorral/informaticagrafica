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
    location <5, 3, 1.6>
    look_at <0, 1, 0.5>
    right (x * image_width) / image_height
}

light_source {
    //<10, 10, -25>
    <20, 20, 0>
    color White
}
   
// Plano vertical
plane {
    <1, 0, 0.35>, -5

    texture {
        pigment {
            color Black
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

    scale 0.48
    translate <1.25, 0, 1.16>
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
    translate <1.25, 0.5, -0.45>
}                         

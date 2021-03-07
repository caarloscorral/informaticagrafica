// **** Includes **** //
#include "colors.inc"
#include "cuenco.inc"
#include "ambientador.inc"
#include "portavelas.inc"
#include "esfera.inc"

// Camara
camera {
    location <3.5, 2.1, 1.12>
    look_at <-0.5, 0, 0>
    right (x * image_width) / image_height
}

// Luz
light_source {
    <-6.2, 9, -1>
    color White
}

// **** Planos **** //
// Plano vertical
box {
    <-3.5, 0, -20>,
    <-3.5, 4.5, 20>
    texture {
        pigment {
            color DarkGreen
        }
    }
    rotate <0, -22, 0>
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

// **** Objetos **** //
// Cuenco
object {
    cuenco

    scale 0.45
    translate <1.44, 0, 1.28>
}

// Ambientador
object {
    ambientador

    translate <0, 0, 0>
}

// Portavelas
object {
    portavelas

    scale <0.22, 0.45, 0.22>
    rotate <0, 20, 0>
    translate <-0.5, 0, -0.8>
}

// Esfera
object {
    esfera

    scale 0.5
    translate <1.35, 0.5, -0.45>
}                         

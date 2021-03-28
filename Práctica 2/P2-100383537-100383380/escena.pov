/******** Includes ********/
#include "bench.inc"
#include "room.inc"
#include "stands.inc"
#include "dontpass.inc"
#include "fractal1.inc"
#include "fractal2.inc"
#include "fractal3.inc"

// Camara
camera {
  location <10, 0, 0>
  look_at <0, 0, 0>
}

// Luz principal
light_source {
  <0, 0, 10>, 0.15
  media_interaction off
}

/******** Objetos ********/
// Habitacion
object {
  room
}

// Soportes
object {
  stands
}

// Separacion (postes y cuerda)
object {
  dontpass
}

// Banco
object {
  Bench

  rotate 90
  scale 3
  translate <-2, -6, 0>
}

// Esponja de Menger
object {
  menger_sponge
  
  scale 1.25
  translate <-7.5, -2, -5.6>
}

// Arbol fractal
object {
  arbol
    
  scale 2
  rotate y*90
  translate <-7, -2, 0>
}

// Fractal de Julia
object {
  fractal_julia

  scale 1.25
  translate <-6.8, -0.95, 5>
}

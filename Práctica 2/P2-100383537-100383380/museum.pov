/******** INCLUDES ********/
#include "colors.inc"
#include "golds.inc"
#include "woods.inc"
#include "textures.inc"
#include "metals.inc"
#include "functions.inc"
#include "bench.inc"
#include "room.inc"
#include "stands.inc"
#include "dontpass.inc"
#include "fractal1.inc"
#include "fractal2.inc"
#include "fractal3.inc"

/******** SCENE ********/
global_settings {
  assumed_gamma 1
}

// Camera
camera {
  location <13, 0, 0>
  look_at <0, 0, 0>
}

// Main light
light_source {
  <0, 0, 10>, 0.15
  media_interaction off
}

/******** OBJECTS ********/
// Room
object {
  room
}

// Stands
object {
  stands
}

// Don't pass section
object {
  dontpass
}

// Bench
object {
  Bench

  rotate 90
  scale 3
  translate <-2, -6, 0>
}

// Menger Sponge fractal
object {
  menger_sponge

  scale 1.25
  translate <-7.5, -2, -5.6>
}

Tree fractal
object {
  arbol

  scale 1.25
  translate <-7, -2, 0>
}

// Julia fractal
object {
  fractal_julia

  scale 1.25
  translate <-6.8, -0.95, 5>
}

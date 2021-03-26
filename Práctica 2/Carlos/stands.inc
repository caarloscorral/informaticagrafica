#include "colors.inc"
#include "textures.inc"

/* STANDS */
#declare stands = 
    union {
        // Left stand
        union {
            // Stand
            box {
                <-6, -6, -6>,
                <-8, -2, -4>
            }

            // Name
            box {
                <-5.99, -2.5, -5.75>,
                <-5.99, -3, -4.25>

                texture {
                    Silver_Texture
                }
            }

            text {
                ttf "arial.ttf", "Menger Sponge", 0.1, 0

                pigment { 
                    Black
                }
            
                rotate <0, -90, 0>
                scale 0.2
                translate <-5.98, -2.83, -5.7>
            }

            // Light
            light_source {
                <-5.99, 1.5, -5>
                color White
                cylinder radius 4 falloff 3 tightness 1
                point_at <-7, 0, -5>
            }
        }

        // Center stand
        union {
            // Stand
            box {
                <-6, -6, -1>,
                <-8, -2, 1>
            }

            // Name
            box {
                <-5.99, -2.5, -0.75>,
                <-5.99, -3, 0.75>

                texture {
                    Silver_Texture
                }
            }

            text {
                ttf "arial.ttf", "Tree Fractal", 0.1, 0

                pigment { 
                    Black
                }
                
                rotate <0, -90, 0>
                scale 0.25
                translate <-5.98, -2.83, -0.64>
            }

            // Light
            light_source {
                <-5.99, 1.5, 0>
                color White
                cylinder radius 4 falloff 3 tightness 1
                point_at <-7, 0, 0>
            }
        }

        // Right stand
        union {
            // Stand
            box {
                <-6, -6, 6>,
                <-8, -2, 4>
            }

            // Name
            box {
                <-5.99, -2.5, 5.75>,
                <-5.99, -3, 4.25>

                texture {
                    Silver_Texture
                }
            }

            text {
                ttf "arial.ttf", "Julia Fractal", 1, 0

                pigment { 
                    Black
                }
                
                rotate <0, -90, 0>
                scale 0.25
                translate <-5.98, -2.83, 4.35>
            }

            // Light
            light_source {
                <-5.99, 1.5, 5>
                color White
                cylinder radius 4 falloff 3 tightness 1
                point_at <-7, 0, 5>
            }
        }

        texture {
            T_Wood3
        }
    }
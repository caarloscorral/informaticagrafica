#include "colors.inc"
#include "metals.inc"

/* JULIA FRACTAL */
#declare fractal_julia = 
    julia_fractal {
        <-0.89466546, 0.0, 0.25, 0.0>
        quaternion
        sqr
        max_iteration 15
        precision 100
        
        pigment {
            Red 
        }

        finish {
            ambient 0.1
            diffuse 1
            reflection 0.1
            specular 10
            metallic 1
        }

        rotate <60, 135, -20>
    }
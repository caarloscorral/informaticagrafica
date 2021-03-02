#include "colors.inc"
#include "woods.inc"

camera {
    location <0,6,-10>
    look_at <0,0,0>
}

light_source {
    <0, 0, -25>
    color rgb <1, 1, 1>
}

union {
    sor {
        4,//Number of points, at least 4
        <0,0>, <3,0>, <1,2>, <0,2> 
        
        texture {
            T_Wood9
        }
    }
    
    sor {
        4,//Number of points, at least 4
        <0,2>, <1,2>, <4,5>, <0,5> 
        open
        pigment {
            color Red
        }
    }
}


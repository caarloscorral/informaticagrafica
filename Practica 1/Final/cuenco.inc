#include "stones1.inc"

#declare cuenco =
    difference {
        sor {
            // 5,
            // <0, 0>, <0.6, 0>, <0.65, 0.4>, <1.1, 1.2>, <0, 1.2>

            14,
            <0, 0>, <0.6, 0>, <0.65, 0.4>, <0.7, 0.45>, <0.75, 0.5>, <0.8, 0.55>, <0.85, 0.6>,
            <0.9, 0.65>, <0.95, 0.7>, <1, 0.75>, <1.05, 0.8>, <1.1, 0.85>, <1.1, 0.9>, <0, 1.2>
            
            texture {
                T_Stone8
            }
        }
            
        cylinder {
            <0, 1, 0>, <0, 1.2, 0>, 1.5 // center of one end, center of other end, radius
            open // remove end caps    
        }
    }
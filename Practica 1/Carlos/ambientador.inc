#include "colors.inc"
#include "textures.inc"
#include "woods.inc"

#declare ambientador = 
    union {
        union {
            // Caja de madera con agujero en el medio en forma de esfera
            difference {
                // Caja de madera
                box {
                    <0,0,0>, <6,6,3>
                    texture {
                        DMFWood6
                    }
                }
                
                // Esfera
                sphere {
                    <3,3,1.5>, 2.4
                    texture {
                        DMFWood6
                    }
                }
            }
            
            // Recipiente cilíndrico de cristal para los palos
            cylinder {
                <3,1,1.5>, <3,5,1.5>, 1.5
                texture {
                    Glass
                }

            }
        }
        
        // Agujero superior para introducir los palos
        difference {
            // Agujero exterior
            cylinder {
                <3,5.9,1.5>, <3,6,1.5>, 0.6
                
                texture {
                    Chrome_Metal
                }
            }

            // Agujero interior    
            cylinder {
                <3,0,1.5>, <3,6,1.5>, 0.4
                open
            }
        }
        
        // Palo derecha
        cylinder {
            <3,1,1.5>, <3,10,1.5>, 0.05
            
            texture {
                T_Wood1

                pigment {
                    color MediumForestGreen
                }
            }
            
            rotate <0, 0, -8>
            translate <-0.8, 0, 0>
        }
        
        // Palo izquierda
        cylinder {
            <3,1,1.5>, <3,10,1.5>, 0.05
            
            texture {
                T_Wood1

                pigment {
                    color MediumForestGreen
                }
            }
            
            rotate <0, 0, 9>
            translate <0.8, 0, 0>
        }
        
        // Palo centro
        cylinder {
            <3,1,1.5>, <3,10,1.5>, 0.05
            
            texture {
                T_Wood1

                pigment {
                    color MediumForestGreen
                }
            }
            
            rotate <0, 0, 1>
        }
    }
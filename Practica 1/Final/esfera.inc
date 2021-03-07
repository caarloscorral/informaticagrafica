// **** Includes **** //
#include "textures.inc"
#include "colors.inc"

// **** Figuras **** //
#declare esfera = 
    union {
        // Bola grande
        sphere {
            <0, 0, 0>, 
            1

            texture {
                Ruby_Glass
            }
        }

        // Bolas pequeñas
        #declare S = seed(100); 
        #declare num_esferas = 200;
        #declare radio_max = 0.06;
        #declare radio_min = 0.01;

        #while (num_esferas > 0)
        // Formula rand() de [min, max] -> min+(max-min)*rand()
            #declare radio_esferas = radio_min+(radio_max-radio_min)*rand(S);
            #declare centro_esfera = <2*rand(S)-1, 2*rand(S)-1, 2*rand(S)-1>;

            #while (vlength(centro_esfera) > 1-radio_esferas)
                #declare centro_esfera = <2*rand(S)-1, 2*rand(S)-1, 2*rand(S)-1>;
            #end

            sphere {
                centro_esfera
                radio_esferas

                texture {
                    pigment { 
                        color Orange
                        transmit 0.5
                    }
                }
            }

            #declare num_esferas = num_esferas - 1;
        #end
    }


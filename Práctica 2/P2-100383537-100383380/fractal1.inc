#macro voidCubes(dim) 
    #declare y1 = (1/3) / (pow(3, dim));
    #declare z1 = (1/3) / (pow(3, dim));
    
    #declare prod1 = -0.1;
    #declare prod2 = 1.1;
    
    #declare psize = (1/3) / (pow(3, dim));
                    
    #while (z1 <= 1)
        #declare y1 = (1/3) / (pow(3, dim));
        #while (y1 <= 1)
            box {
                <prod1, y1, z1>,
                <prod2, y1 + psize, z1 + psize>

                pigment {
                    Coral
                }
            }

            box {
                <y1, z1, prod1>,
                <y1 + psize, z1 + psize, prod2>
                pigment {
                    Coral
                }
            } 

            box {
                <y1, prod1, z1>,
                <y1 + psize, prod2, z1 + psize>
                pigment {
                    Coral
                }
            }                                                
                                             
            #declare y1 = y1 + pow((1/3), dim);
        #end
        
        #declare z1 = z1 + pow((1/3), dim);

    #end             
#end   

/* Esponja de Menger */
#declare menger_sponge = 
    difference {
        box { 
            <0, 0, 0>,
            <1, 1, 1> 
        }

        voidCubes(0)
        voidCubes(1)
        voidCubes(2)
        voidCubes(3)
        voidCubes(4)

        pigment {
            Coral
        }
    
        finish {
            ambient 0.75
            diffuse 0.15
            specular 1
            roughness 5
            reflection {
                0.75
                metallic
            }
        }             
    }

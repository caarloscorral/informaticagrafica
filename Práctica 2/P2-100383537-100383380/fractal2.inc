#macro DibujarRama(base_inferior, base_superior, verde_rgb)
#local ancho_rama = 0.02;
cylinder {
    base_inferior, base_superior, ancho_rama
    pigment { 
        #local red_rgb = 99;
        #local blue_rgb = 45;
        rgb <red_rgb/255, verde_rgb/255, blue_rgb/255>
    }
}
#end

#declare arbol = 
    union {
        #declare iteraciones = 4;

        // Expandir gramatica
        #declare longitud_gramatica = 13;
        #declare gramatica = array[longitud_gramatica] {"F","[","+","F","]","F","[","-","F","]","[","F","]"}
        #for (i, 0, iteraciones-1, 1)
            #declare nueva_longitud = 0;
            #for(j, 0, longitud_gramatica-1, 1)
                #switch (asc(gramatica[j]))
                    #case (asc("F"))
                        #declare nueva_longitud = nueva_longitud + 13;
                        #break
                    #else
                        #declare nueva_longitud = nueva_longitud + 1;
                        #break
                #end
            #end
            #declare nueva_gramatica = array[nueva_longitud];
            #declare index = 0;
            #for (j, 0, longitud_gramatica-1, 1)
                #switch (asc(gramatica[j]))
                    #case (asc("F"))
                        #declare nueva_gramatica[index] = "F";
                        #declare nueva_gramatica[index+1] = "[";
                        #declare nueva_gramatica[index+2] = "+";
                        #declare nueva_gramatica[index+3] = "F";
                        #declare nueva_gramatica[index+4] = "]";
                        #declare nueva_gramatica[index+5] = "F";
                        #declare nueva_gramatica[index+6] = "[";
                        #declare nueva_gramatica[index+7] = "-";
                        #declare nueva_gramatica[index+8] = "F";
                        #declare nueva_gramatica[index+9] = "]";
                        #declare nueva_gramatica[index+10] = "[";
                        #declare nueva_gramatica[index+11] = "F";
                        #declare nueva_gramatica[index+12] = "]";
                        #declare index = index + 13;
                        #break
                    #case (asc("+"))
                        #declare nueva_gramatica[index] = "+";
                        #declare index = index + 1;
                        #break
                    #case (asc("-"))
                        #declare nueva_gramatica[index] = "-";
                        #declare index = index + 1;
                        #break
                    #case (asc("]"))
                        #declare nueva_gramatica[index] = "]";
                        #declare index = index + 1;
                        #break
                    #case (asc("["))
                        #declare nueva_gramatica[index] = "[";
                        #declare index = index + 1;
                        #break
                #end           
            #end
            #declare longitud_gramatica = nueva_longitud;
            #declare gramatica = nueva_gramatica;
        #end

        // Stack para guardar estados
        #declare longitud_stack = 0;
        #for(i, 0, longitud_gramatica-1, 1)
            #if(strcmp(gramatica[i], "["))
            #else
                #declare longitud_stack = longitud_stack + 1;
            #end
        #end
        #declare stack = array[longitud_stack];

        // Dibujar la gramatica
        #declare avanze = 0.05; // Longitud de la rama
        #declare incremento_angulo = 35;
        // El estado se conforma de [pos_x, pos_y, angulo, color_verde]
        #declare estado_actual = array[4] {0,0,90,70}
        #declare index_stack = 0;
        #for(i, 0, longitud_gramatica-1, 1)
            #switch(asc(gramatica[i]))
                #case (asc("F"))
                    #declare nueva_pos_x = estado_actual[0] + avanze * cos(radians(estado_actual[2]));
                    #declare nueva_pos_y = estado_actual[1] + avanze * sin(radians(estado_actual[2]));
                    DibujarRama(<estado_actual[0], estado_actual[1]>,<nueva_pos_x, nueva_pos_y>, estado_actual[3])
                    #declare estado_actual[0] = nueva_pos_x;
                    #declare estado_actual[1] = nueva_pos_y;
                    #break;
                #case (asc("+"))
                    #declare nuevo_angulo = estado_actual[2] + incremento_angulo;
                    #declare estado_actual[2] = nuevo_angulo;
                    #break;
                #case (asc("-"))
                    #declare nuevo_angulo = estado_actual[2] - incremento_angulo;
                    #declare estado_actual[2] = nuevo_angulo;
                    #break;
                #case (asc("["))
                    #declare stack[index_stack] = estado_actual;
                    #declare index_stack = index_stack + 1;
                    // Si se crea una rama, el color verde se hace mas intenso
                    #declare estado_actual[3] = estado_actual[3] + 40;
                    #break;
                #case (asc("]"))
                    #declare index_stack = index_stack - 1;
                    #declare estado_actual = stack[index_stack];
                    #break;
                #else
            #end
        #end
    }
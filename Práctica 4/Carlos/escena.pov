/*************************** DEFAULT SETTINGS ******************************/
global_settings {
  assumed_gamma 1.0
}

#default {
  finish {
    ambient 0.1
    diffuse 0.9
    }
}

/**************************** INCLUDES *******************************/
#include "colors.inc"
#include "textures.inc"
#include "transforms.inc"

/**************************** CAMERA *******************************/                          
camera {
  angle 75
  location  <-2.5 , 1 ,-4>
  right     (x * image_width) / image_height
  look_at   <-3. , 0.5, 0>
}

/**************************** LIGHT *******************************/
light_source {
  <-3500, 1000, -1500>
  color rgb <1, 0.9, 0.8>
}

/**************************** POOL *******************************/
// Pool texture
#declare Pool_Tex =
  texture {
    pigment {
      color rgb <1, 1, 1>
    }  
    
    finish {
      phong 0.50
    }
  }

// Pool dimensions
#declare Pool_X = 3;
#declare Pool_Y = 2;
#declare Pool_Z = 8;
#declare Border = 0.1;   

// Pool transformation
#declare Pool_Transformation =
  transform {
    translate <-2.5, 0.1, -6>
  }

// Inner part of the pool
#declare Pool_Inner = 
  box {
    <0, -Pool_Y, 0>, <Pool_X, Pool_Y, Pool_Z>   
  } 

// Outer part of the pool
#declare Pool_Outer = 
  box {
    <-Border, -Pool_Y - 0.01, -Border> ,
    <Pool_X + Border, 0.001, Pool_Z + Border> 
  }
  
// Pool
#declare Pool =
  difference {
    object {
      Pool_Outer
      
      texture{
        Pool_Tex
      }
    }

    object {
      Pool_Inner
      
      texture {
        Pool_Tex
      }
    } 
}

/**************************** GROUND *******************************/
difference{
 plane {
  <0, 1, 0>, 0
  texture {
    pigment {
      checker color White, color Silver
      scale 0.5
    }
  }
 }  
  // end plane
  object {
    Pool_Outer  
    
    texture {
      Pool_Tex
    } 
    
    transform Pool_Transformation 
  }
}

object {
  Pool 
  transform Pool_Transformation
}   

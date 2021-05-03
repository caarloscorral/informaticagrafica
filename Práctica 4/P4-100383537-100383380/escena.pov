#include "colors.inc"
#include "textures.inc"

#declare Pool_Tex =
  texture {
    pigment {
      color rgb <1, 1, 1>
    }
    finish {
      phong 0.50
    }
  }

// *******************************************

camera {
  location <4, 0.1, 1>
  right     (x * image_width) / image_height
  look_at  <0, 0.1, 1>
}

light_source {
  <4, 5, 2.5>
  color <1.0, 1.0,  1.0>
}

// *********************************************

merge {
  // Suelo
  difference {
    box {
      <2, -0.1, 0>, <0, 0, 1> 
      texture {
        Pool_Tex
      }
    }

    // Hueco piscina
    box {
      <2, -0.101, 0.7>, <0.8, 0.01, 0.95>
      pigment { 
        color Silver
      }
    }

    // Hueco macetero
    box {
      <0.9, -0.101, 0.5>, <0.8, 0.01, 0.6>
      pigment { color Bronze2 }
    }
  }

  // Pared lateral izquierda
  box {
    <2, -0.1, 0.2>, <0, 0.5, 0.3> 
    texture {
      Pool_Tex
    }
  }

  // Pared frontal
  box {
    <0, 0, 0>, <0.1, 0.5, 1>
    texture {
      Pool_Tex
    }
  }

  // Pared lateral derecha
  box {
    <2, -0.1, 1>, <0, 0.5, 1.1>
    texture {
      Pool_Tex
    }
  }

  // Pared pequenia
  box {
    <0.5, -0.1, 0>, <0.4, 0.35, 0.9>
    texture {
      Pool_Tex
    }
  }

  // Tierra macetero
  box {
    <0.9, -0.101, 0.3>, <0.8, 0, 0.4>
    pigment {
      color White
    }
  }

  // Agua
  box {
    <2, -0.1, 0.5>, <0.8, -0.02, 0.95>
    pigment { color Aquamarine }
  }

  // Cielo
  box {
    <-0.02, 0, -1>, <-0.1, 2, 2>
    pigment { 
      rgb <0.529, 0.808, 0.922>
    }
  }

  translate <2, 0, 0.2>
}

#include "colors.inc"
#include "textures.inc"

#declare portavelas = 
  union {
    // Agujero del centro para meter la vela
    prism {
      linear_sweep

      0, 1, 7,
      <-2,0>, <-1,-2>, <1,-2>, <2,0>, <1,2>, <-1,2>, <-2,0>
      
      texture {
        Glass

        finish {
          phong 1
        }
      }
    }

    // Prisma abajo grande
    prism {
      linear_sweep

      0, 2.6, 5,
      <-1,-2>, <-0.33,-3>, <0.33,-3>, <1,-2>, <-1,-2>

      texture {
        Glass

        finish {
          phong 1
        }
      }
    }

    // Prisma arriba grande
    prism {
      linear_sweep

      0, 3.2, 5,
      <-1,2>, <-0.33,3>, <0.33,3>, <1,2>, <-1,2>

      texture {
        Glass

        finish {
          phong 1
        }
      }
    }

    // Prisma izquierda-arriba grande
    prism {
      linear_sweep

      0, 2.8, 5,
      <-2.5,1>, <-2,0>, <-1,2>, <-2,2>, <-2.5,1>
    
      texture {
        Glass

        finish {
          phong 1
        }
      }
    }

    // Prisma izquierda-abajo grande
    prism {
      linear_sweep

      0, 3, 5,
      <-2.5,-1>, <-2,0>, <-1,-2>, <-2,-2>, <-2.5,-1>

      texture {
        Glass

        finish {
          phong 1
        }
      }
    }

    // Prisma derecha-arriba grande
    prism {
      linear_sweep

      0, 2.8, 5,
      <2.5,1>, <2,0>, <1,2>, <2,2>, <2.5,1>

      texture {
        Glass

        finish {
          phong 1
        }
      }
    }

    // Prisma derecha-abajo grande
    prism {
      linear_sweep

      0, 3, 5,
      <2.5,-1>, <2,0>, <1,-2>, <2,-2>, <2.5,-1>

      texture {
        Glass

        finish {
          phong 1
        }
      }
    }

    // Prisma izquierda-abajo pequeño
    prism {
      linear_sweep

      0, 2.4, 5,
      <-1.5,-2>, <-1,-2>, <-0.66,-2.5>, <-1.2,-2.4>, <-1.5,-2>

      texture {
        Glass

        finish {
          phong 1
        }
      }
    }

    // Prisma izquierda-arriba pequeño
    prism {
      linear_sweep

      0, 2.4, 5,
      <-1.5,2>, <-1,2>, <-0.66,2.5>, <-1.2,2.4>, <-1.5,2>

      texture {
        Glass

        finish {
          phong 1
        }
      }
    }

    // Prisma derecha-abajo pequeño
    prism {
      linear_sweep

      0, 2.4, 5,
      <1.5,-2>, <1,-2>, <0.66,-2.5>, <1.2,-2.4>, <1.5,-2>

      texture {
        Glass

        finish {
          phong 1
        }
      }
    }

    // Prisma derecha-arriba pequeño
    prism {
      linear_sweep

      0, 2.4, 5,
      <1.5,2>, <1,2>, <0.66,2.5>, <1.2,2.4>, <1.5,2>

      texture {
        Glass

        finish {
          phong 1
        }
      }
    }

    // Prisma izquierda pequeño
    prism {
      linear_sweep

      0, 2.4, 5,
      <-2,0>, <-2.13,-0.33>, <-2.35,0>, <-2.13,0.33>, <-2,0>
    
      texture {
        Glass

        finish {
          phong 1
        }
      }
    }

    // Prisma derecha pequeño
    prism {
      linear_sweep

      0, 2.4, 5,
      <2,0>, <2.13,-0.33>, <2.35,0>, <2.13,0.33>, <2,0>

      texture {
        Glass

        finish {
          phong 1
        }
      }
    }
  }
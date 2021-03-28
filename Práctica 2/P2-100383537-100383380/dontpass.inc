#include "colors.inc"
#include "golds.inc"

/* DON'T PASS SECTION */
#declare dontpass = 
    union {
        union {
            // Left cylinder
            union {
                cylinder {
                    <-5, -6, -7>,
                    <-5, -3, -7>,
                    0.05
                }

                cylinder {
                    <-5, -6, -7>,
                    <-5, -5.99, -7>,
                    0.3
                }
            }

            // Left-center cylinder
            union {
                cylinder {
                    <-5, -6, -2>,
                    <-5, -3, -2>,
                    0.05
                }

                cylinder {
                    <-5, -6, -2>,
                    <-5, -5.99, -2>,
                    0.3
                }
            }


            // Right-center cylinder
            union {
                cylinder {
                    <-5, -6, 2>,
                    <-5, -3, 2>,
                    0.05
                }

                cylinder {
                    <-5, -6, 2>,
                    <-5, -5.99, 2>,
                    0.3
                }
            }


            // Right cylinder
            union {
                cylinder {
                    <-5, -6, 7>,
                    <-5, -3, 7>,
                    0.05
                }

                cylinder {
                    <-5, -6, 7>,
                    <-5, -5.99, 7>,
                    0.3
                }
            }

            texture { 
                T_Gold_1A
            }
        }

        // Rope
        cylinder {
            <-5, -3, -6.97>,
            <-5, -3, 6.97>,
            0.01

            pigment {
                Black
            }
        }
    }
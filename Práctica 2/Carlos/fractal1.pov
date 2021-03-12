/* --------------------------
Entry: 0029
WWW: http://3dimensions.dhs.org
Title: Fire And Ice
Author: Sascha Ledinsky

My second entry 
I wanted to make something differend, but ran out of time, so it's just another CPM 'heightfield' - this time a mandelbrot set...
---------------------------*/

/*
 * Continous Potential Method (CPM) Mandelbrot set
 * released into public domain
 */
/* corners */
#local zoom = 0.1;
#local iMin = -0.72723338228 - zoom + 0.05;
#local iMax = -0.50663652285 + zoom + 0.05;
#local rMin = -0.65693709414 - zoom;
#local rMax = -0.43634023471 + zoom;
/* resolution */
#local xSteps = 1500;
#local ySteps = 1500;
/* maximum iterations and bailout */
#local itMax = 50;
#local bMax = 1000;
/* -------------------------------------------------------------------------------------------------- */
#local dr = (rMax - rMin) / xSteps;
#local di = (iMax - iMin) / ySteps;
#local log2 = log(2);
#local height = array[xSteps][ySteps];
#debug concat("computing mandelbrot set ",str(xSteps,0,0),"x",str(ySteps,0,0),"...\n\n")
#local i = iMin;
#local Y = 0;
#while (Y < ySteps)
	#local r = rMin;
	#local X = 0;
	#while (X < xSteps)
		#local it = 0;
		#local c = vrotate(<r,0,i>,<0,0,0>);
		#local zr = c.x;
		#local zi = c.z;
		#local b = zr*zr + zi*zi;
		#while (b < bMax & it < itMax)
			/* mandelbrot */
			#local zrOld = zr;
			#local zr = zr*zr - zi*zi + c.x;
			#local zi = 2*zrOld*zi + c.z;
			#local b = zr*zr + zi*zi;
			#local it = it + 1;
		#end
		#if (it = itMax)
			#local height[X][Y] = 0;
		#else
			/* cpm "potential" */
			#local height[X][Y] = -pow(log(sqrt(b))/log2/pow(2,it),1/4);
		#end
		#local r = r + dr;
		#local X = X + 1;
	#end
	#local i = i + di;
	#local Y = Y + 1;
	#debug concat("\r",str(Y/ySteps*100,0,0),"% completed")
#end
#declare fractal_texture = texture {
	pigment {
		mandel itMax*3
		rotate <90,-0,0>
		/* map mandelbrot pattern to specified coordinates */
		translate <-rMin,0,-iMin>
		scale <1/(rMax - rMin),1,1/(iMax - iMin)>
		color_map {
			[0.0 color rgb <0.0,0.5,0.4>*0.7]
			[0.15 color rgb <0.0,0.5,0.4>*0.7]
			[0.20 color rgb <1.2,0,0>]
			[0.4 color rgb <1.3,1.0,0>]
			[0.6 color rgb <1.4,1.4,1.0>]
			[0.95 color rgb <1.5,1.5,1.5>]
			[1.0 color rgb <0,0,0>]
		}
	}
	finish { diffuse 1 brilliance 2 ambient 0 specular 1 roughness 0.005}
}
#declare ice_texture = texture {
	pigment {
		granite
		color_map {
			[0.0 color rgb <0.0,0.5,0.4>*0.7]
			[0.1 color rgb <0.0,0.5,0.4>*0.7]
			[0.9 color rgb <0.0,0.5,0.4>*0.3]
			[1.0 color rgb <0.0,0.5,0.4>*0.3]
		}
		turbulence 10
		omega 0.6
		octaves 10
		scale <10,30,10>
		rotate <5,5,5>
	}
	finish { diffuse 1 ambient 0 brilliance 1.5 specular 2 roughness 0.05
		reflection {
			0.0,0.5
		}
		conserve_energy
	}
}
#declare snow_texture = texture {
	pigment { color rgb <1,1,1>*0.5 }
	finish { diffuse 0.9 brilliance 0.7 ambient 0 specular 0.3 roughness 0.05 crand 0.1 }
}
#declare land_texture = texture {
	slope { <0,-1,0>,0,0.5 }
	texture_map {
		[0.0 snow_texture]
		[0.4 snow_texture]
		[0.8 ice_texture]
		[1.0 ice_texture]
	}
}
mesh2 {
	#debug concat("\rsetting up grid vertices...\n\n")
	vertex_vectors {
		(xSteps - 2)*(ySteps - 2)
		#local Y = 1;
		#while (Y < ySteps - 1)
			#local X = 1;
			#while (X < xSteps - 1)
				<X/xSteps,height[X][Y],Y/ySteps>,
				#local X = X + 1;
			#end
			#local Y = Y + 1;
			#debug concat("\r",str((Y+1)/ySteps*100,0,0),"% completed")
		#end
	}
	#local xs = 2 / xSteps;
	#local ys = 2 / ySteps;
	#debug concat("\rsetting up surface normals...\n\n")
	normal_vectors {
		(xSteps - 2)*(ySteps - 2)
		#local Y = 1;
		#while (Y < ySteps - 1)
			#local X = 1;
			#while (X < xSteps - 1)
				#if (height[X][Y] >= 1)
					<0,1,0>
				#else
					/* compute surface normal */
					#local dx = <xs,height[X + 1][Y] - height[X - 1][Y],0>;
					#local dz = <0,height[X][Y + 1] - height[X][Y - 1],ys>;
					vnormalize(vcross(dx,dz))
				#end
				#local X = X + 1;
			#end
			#local Y = Y + 1;
			#debug concat("\r",str((Y+1)/ySteps*100,0,0),"% completed")
		#end
	}
	#debug concat("\rbuilding triangle mesh...\n\n")
	face_indices {
		(xSteps - 3)*(ySteps -3)*2
		#local f = xSteps - 2;
		#local Y = 0;
		#while (Y < ySteps - 3)
			#local X = 0;
			#while (X < xSteps - 3)
				<Y*f + X,Y*f + X + 1,(Y + 1)*f + X>
				<(Y + 1)*f + X + 1,(Y + 1)*f + X,Y*f + X + 1>
				#local X = X + 1;
			#end
			#local Y = Y + 1;
			#debug concat("\r",str((Y+3)/ySteps*100,0,0),"% completed")
		#end
	}
	texture {
		gradient y
		texture_map {
			[0.0 land_texture]
			[0.89 land_texture]
			[0.91 fractal_texture]
			[1.0 fractal_texture]
		}
		scale <1,1.2,1>
		translate y*0.1
	}	
	scale <2,2,2>
	translate <-1,0,-1>
	no_reflection
	//no_image
}
#debug concat("\rrendering...  \n\n")
camera {
	up <0,1,0>
	right <1,0,0>
	location <0,1,-1>
	look_at <0.05,0,-0.4>
	angle 50
}
light_source {
	<-10,10,-5>
	color rgb 1.5
	area_light <0.3,0,0>,<0,0.3,0>,5,5 circular orient jitter
}
light_source {
	<10,5,-10>
	color rgb 0.7
	shadowless
}
sky_sphere {
	pigment {
		bozo
		turbulence 2
		octaves 8
		scale 1
		color_map {
			[0.0 color rgb <-1,-1,-0.5>]
			[1.0 color rgb <0.5,0.5,1>]
		}
	}
}
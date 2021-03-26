//******************************************************************************************
//* Double Cusp Group, by Paul Nylander, bugman123.com, 6/29/06
//* runtime: 7 seconds
//******************************************************************************************

camera{orthographic location <0,0,-39> up y right x*image_width/image_height look_at <0,0,0> angle 90}
light_source{<0,0,-50>,1 parallel}

//Basic Functions
#macro square(X) X*X #end

//Complex Algebra
#macro Complex(X,Y) <X,Y> #end
#declare I=Complex(0,1);
#macro Re(Z) Z.x #end
#macro Im(Z) Z.y #end
#macro Conjugate(Z) Complex(Re(Z),-Im(Z)) #end
#macro Abs(Z) vlength(Z) #end // sqrt(square(Re(Z))+square(Im(Z)))
#macro Arg(Z) atan2(Im(Z),Re(Z)) #end
#macro Sqr(Z) Complex(square(Re(Z))-square(Im(Z)),2*Re(Z)*Im(Z)) #end
#macro Pow(Z,n) #local r=Abs(Z); #if(r=0) #local z2=Complex(0,0); #else #local theta=n*Arg(Z); #local z2=pow(r,n)*Complex(cos(theta),sin(theta)); #end z2 #end
#macro Exp(Z) exp(Re(Z))*Complex(cos(Im(Z)),sin(Im(Z))) #end
#macro Sqrt(Z) Pow(Z,1/2) #end
#macro Mult(z1,z2) Complex(Re(z1)*Re(z2)-Im(z1)*Im(z2),Im(z1)*Re(z2)+Re(z1)*Im(z2)) #end
#macro Div(z1,z2) Mult(z1,Pow(z2,-1)) #end

//2×2 Matrix Algebra
#macro Matrix(a,b,c,d) array[2][2]{{a,b},{c,d}} #end
#macro Conjugate2(A) Matrix(Conjugate(A[0][0]),Conjugate(A[0][1]),Conjugate(A[1][0]),Conjugate(A[1][1])) #end
#macro Det(A) Mult(A[0][0],A[1][1])-Mult(A[0][1],A[1][0]) #end
#macro Mult2(Z,A) Matrix(Mult(A[0][0],Z),Mult(A[0][1],Z),Mult(A[1][0],Z),Mult(A[1][1],Z)) #end
#macro Div2(A,Z) Matrix(Div(A[0][0],Z),Div(A[0][1],Z),Div(A[1][0],Z),Div(A[1][1],Z)) #end
#macro Inverse(A) Div2(Matrix(A[1][1],-A[0][1],-A[1][0],A[0][0]),Det(A)) #end
#macro Dot(A1,A2) Matrix(Mult(A1[0][0],A2[0][0])+Mult(A1[0][1],A2[1][0]),Mult(A1[0][0],A2[0][1])+Mult(A1[0][1],A2[1][1]),Mult(A2[0][0],A1[1][0])+Mult(A2[1][0],A1[1][1]),Mult(A2[0][1],A1[1][0])+Mult(A1[1][1],A2[1][1])) #end
#macro Pow2(A1,n) #local A2=A1; #local i=1; #while(i<n) #local A2=Dot(A2,A1); #local i=i+1; #end A2 #end

//Calculations
#declare ta=Complex(1.958591030,-0.011278560); #declare tb=Complex(2,0);
#declare tab=(Mult(ta,tb)+Sqrt(Mult(Sqr(ta),Sqr(tb))-4*(Sqr(ta)+Sqr(tb))))/2;
#declare z0=Div(Mult(tab-Complex(2,0),tb),Mult(tb,tab)-2*ta+2*Mult(I,tab));
#declare b=Matrix((tb-2*I)/2,tb/2,tb/2,(tb+2*I)/2); #declare B=Inverse(b);
#declare a=Dot(Matrix(tab,Div(tab-Complex(2,0),z0),Mult(tab+Complex(2,0),z0),tab),B); #declare A=Inverse(a);
#macro Fix(A) Div(A[0][0]-A[1][1]-Sqrt(4*Mult(A[0][1],A[1][0])+Sqr(A[0][0]-A[1][1])),2*A[1][0]) #end
#macro ToMatrix(Z,r) Mult2(I/r,Matrix(Z,Complex(square(r),0)-Mult(Z,Conjugate(Z)),Complex(1,0),-Conjugate(Z))) #end
#macro MotherCircle(M1,M2,M3)
 #local z1=Fix(M1); #local x1=Re(z1); #local y1=Im(z1);
 #local z2=Fix(M2); #local x2=Re(z2); #local y2=Im(z2);
 #local z3=Fix(M3); #local x3=Re(z3); #local y3=Im(z3);
 #local z0=Complex(square(x3)*(y1-y2)+(square(x1)+(y1-y2)*(y1-y3))*(y2-y3)+square(x2)*(y3-y1),-square(x2)*x3+square(x1)*(x3-x2)+x3*(y1-y2)*(y1+y2)+x1*(square(x2)-square(x3)+square(y2)-square(y3))+x2*(square(x3)-square(y1)+square(y3)))/(2*(x3*(y1-y2)+x1*(y2-y3)+x2*(y3-y1)));
 ToMatrix(z0,Abs(z1-z0))
#end
#declare C1=MotherCircle(b,Dot(a,Dot(b,A)),Dot(a,Dot(b,Dot(A,B))));
#declare C2=MotherCircle(Dot(b,Pow2(a,15)),Dot(a,Dot(b,Pow2(a,14))),Dot(a,Dot(b,Dot(A,B))));
#macro Reflect(C,M) Dot(M,Dot(C,Inverse(Conjugate2(M)))) #end
#macro zcen(A) Div(A[0][0],A[1][0]) #end
#macro rad(A) Re(Div(I,A[1][0])) #end

//Sphere Spirals
#macro spiral(C0,M,n,colorize,reverse) #local C=C0; #local i=0; #while(i<n-1) #local Z=zcen(C); #local r=rad(C);
 #if(colorize) #local hue=mod((18+(reverse?1:-1)*i)/15,1);
  sphere{Z,r
   pigment{function{hue} color_map{[0 rgb <1,0,0>][1/6 rgb <1,1,0>][1/3 rgb <0,1,0>][1/2 rgb <0,1,1>][2/3 rgb <0,0,1>][5/6 rgb <1,0,1>][1 rgb <1,0,0>]}}
   finish{reflection 1 ambient 0 phong 1 phong_size 10}
  }
 #else
  sphere{Z,r pigment{rgb 1} finish{phong 0.8 phong_size 10}}
 #end
 #local C=Reflect(C,M); #local i=i+1;
#end #end
spiral(C1,a,83,1,0)
spiral(C1,A,83,1,1)
spiral(C2,a,91,0,0)
spiral(C2,A,76,0,1)

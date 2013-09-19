%define all the symbols
function  JF = Jacobian0402()
syms a b d x1 x2 x3 x4
syms m1 m2 r1 r2 l1 g c1 c2 u
%x1 = theta1
%x2 = theta1_dot
%x3 = theta2
%x4 = theta2_dot
%%
%Mass matrix
M = sym([1,0,0,0; 0,a+2*b*cos(x3),0, b*cos(x3)+d;0,0,1,0;0,b*cos(x3)+d,0, d]);

%%

fx1 = sym(x2);
fx2 = sym((-2*x4*x2- x4^2)*b*sin(x3) + (m1*r1+m2*l1)*g*cos(x1) + m2*r2*g*cos(x1+x3) + c1*x2);
fx3 = sym(x4);
fx4 = sym(b*sin(x3)*x2^2 + m2*r2*g*cos(x1+x3) + c2*x4 + u);

fx = sym([fx1;-fx2;fx3;-fx4]);  %-fx2 and -fx4

%%
F = M \ (fx);



%%
%Jacobian calculation

J1 = ([diff(F(1),x1),diff(F(1),x2),diff(F(1),x3),diff(F(1),x4)]);
J2 = ([diff(F(2),x1),diff(F(2),x2),diff(F(2),x3),diff(F(2),x4)]);
J3 = ([diff(F(3),x1),diff(F(3),x2),diff(F(3),x3),diff(F(3),x4)]);
J4 = ([diff(F(4),x1),diff(F(4),x2),diff(F(4),x3),diff(F(4),x4)]);
J5 = ([diff(F(2)+F(4),x1),diff(F(2)+F(4),x2),diff(F(2)+F(4),x3),diff(F(2)+F(4),x4)]);
JF = [J1;J2;J3;J4;J5] ;
end

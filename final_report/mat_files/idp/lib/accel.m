function y = accel(X,p)
%% assign parameteres to variables
x1 = X(1);x2 = X(2);x3 = X(3);x4 = X(4);u = X(5);
a = p(1); b = p(2); d = p(3);
m1 = p(4); m2 = p(5); 
r1 = p(6); r2 = p(7); l1 = p(8);
g = p(9); c1 = p(10); c2 = p(11); l2=p(12);
%% cartisian accelerations

a1 = -l1*((d/(d*a-b^2*cos(x3)^2-d^2)*(-(-2*x4*x2-x4^2)*b*sin(x3)-(m1*r1+m2*l1)*g*cos(x1)-m2*r2*g*cos(x1+x3)-c1*x2)-(b*cos(x3)+d)/(d*a-b^2*cos(x3)^2-d^2)*(-b*sin(x3)*x2^2-m2*r2*g*cos(x1+x3)-c2*x4-u))*sin(x1)+x2^2*cos(x1))-l2*((d/(d*a-b^2*cos(x3)^2-d^2)*(-(-2*x4*x2-x4^2)*b*sin(x3)-(m1*r1+m2*l1)*g*cos(x1)-m2*r2*g*cos(x1+x3)-c1*x2)-(b*cos(x3)+d)/(d*a-b^2*cos(x3)^2-d^2)*(-b*sin(x3)*x2^2-m2*r2*g*cos(x1+x3)-c2*x4-u)-(b*cos(x3)+d)/(d*a-b^2*cos(x3)^2-d^2)*(-(-2*x4*x2-x4^2)*b*sin(x3)-(m1*r1+m2*l1)*g*cos(x1)-m2*r2*g*cos(x1+x3)-c1*x2)+(a+2*b*cos(x3))/(d*a-b^2*cos(x3)^2-d^2)*(-b*sin(x3)*x2^2-m2*r2*g*cos(x1+x3)-c2*x4-u))*sin(x1+x3)+(x2+x4)^2*cos(x1+x3));
a2 = l1*((d/(d*a-b^2*cos(x3)^2-d^2)*(-(-2*x4*x2-x4^2)*b*sin(x3)-(m1*r1+m2*l1)*g*cos(x1)-m2*r2*g*cos(x1+x3)-c1*x2)-(b*cos(x3)+d)/(d*a-b^2*cos(x3)^2-d^2)*(-b*sin(x3)*x2^2-m2*r2*g*cos(x1+x3)-c2*x4-u))*cos(x1)-x2^2*sin(x1))+l2*((d/(d*a-b^2*cos(x3)^2-d^2)*(-(-2*x4*x2-x4^2)*b*sin(x3)-(m1*r1+m2*l1)*g*cos(x1)-m2*r2*g*cos(x1+x3)-c1*x2)-(b*cos(x3)+d)/(d*a-b^2*cos(x3)^2-d^2)*(-b*sin(x3)*x2^2-m2*r2*g*cos(x1+x3)-c2*x4-u)-(b*cos(x3)+d)/(d*a-b^2*cos(x3)^2-d^2)*(-(-2*x4*x2-x4^2)*b*sin(x3)-(m1*r1+m2*l1)*g*cos(x1)-m2*r2*g*cos(x1+x3)-c1*x2)+(a+2*b*cos(x3))/(d*a-b^2*cos(x3)^2-d^2)*(-b*sin(x3)*x2^2-m2*r2*g*cos(x1+x3)-c2*x4-u))*cos(x1+x3)-(x2+x4)^2*sin(x1+x3));
y = [a1;a2];
end
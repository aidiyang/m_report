% Dynamic model of Double pendulum
function  ddq = modeldpend()

debug = 0;

if nargin > 1
    % Execution in simulink
    a = p(1); b = p(2); d = p(3);
    m1 = p(4); m2 = p(5); 
    r1 = p(6); r2 = p(7); l1 = p(8); l2 = p(12);
    g = p(9); 
    %c1 = p(10); c2 = p(11); 

    q1 = x(1); q2 = x(3);
    dq1 = x(2); dq2 = x(4);
    tau2 = x(5);
else
    % Symbolic computaion 
    syms q1 q2 dq1 dq2
    syms m1 m2 l1 l2 r1 r2 g c1 c2 tau2 i_m1 i_m2

    syms a b d
    i_m1 = 1/12*m1*l1^2;
    i_m2 = 1/12*m2*l2^2;
    a = m1*r1^2 + m2*(l1^2+r2^2) + i_m1 + i_m2 ;
    b = m2*l1*r2 ;
    d = m2*r2^2 +  i_m2  ;
    % state in the system
    x = [ q1 q2 dq1 dq2 ].';
end

%% Dynamic parameters
% Mass matrix
M = [ a+2*b*cos(q2) b*cos(q2)+d  ;...
      b*cos(q2)+d       d       ];
% Corioli matrix
C = [ -b*sin(q2)*dq2 -b*sin(q2)*(dq1+dq2)  ;...
       b*sin(q2)*dq1      0               ];
% Gravity vector
grav = [ g*(cos(q1)*l1*m2+m1*r1*cos(q1)+cos(q1+q2)*m2*r2) m2*g*r2*cos(q1+q2) ].';


tmp = ( -C*[dq1 dq2].' -grav + [ 0 tau2 ].' );
% Forward Dynamics 
ddq = simple(M \ tmp);


% Computation of derivaties with respect to states

% Number of system variables
n = 4;

% Initialize the output matrices
Mass = [ M ; zeros( size(M,1)*n , size(M,2) ) ];
Corioli = [ C ; zeros( size(C,1)*n , size(C,2) ) ];
gravity = [ grav ; zeros( size(grav,1)*n , size(grav,2) ) ];

for i = 1:n
    ind = i * 2 + ( 1:2 );
    
    Mass(ind,:) = diff(M,x(i));
    Corioli(ind,:) = diff(C,x(i));
    gravity(ind,:) = diff(grav,x(i));
end


if debug
    % Derivative of forward dynamics with respect to states
    % Method 1
    A_1 = simple(JACOBIAN(ddq,x));

    % Method 2
    A_2 = sym(zeros( 2, n ));
    for i = 1:n
        ind = i * 2 + ( 1:2 );
        dM = Mass(ind,:);
        dC = Corioli(ind,:);
        dgrav = gravity(ind,:);

        A_2(:,i) = M \ ( - dM* (M \(-C*[dq1 dq2].' - grav + [ 0 tau2 ].')) + (-dC*[dq1 dq2].' - C * diff([dq1 dq2].',x(i)) - dgrav));
    end

    A_2 = simple(A_2);
end

end

%%Add path to the library folders
addpath([pwd,'/lib']);
addpath([pwd,'/mdl_lib']);
%% Pendulum variables
clear all;
g = 9.81;
l1 = 0.5;
l2 = 0.3;
m1 = 1;
m2 = 2;
r1 = l1/8;
r2 = l2/5;
i_x1 = 1/12*m1*l1^2;
i_x2 = 1/12*m2*l2^2;
c1 = -0.00035;
c2 = -0.0035;
%cd = 1*diag([0,c1,0,c2]); % 0 - no damping present 1- damping.
a = m1*r1^2 + m2*(l1^2+r2^2)+ + i_x1 + i_x2 ;
b = m2*l1*r2 ;
d = m2*r2^2 +  i_x2  ;
p = [a,b,d,m1,m2,r1,r2,l1,g,c1,c2,l2];
par_fb = [g,m1,m2,l1,l2,r1,r2,i_x1,i_x2] ;
%% System and Filter Variables
B = [0 0 0 1]';

% Settings for extended kalman filter
% The process noise also includes the residual error in one step euler
% integration
Qe = diag([0,0,0,9.888879989765989e-004]);
% The noise in the measurements 
Re = diag([0.000000988887999 0.000000988887999 0.000098888799898 0.009888879989766 0.009888879989766]);

% Settings for unscented kalman filter
Qu = diag([1e-9,1e-9,1e-9,9.888879989765989e-004]);
% The noise in the measurements 
Ru = diag([0.000000988887999 0.000000988887999 0.000098888799898 0.009888879989766 0.009888879989766]);

% Number of states:
n = 4;
% Number of measurements:
m = 5;
% Convergence of the filter depends on the value of P
P0 = 1 * eye(n);
X0 = zeros(n,1);
Rot = [0 -1; 1 0 ];

%% UKF INIT
ts = 1e-3; % Integration step size
if strcmp(computer,'PCWIN')
    addpath('..\..\..\thesis\lib\ekfukf');
else
    addpath('~/thesis/lib/ekfukf');
end
[WM,W,c] = ut_mweights(n);

%% Simultion
fprintf('Simulation started...');
disp('Estimating with EKF...');
sim('dPendDisEKF',[0,10]);
% Root mean square error
disp('Plotting results...');
figure;plot_result;
% rmse1 = sqrt(sum(e_out.signals.values(1,2000:end))/numel(e_out.signals.values(1,2000:end)));
% rmse2 = sqrt(sum(e_out.signals.values(2,2000:end))/numel(e_out.signals.values(2,2000:end)));
% fprintf('RMSE x1 : %0.4f\n',rmse1);
% fprintf('RMSE x2 : %0.4f\n',rmse2);

disp('Estimation with UKF...');
sim('dPendDisUKF',[0,10]);
% Root mean square error
disp('Plotting results...');
figure;plot_result;
% rmse1 = sqrt(sum(e_out.signals.values(1,2000:end))/numel(e_out.signals.values(1,2000:end)));
% rmse2 = sqrt(sum(e_out.signals.values(2,2000:end))/numel(e_out.signals.values(2,2000:end)));
% fprintf('RMSE x1 : %0.4f\n',rmse1);
% fprintf('RMSE x2 : %0.4f\n',rmse2);





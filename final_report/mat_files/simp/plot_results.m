%% Plots with estimate and true value
% Interpreter for tex format texts
base_states = x_act;
set(0, 'defaultTextInterpreter', 'none'); 
subplot(3,1,1)
plot(x_est.time(1:13001)-15, base_states.signals.values(15e3:28e3,1),'-.r');
hold on;
plot(x_est.time(1:13001)-15,x_est.signals.values(1:13001,1),'--b');
%legend('act','est');
xlabel('Time(sec)'); ylabel('p_x (m)','Interpreter','tex');
title( 'p_x vs time','Interpreter','tex');
hold off;
% 
% subplot(3,2,3)
% plot(x_est.time(1:13001)-15, base_states.signals.values(15e3:28e3,2),'-.r');
% hold on;
% plot(x_est.time(1:13001)-15,x_est.signals.values(1:13001,2),'--b');
% %legend('act','est');
% xlabel('Time(sec)'); ylabel('p_y (m)','Interpreter','tex');
% title( 'p_y vs time','Interpreter','tex');
% hold off;

subplot(3,1,2)
plot(x_est.time(1:13001)-15, base_states.signals.values(15e3:28e3,3),'-.r');
hold on;
plot(x_est.time(1:13001)-15,x_est.signals.values(1:13001,3),'--b');
%legend('act','est');
xlabel('Time(sec)'); ylabel('p_z (m)','Interpreter','tex');
title( 'p_z vs time','Interpreter','tex');
hold off;

%% Plot of orientation
% subplot(3,2,2)
% plot(x_est.time(1:13001)-15, base_states.signals.values(15e3:28e3,4),'-.r');
% hold on;
% plot(x_est.time(1:13001)-15,x_est.signals.values(1:13001,4),'--b');
% %legend('act','est');
% xlabel('Time(sec)'); ylabel('\theta_x (rad)','Interpreter','tex');
% title( '\theta_x vs time','Interpreter','tex');
% hold off;

subplot(3,1,3)
plot(x_est.time(1:13001)-15, base_states.signals.values(15e3:28e3,5),'-.r');
hold on;
plot(x_est.time(1:13001)-15,x_est.signals.values(1:13001,5),'--b');
%legend('act','est');
xlabel('Time(sec)'); ylabel('\theta_y (rad)','Interpreter','tex');
title( '\theta_y vs time','Interpreter','tex');
hold off;
% 
% subplot(3,2,6)
% plot(x_est.time(1:13001)-15, base_states.signals.values(15e3:28e3,6),'-.r');
% hold on;
% plot(x_est.time(1:13001)-15,x_est.signals.values(1:13001,6),'--b');
% %legend('act','est');
% xlabel('Time(sec)'); ylabel('\theta_z (rad)','Interpreter','tex');
% title( '\theta_z vs time','Interpreter','tex');
% hold off;

%% Translational velocities
figure;
subplot(3,1,1)
plot(x_est.time(1:13001)-15, base_states.signals.values(15e3:28e3,7),'-.r');
hold on;
plot(x_est.time(1:13001)-15,x_est.signals.values(1:13001,32),'--b');
%legend('act','est');
xlabel('Time(sec)'); ylabel('v_x (m/s)','Interpreter','tex');
title( 'v_x vs time','Interpreter','tex');
hold off;

% subplot(3,2,3)
% plot(x_est.time(1:13001)-15, base_states.signals.values(15e3:28e3,8),'-.r');
% hold on;
% plot(x_est.time(1:13001)-15,x_est.signals.values(1:13001,33),'--b');
% %legend('act','est');
% xlabel('Time(sec)'); ylabel('v_y (m/s)','Interpreter','tex');
% title( 'v_y vs time','Interpreter','tex');
% hold off;

subplot(3,1,2)
plot(x_est.time(1:13001)-15, base_states.signals.values(15e3:28e3,9),'-.r');
hold on;
plot(x_est.time(1:13001)-15,x_est.signals.values(1:13001,34),'--b');
%legend('act','est');
xlabel('Time(sec)'); ylabel('v_z (m/s)','Interpreter','tex');
title( 'v_z vs time','Interpreter','tex');
hold off;

%% Angular velocities
% subplot(3,2,2)
% plot(x_est.time(1:13001)-15, base_states.signals.values(15e3:28e3,10),'-.r');
% hold on;
% plot(x_est.time(1:13001)-15,x_est.signals.values(1:13001,35),'--b');
% %legend('act','est');
% xlabel('Time(sec)'); ylabel('/theta_x (rad/sec)','Interpreter','tex');
% title( '/theta_x vs time','Interpreter','tex');
% hold off;

subplot(3,1,3)
plot(x_est.time(1:13001)-15, base_states.signals.values(15e3:28e3,11),'-.r');
hold on;
plot(x_est.time(1:13001)-15,x_est.signals.values(1:13001,36),'--b');
%legend('act','est');
xlabel('Time(sec)'); ylabel('/theta_y (rad/sec)','Interpreter','tex');
title( '/theta_y vs time','Interpreter','tex');
hold off;

% subplot(3,2,6)
% plot(x_est.time(1:13001)-15, base_states.signals.values(15e3:28e3,12),'-.r');
% hold on;
% plot(x_est.time(1:13001)-15,x_est.signals.values(1:13001,37),'--b');
% %legend('act','est');
% xlabel('Time(sec)'); ylabel('/theta_z (rad/s)','Interpreter','tex');
% title( '/theta_z vs time','Interpreter','tex');
% hold off;
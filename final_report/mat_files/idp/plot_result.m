%% Plots with estimate and true value
% Interpreter for latex format texts
set(0, 'defaultTextInterpreter', 'none'); 
subplot(2,2,1)
plot(x.time, x.signals.values(:,1),'-.r');
hold on;
plot(x.time,x_hat.signals.values(:,1),'--b');
legend('act','est');
%[legend_h,object_h,plot_h,text_strings] = legend('XXX','YYY');
%set(legend_h, 'Interpreter', 'latex', 'string', {' ${{q}_{1,act}}$','${{q}_{1,est}}$'});
xlabel('Time(sec)'); ylabel('$q_1$ (rad)','Interpreter','latex');
title( '$q_1$ vs time','Interpreter','latex');
hold off;

subplot(2,2,2)
plot(x.time, x.signals.values(:,2),'-.r');
hold on;
plot(x.time,x_hat.signals.values(:,2),'--b');
% [legend_h,object_h,plot_h,text_strings] = legend('XXX','YYY');
% set(legend_h, 'Interpreter', 'latex', 'string', {' ${\dot{q}_{1,act}}$','${\dot{q}_{1,est}}$'});
legend('act','est');
xlabel('Time(sec)'); ylabel('$\dot q_1$(rad/sec)','Interpreter','latex');
title( '$\dot q_1$ vs time','Interpreter','latex');
hold off;

subplot(2,2,3)
plot(x.time, x.signals.values(:,3),'-.r');
hold on;
plot(x.time,x_hat.signals.values(:,3),'--b');
% [legend_h,object_h,plot_h,text_strings] = legend('XXX','YYY');
% set(legend_h, 'Interpreter', 'latex', 'string', {' ${{q}_{2,act}}$','${{q}_{2,est}}$'});
xlabel('Time(sec)'); ylabel('$q_2$(rad)','Interpreter','latex');
legend('act','est');
title( '$q_2$ vs time','Interpreter','latex');
hold off;

subplot(2,2,4)
plot(x.time, x.signals.values(:,4),'-.r');
hold on;
plot(x.time,x_hat.signals.values(:,4),'--b');
% [legend_h,object_h,plot_h,text_strings] = legend('XXX','YYY');
% set(legend_h, 'Interpreter', 'latex', 'string', {' ${\dot{q}_{2,act}}$','${\dot{q}_{2,est}}$'});
xlabel('Time(sec)'); ylabel('$\dot q_2$(rad/sec)','Interpreter','latex');
title( '$\dot q_2$ vs time','Interpreter','latex');
legend('act','est');
hold off;
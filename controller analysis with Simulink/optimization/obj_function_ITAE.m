% Calculating ITAE by runing a Simulink model.
% 
% Inputs:
% ki, kp, lambda
% 
% Outputs:
% ITAE
% Bo Shang
% cnpcshangbo@gmail.com
function [ITAE] = obj_function_ITAE(x0)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%clear;
lamda=x0(1);
ki=x0(2);
kp=x0(3);
global K T1
K = 1.0263;
T1 = 0.71;
global iokp ioki iokd
iokp = 2.89;
ioki = 1.04;
iokd = 1.79;
% global lamda ki kp
% lamda = 0.9694;
% ki = 0.6192;
% kp = 2.6992;

assignin('base','Kp',kp);
assignin('base','Ki',ki);
assignin('base','Lambda',lamda);
%
assignin('base','ioKp',iokp);
assignin('base','ioKi',ioki);
assignin('base','ioKd',iokd);

assignin('base','tau',T1);
assignin('base','k',K);

[t_time,x_state,y_out]=sim('model.slx',[0,10]);
% assignin('base','ITAE',ITAE);
ITAE = ITAE.Data(end);
%% draw step response comparison
% figure(1)
% plot(FOPD.Time,FOPD.Data,'-',IOPID.Time,IOPID.Data,'--')
% legend('FOPD','IOPID')
% %%
% %disp('y_out');
% %disp(y_out);
% kp=Kp;
% ki=Ki;
% lamda=Lambda;
% 
% 
% s=fotf('s');
% c_tf=kp*(1+ki/s^lamda);
% p_tf=k/(tau*s+1)/s;
% sys_tf=c_tf*p_tf;
% %
% ioc_tf=ioKp+ioKi/s+ioKd*s;
% p_tf=k/(tau*s+1)/s;
% iosys_tf=ioc_tf*p_tf;
% %
% h1=figure(2);
% %set(h1,'Name','FOPD')
% bode(sys_tf);
% % h=findobj(gcf,'Type', 'line');
% % set(h(4),'LineStyle','--');
% 
% grid on
% hold on
% %h2=figure(2);
% %set(h2,'Name','IOPD')
% bode(iosys_tf);
% %h=findobj(gcf,'Type', 'line');
% %set(h(3),'LineStyle','--');
% %set(h(5),'LineStyle','--','linewidth',2);
% 
% %grid on
% lgd=legend('FOPD','IOPID');
% hold off
% % end

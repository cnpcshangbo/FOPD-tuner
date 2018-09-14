clear
global K T1
K=1.0263; T1=0.71;
% global iokp ioki iokd
global lambda kd kp
% Using APM:
lambda_apm=0.9748; kd_apm=0.5958; kp_apm=2.7721;
assignin('base','Kp_apm',kp_apm);
assignin('base','Kd_apm',kd_apm);
assignin('base','Lambda_apm',lambda_apm);
% FPS:
lambda=0.9694; kd=0.6192; kp=2.6992;
assignin('base','Kp',kp);
assignin('base','Kd',kd);
assignin('base','Lambda',lambda);
%
% assignin('base','ioKp',iokp);
% assignin('base','ioKi',ioki);
% assignin('base','ioKd',iokd);

assignin('base','tau',T1);
assignin('base','k',K);

[t_time,x_state,y_out]=sim('Step_comparison.slx',[0,10]);
%% draw step response comparison
figure(1)
plot(FPS.Time,FPS.Data,'-',APM.Time,APM.Data,'--')
legend('FPS','APM')
%%
kp=Kp;
kd=Kd;
lamda=Lambda;

s=fotf('s');
c_tf=kp*(1+kd*(s^lamda));
p_tf=k/(tau*s+1)/s;
sys_tf=c_tf*p_tf;
%
ioc_tf=ioKp+ioKi/s+ioKd*s;
p_tf=k/(tau*s+1)/s;
iosys_tf=ioc_tf*p_tf;
%
h1=figure(2);
bode(sys_tf);

grid on
hold on
bode(iosys_tf);

lgd=legend('FOPD','IOPID');
hold off
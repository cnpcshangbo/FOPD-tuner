clear;
assignin('base','Kp',4.2393);
assignin('base','Ki',0.2431);
assignin('base','Lambda',-0.9855);
[t_time,x_state,y_out]=sim('verify1.slx',[0,5]);
%% draw step response comparison
figure
plot(FOPD.Time,FOPD.Data,'-',IOPD.Time,IOPD.Data,'--')
legend('FOPD','IOPD')
%%
%disp('y_out');
%disp(y_out);
kp=Kp;
ki=Ki;
lamda=Lambda;
tao=0.71;
k=1.0263;

s=fotf('s');
c_tf=kp*(1+ki/s^lamda);
p_tf=k/(tao*s+1)/s;
sys_tf=c_tf*p_tf;
%
ioc_tf=4.29+1.02*s;
p_tf=1.0263/(0.71*s+1)/s;
iosys_tf=ioc_tf*p_tf;
%
h1=figure(1);
%set(h1,'Name','FOPD')
bode(sys_tf);
grid on
hold on
%h2=figure(2);
%set(h2,'Name','IOPD')
bode(iosys_tf);
%grid on
legend('FOPD','IOPD');

global K T1
global iokp ioki iokd
global lamda kd kp
assignin('base','Kp',kp);
assignin('base','Kd',kd);
assignin('base','Lambda',lamda);
%
assignin('base','ioKp',iokp);
assignin('base','ioKi',ioki);
assignin('base','ioKd',iokd);

assignin('base','tau',T1);
assignin('base','k',K);

[t_time,x_state,y_out]=sim('model.slx',[0,10]);
%% draw step response comparison
figure(1)
plot(FOPD.Time,FOPD.Data,'-',IOPID.Time,IOPID.Data,'--')
legend('FOPD','IOPID')
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
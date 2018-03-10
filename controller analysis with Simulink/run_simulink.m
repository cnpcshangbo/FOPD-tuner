clear;
assignin('base','Kp',9.9498);
assignin('base','Ki',0.1631);
assignin('base','Lambda',-0.9693);
%
assignin('base','ioKp',10.7);
assignin('base','ioKi',15.2);
assignin('base','ioKd',1.66);

assignin('base','tau',0.17936);
assignin('base','k',1.102);

[t_time,x_state,y_out]=sim('verify1.slx',[0,10]);
%% draw step response comparison
figure(1)
plot(FOPD.Time,FOPD.Data,'-',IOPID.Time,IOPID.Data,'--')
legend('FOPD','IOPID')
%%
%disp('y_out');
%disp(y_out);
kp=Kp;
ki=Ki;
lamda=Lambda;


s=fotf('s');
c_tf=kp*(1+ki/s^lamda);
p_tf=k/(tau*s+1)/s;
sys_tf=c_tf*p_tf;
%
ioc_tf=ioKp+ioKi/s+ioKd*s;
p_tf=k/(tau*s+1)/s;
iosys_tf=ioc_tf*p_tf;
%
h1=figure(2);
%set(h1,'Name','FOPD')
bode(sys_tf);
% h=findobj(gcf,'Type', 'line');
% set(h(4),'LineStyle','--');

grid on
hold on
%h2=figure(2);
%set(h2,'Name','IOPD')
bode(iosys_tf);
%h=findobj(gcf,'Type', 'line');
%set(h(3),'LineStyle','--');
%set(h(5),'LineStyle','--','linewidth',2);

%grid on
lgd=legend('FOPD','IOPID');
hold off
clear;
%run_fminunc
x0 = [-0.9694,0.6192]; % start point away from the minimum
A=[];
b=[];
Aeq=[];
beq=[];
lb=[-2,0];
ub=[2,10];
global wc
wc=2.51;
omega=wc;

x = patternsearch(@obj_fun_apm,x0,A,b,Aeq,beq,lb,ub);

disp(x);

APM = obj_fun_apm(x);

disp(APM);
%%
global lamda ki kp

lambda=x(1);ki=x(2);

lamda=lambda;
k = 1.0263;
tau = 0.71;
global K T1
K=k;T1=tau;

Jomega=((1+ki*omega.^(lambda).*cos(pi*lambda/2))^2+(ki*omega.^(lambda).*sin(pi*lambda/2))^2)^0.5;
kp=omega*(tau^2*omega^2+1)^0.5/Jomega/k; %kp %
%%
global iokp ioki iokd
% Kp = 1.58, Ki = 0.182, Kd = 1.49
ioKp=2.89;ioKi=1.04;ioKd=1.79;
iokp=ioKp;ioki=ioKi;iokd=ioKd;
s=fotf('s');
c_tf=kp*(1+ki/(s^lambda));
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
%% 
% 

clear;
x0 = [-0.9694,0.6192]; % start point away from the minimum
A=[];b=[];Aeq=[];beq=[];
lb=[-2,0];
ub=[2,5];
global wc phi_m
wc=2; 
phi_m=90;
omega=wc;
options = optimoptions('patternsearch','PlotFcn','psplotbestf');
x = patternsearch(@obj_fun_apm,x0,A,b,Aeq,beq,lb,ub,options);
disp('%%%%%%%%%% lambda and kd:')
disp(x);

APM = obj_fun_apm(x);
disp('%%%%%%%%%% objective function value:')
disp(APM);
%%
global lamda kd kp

lambda=x(1);kd=x(2);

lamda=lambda;
k = 1.0263;
tau = 0.71;
global K T1
K=k;T1=tau;

Jomega=((1+kd*omega.^(lambda).*cos(pi*lambda/2))^2+...
    (kd*omega.^(lambda).*sin(pi*lambda/2))^2)^0.5;
kp=omega*(tau^2*omega^2+1)^0.5/Jomega/k; %kp %
%%
global iokp ioki iokd

ioKp = 1.95;ioKi = 0.369;ioKd = 1.48;
iokp=ioKp;ioki=ioKi;iokd=ioKd;
s=fotf('s');
c_tf=kp*(1+kd*(s^lambda));%Test
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
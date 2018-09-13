function [APM] = obj_fun_apm(x)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% Objective function based on area phase margin
% Inputs: tau, k, lambda, ki, kp, omega_c
% Outputs: obj=area phase margin

lambda=x(1);ki=x(2);

%% Step one: Preparing necessary data
global K T1
K = 1.0263;
T1 = 0.71;
tau=T1;k=K;
% global lambda ki kp
% lambda = 0.9694;
% ki = 0.6192;
% kp = 2.6992;

% Specification
global wc
% wc = 2.51; %crossover frequency
phi_m=83.9;
%% Step two: Calculate area phase margin to build the objective function
w=wc;
APM1 = atan2(ki*w^lambda*sin(pi*lambda/2),(1+ki*w^lambda*cos(pi*lambda/2)))+atan2(1,T1*w);
omega=wc;
Jomega=((1+ki*omega.^(lambda).*cos(pi*lambda/2))^2+(ki*omega.^(lambda).*sin(pi*lambda/2))^2)^0.5;
kp=omega*(tau^2*omega^2+1)^0.5/Jomega/k; %kp %

s=fotf('s');
c_tf=kp*(1+ki/(s^lambda));
p_tf=k/(tau*s+1)/s;
sys_tf=c_tf*p_tf;

% sys_io = bode(sys_tf,w);
% [mag,phase,wout] = bode(sys_io,w);
[Gm,Pm,Wcg,Wcp]=margin(sys_tf);
APM1=Pm;
% w=wc*1.5;
% APM2 = atan(ki*w^lambda*sin(pi*lambda/2)/(1+ki*w^lambda*cos(pi*lambda/2)))+atan(1/T1*w);
% w=wc*0.5;
% APM3 = atan(ki*w^lambda*sin(pi*lambda/2)/(1+ki*w^lambda*cos(pi*lambda/2)))+atan(1/T1*w);



% APM = abs(83.9/180*pi-mean([APM1,APM2,APM3]));% to get the min value max, so we use a negative symbol.
% Arg = phi_m/180*pi;
% APM = abs(Arg-APM1) + abs(Arg-APM2) + abs(Arg-APM3);% to get the min value max, so we use a negative symbol.
APM = abs(phi_m-APM1);% to get the min value max, so we use a negative symbol.



end


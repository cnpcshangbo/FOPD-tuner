% Objective function based on area phase margin
% Inputs: tau, k, lambda, ki, kp, omega_c
% Outputs: obj=area phase margin

%% Step one: Preparing necessary data
global K T1
K = 1.0263;
T1 = 0.71;

global lambda ki kp
lambda = 0.9694;
ki = 0.6192;
kp = 2.6992;

% Specification
wc = 1.2; %crossover frequency

%% Step two: Calculate area phase margin to build the objective function
w=wc;
APM1 = atan(ki*w^lambda*sin(pi*lambda/2)/(1+ki*w^lambda*cos(pi*lambda/2)))+atan(1/T1*w);
w=wc*1.5;
APM2 = atan(ki*w^lambda*sin(pi*lambda/2)/(1+ki*w^lambda*cos(pi*lambda/2)))+atan(1/T1*w);
w=wc*0.5;
APM3 = atan(ki*w^lambda*sin(pi*lambda/2)/(1+ki*w^lambda*cos(pi*lambda/2)))+atan(1/T1*w);

APM = min([APM1,APM2,APM3]);



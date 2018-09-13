function [APM1] = phase_fun(w)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

ki=0.6192;lambda=-0.9;T1=0.71;
APM1 = atan2(ki*w^lambda*sin(pi*lambda/2),(1+ki*w^lambda*cos(pi*lambda/2)))+atan2(1,T1*w);

end


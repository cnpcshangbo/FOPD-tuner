%%% This is comments. Please contact cnpcshangbo@gmail.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The setting parameters.
lamda=-1:0.0001:-0;
k=1.0584;%plant parameters. p(s)=\frac{k}{\tau s+1}\frac{1}{s}
tao=0.63;%plant parameters
omega=2.84;%from IO bode plot.
phi=83.89/180*pi;%from IO bode plot.

%
ki0=tan(atan(1/omega/tao)-phi)./(omega.^(-lamda).*sin(pi*lamda/2)-omega.^(-lamda).*cos(pi*lamda/2)*tan(atan(1/omega/tao)-phi));
%from one equation

% A fomula for the relationship between ki and lamda.
a=tao*omega.^(-2*lamda);
b=-lamda.*sin(pi*lamda/2).*omega.^(-lamda-1)*(omega^2*tao^2+1)+2*tao*omega.^(-lamda).*cos(pi*lamda/2);
c=tao;

ki1=(-b+(b.^2-4*a*c).^0.5)./(2*a);
ki2=(-b-(b.^2-4*a*c).^0.5)./(2*a);
%another equation

figure(1)
plot(lamda, ki0,'r-.',lamda, ki1,'b-', lamda, ki2,'g-')
legend('ki0','ki1','ki2')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\lambda=-0.9855;ki2=0.2431
%% solution 1
% To verify the crosspoint with ki1
lamda=-0.97; % update lambda value here, make sure the value is negative.
a=tao*omega.^(-2*lamda);
b=-lamda.*sin(pi*lamda/2).*omega.^(-lamda-1)*(omega^2*tao^2+1)+2*tao*omega.^(-lamda).*cos(pi*lamda/2);
c=tao;
ki1=(-b+(b.^2-4*a*c).^0.5)./(2*a); 
disp('ki1:');
disp(ki1);

%% verify the controller 1
ki=ki1;
s=fotf('s');
Jomega=((1+ki*omega.^(-lamda).*cos(pi*lamda/2))^2+(ki*omega.^(-lamda).*sin(pi*lamda/2))^2)^0.5;
kp=omega*(tao^2*omega^2+1)^0.5/Jomega/k; %kp %
disp('kp for ki1:');disp(kp);
c_tf=kp*(1+ki/s^lamda);
p_tf=k/(tao*s+1)/s;
sys_tf=c_tf*p_tf;
figure(2)
bode(sys_tf);
grid on

%% 2
lamda=-0.9855;
a=tao*omega.^(-2*lamda);
b=-lamda.*sin(pi*lamda/2).*omega.^(-lamda-1)*(omega^2*tao^2+1)+2*tao*omega.^(-lamda).*cos(pi*lamda/2);
c=tao;
ki2=(-b-(b.^2-4*a*c).^0.5)./(2*a); %ki
disp('ki2:');disp(ki2);

%% verify the controller 2
ki=ki2;
s=fotf('s');
Jomega=((1+ki*omega.^(-lamda).*cos(pi*lamda/2))^2+(ki*omega.^(-lamda).*sin(pi*lamda/2))^2)^0.5;
kp=omega*(tao^2*omega^2+1)^0.5/Jomega/k; %kp %
disp('kp for ki2:');disp(kp);
c_tf=kp*(1+ki/s^lamda);
p_tf=k/(tao*s+1)/s;
sys_tf=c_tf*p_tf;
figure(3);
bode(sys_tf);
grid on

% %%
% lamda=1.3922;
% a=tao*omega.^(-2*lamda);
% b=-lamda.*sin(pi*lamda/2).*omega.^(-lamda-1)*(omega^2*tao^2+1)+2*tao*omega.^(-lamda).*cos(pi*lamda/2);
% c=tao;
% ki1=(-b+(b.^2-4*a*c).^0.5)./(2*a); %ki
% disp(ki1);
% 
% %% verify the controller 3
% ki=ki1;
% s=fotf('s');
% Jomega=((1+ki*omega.^(-lamda).*cos(pi*lamda/2))^2+(ki*omega.^(-lamda).*sin(pi*lamda/2))^2)^0.5;
% kp=omega*(tao^2*omega^2+1)^0.5/Jomega/k; %kp %
% c_tf=kp*(1+ki/s^lamda);
% p_tf=k/(tao*s+1)/s;
% sys_tf=c_tf*p_tf;
% 
% figure();
% bode(sys_tf);


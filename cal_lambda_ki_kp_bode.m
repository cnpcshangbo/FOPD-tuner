%%% This is comments. Please contact cnpcshangbo@gmail.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setting parameters and plotting ki against lambda
lamda=-1:0.0001:-0;
global K T1 wc phi
k = K;%plant gain. p(s)=\frac{k}{\tau s+1}\frac{1}{s}
tao = T1;%plant time constant
omega = wc;%CrossoverFrequency from IO bode plot.
phi_rad=phi/180*pi;%from IO bode plot.

%
ki0=tan(atan(1/omega/tao)-phi_rad)./(omega.^(-lamda).*sin(pi*lamda/2)-omega.^(-lamda).*cos(pi*lamda/2)*tan(atan(1/omega/tao)-phi_rad));
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
xlabel('lambda');ylabel('ki');
legend('ki0','ki1','ki2')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\lambda=-0.9855;ki2=0.2431
%% Solution 1
% To verify the crosspoint with ki1
global lamda ki kp
lamda=-0.9885; % update lambda value here, make sure the value is negative.
a=tao*omega.^(-2*lamda);
b=-lamda.*sin(pi*lamda/2).*omega.^(-lamda-1)*(omega^2*tao^2+1)+2*tao*omega.^(-lamda).*cos(pi*lamda/2);
c=tao;
ki1=(-b+(b.^2-4*a*c).^0.5)./(2*a); 
disp('ki1:');
disp(ki1);

%% Verify the controller 1
ki=abs(ki1);
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

%% Solution 2
lamda=-0.9194;
a=tao*omega.^(-2*lamda);
b=-lamda.*sin(pi*lamda/2).*omega.^(-lamda-1)*(omega^2*tao^2+1)+2*tao*omega.^(-lamda).*cos(pi*lamda/2);
c=tao;
ki2=(-b-(b.^2-4*a*c).^0.5)./(2*a); %ki
disp('ki2:');disp(ki2);

%% Verify the controller 2
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


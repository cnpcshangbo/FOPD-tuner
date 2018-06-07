%% Setting plant parameters
K = -0.8592;
T1 = 1.0710;

%% First we need the plant transfer function.
s=tf('s');
p_tf=K/(T1*s+1)/s;

%% tune
% opts = pidtuneOptions('CrossoverFrequency',32,'PhaseMargin',90);
[C, info] = pidtune(p_tf, 'pid')

%% controller transfer function
ioc_tf=C.Kp+C.Ki/s+C.Kd*s;

%% open loop
iosys_tf=ioc_tf*p_tf;
figure(1)
%bode(iosys_tf)
%grid on
margin(iosys_tf)


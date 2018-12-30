%% Setting plant parameters
global K T1 wc phi %inputs
K = 1.0263; %plant gain
T1 = 0.71; %plant time constant
wc = 2.51; %crossover frequency
phi = 83.9; %phase margin
global iokp ioki iokd

%% First we need the plant transfer function.
s=tf('s');
p_tf=K/(T1*s+1)/s;

%% tune
opts = pidtuneOptions('CrossoverFrequency',wc,'PhaseMargin',phi);
[C, info] = pidtune(p_tf, 'pid', opts)
iokp = C.Kp;
ioki = C.Ki;
iokd = C.Kd;

%% controller transfer function
ioc_tf=C.Kp+C.Ki/s+C.Kd*s;

%% open loop
iosys_tf=ioc_tf*p_tf;
figure(1)
%bode(iosys_tf)
%grid on
margin(iosys_tf)


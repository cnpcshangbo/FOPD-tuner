%run_fminunc
x0 = [0.9,0.6,2.7]; % start point away from the minimum
A=[];
b=[];
Aeq=[];
beq=[];
lb=[-2,10,10];
ub=[2,10,10];
x = patternsearch(@obj_function_ITAE,x0,A,b,Aeq,beq,lb,ub);

disp(x);

itae = obj_function_ITAE(x);

disp(itae);

% % % s=fotf('s');
% % % c_tf=kp*(1+ki/s^lamda);
% % % p_tf=k/(tau*s+1)/s;
% % % sys_tf=c_tf*p_tf;
% % % %
% % % ioc_tf=ioKp+ioKi/s+ioKd*s;
% % % p_tf=k/(tau*s+1)/s;
% % % iosys_tf=ioc_tf*p_tf;
% % % %
% % % h1=figure(2);
% % % %set(h1,'Name','FOPD')
% % % bode(sys_tf);
% % % % h=findobj(gcf,'Type', 'line');
% % % % set(h(4),'LineStyle','--');
% % % 
% % % grid on

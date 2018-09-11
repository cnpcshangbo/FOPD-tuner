%run_fminunc
x0 = [0.9,0.6,2.7]; % start point away from the minimum

x = fminunc(@obj_function_ITAE,x0);

disp(x);

itae = obj_function_ITAE(x);

disp(itae);
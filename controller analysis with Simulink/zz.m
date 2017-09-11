function G=zz(r,N,w_L,w_H)
k=-N:N;
w_kp=(0.9*w_L).^((r-2*k)/(2*N+1));
w_k=(0.9*w_L).^((-r-2*k)/(2*N+1));
K=(0.9*w_L)^r*prod(w_k)/prod(w_kp); 
G1=tf(zpk(-w_kp',-w_k',K));
G2=tf([9,10*w_H,0],[9*(1-r),10*w_H,9*r]);
G=G1*G2;
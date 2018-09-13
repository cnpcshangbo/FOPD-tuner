%phase curve
in=logspace(-2,1,20);
for i=1:20
%     in(i)=10^(i-10);
    out(i)=phase_fun(i)/pi*180;
end
semilogx(in,out)
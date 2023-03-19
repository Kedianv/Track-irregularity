function [n]=track_irregularity_sato(N,y,l_st1,l_st2)
%%%% N is the number of division, l is the track length,l_st1 is the lower wavelngth
%%%% l_st2 is the higher wavelength
a = 0;
b = 2*pi;
ph = (b-a).*rand(N,1) + a;
w1_st=(2/l_st1)*pi; % higher frequency corresponding to lower wavelength(l,st1) for Sato irregularity
w2_st=(2/l_st2)*pi; % lower frequency corresponding to higher wavelength(l_st2) for Sato irregularity
dw_st=(w1_st-w2_st)/N;
x=linspace(0,y,N);
n_st=zeros(N,1);
n=zeros(N,1);
M=zeros(N,1);
p=1;
for i=1:length(x)
    k=1;
    n_st(p,1)=0;
    for j=1:N
        w_st=w2_st+(k-0.5)*dw_st;
        k=k+1;
        s_st=3.15*10^-7/w_st^3; % Sato track irregularity
        ak_st=2*sqrt(s_st*dw_st);
        n_st(p,1)=n_st(p,1)+ak_st*sin(w_st*x(i)+ph(j));
    end
    n(p,1)=n_st(p,1);
    p=p+1;
end  
plot(x,n)

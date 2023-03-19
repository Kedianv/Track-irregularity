function [n]=track_irregularity_amr(N,y,l_am1,l_am2)
%%%% N is the number of division, l is the track length,l_am1 is the lower wavelngth
%%%% l_am2 is the higher wavelength
a = 0;
b = 2*pi;
ph = (b-a).*rand(N,1) + a;
w1_am=(2/l_am1)*pi; % higher frequency corresponding to lower wavelength (l_am1) for American irregularity
w2_am=(2/l_am2)*pi; % lower frequency corrsponding to higher wavelength(l,am2) for American irregularity
dw_am=(w1_am-w2_am)/N;
x=linspace(0,y,N);
n_am=zeros(N,1);
n=zeros(N,1);
M=zeros(N,1);
p=1;
for i=1:length(x)
    k=1;
    n_am(p,1)=0;
    for j=1:N
        w_am=w2_am+(k-0.5)*dw_am;
        k=k+1;
        s_am=(0.25*1.2107*0.8245^2)/((w_am^2+0.8245^2)*w_am^2);%PSD function for grade 1
        ak_am=2*sqrt(s_am*dw_am);
        n_am(p,1)=n_am(p,1)+ak_am*sin(w_am*x(i)+ph(j));%track irregularitty value in cm
    end
    n(p,1)=0.01*n_am(p,1); % track irregularitty value in m
    p=p+1;
end  
plot(x,n)

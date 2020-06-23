clear all;
N = 128;
k = 1024;
r = randn(k,1); 
L = 63;
%var = 1;  %since sigma is considered 1(Standard deviation)
a = [1 -0.9 0.81 -0.729];
x = filter(1,a,r);
M = 2*k/(L+1);
D = 0;
xi = zeros(L,M);

for i = 0:L-1
    for j = 0:M-1
        xi(i+1,j+1) = x(j+1+i*D);
    end
end

w = hamming(M);
U = 0;
 for i = 1:M
     U = U+w(i)*w(i); 
 end
 xi = xi.*w.';
 U = U/M;
 f = 0:1/N:(N-1)/N;
 P = fft(xi,N,2);
 P = fftshift(P);
 P = abs(P);
 P = P.^2;
 P = 0.16*P/(M*U);  %.16 is normalisation factor for D = M/2;
 
Z = zeros(1,N);

for i = 1:N
    for j = 1:L
        Z(i) = Z(i) + P(j,i);
    end
    Z(i) = Z(i)/L;
end
figure;
plot(f,Z);
title('PSD Estimation using Welch method')
[pxx,s] = pwelch(x,w,D,N,'centered');
hold on;
plot(f,pxx);
legend('estimated PSD ','known PSD using pwelch function')
hold off;
%%
clear all
k = 1024;
p = 128;
N = 128;
r = randn(k,1);
n = 1:k;
a = [1 -0.9 0.81 -0.729];
x = filter(1,a,r);
[y,b] = autocorr(x,p);
R = zeros(p);
for i = 1:p
    for j = 1:p
        R(i,j) = y(abs(j-i)+1);
    end
end
Y = y(2:p+1);
A = -1*(inv(R))*Y;
var = 0;
for i=1:p
    var = var+A(i)*Y(i);
end
var = var+y(1);
var = sqrt(var);
h = zeros(p+1,1);
h(1) = 1;
h(2:p+1) = A(1:p);
h = h.';
[H,F] = freqz(1,h,k);
plot(F/(2*pi),10+20*log10(var.*abs(H)));
title('PSD Estimation using Yule Walker AR method')
Z = filter(1,h,r);
[Pxx,F] = pyulear(Z,128,k,1);
hold on;
plot(F,10*log10(Pxx));
legend('estimated PSD ','known PSD using pwelch function')
hold off
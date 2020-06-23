Fo= 10000;  % this is changed to 2,3,10Khz 
Fs= 25*Fo;
t = 0:1/Fs:10/Fo;
m = 2*sin(2*pi*Fo*t)+randn(size(t)); %A=2
figure(1);
plot(t,m); 
xlabel('time'); 
ylabel('x(t)+noise'); 
title('Signal contaminated with noise');

mu = 10^-4;
err_max = 10^-3;
N=256;
w = zeros(N,1);
error = 1;
x = zeros(N,1);
x_new = zeros(N,1);
i = 1;
while(error > err_max)
 y = w'*x;
 e = m(i) - y;
 w_new = w + mu*x*e;
 if(i == 1)
    error = 1;
 else
    error = (sumsqr(w_new-w))/(sumsqr(w));
 end
 w = w_new;
 x(1) = m(i);
 for k = 2:N
 x_new(k) = x(k-1);
 end
 x = x_new;
 i = i+1;
end
Z=(abs(fftshift(fft(w,512)))).^2;
f = (Fs/2)*linspace(-1,1,512);
figure(2);
subplot(211);
plot(f,Z);
xlabel('Frequency'); 
ylabel('Amplitude'); 
title('Adaptive Filter response');
subplot(212);
P=filter(w,1,m);
plot(t,P); 
xlabel('t'); 
ylabel('y(t)');
title('Filter Output');
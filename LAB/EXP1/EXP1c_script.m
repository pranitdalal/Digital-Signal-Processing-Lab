F = 1000;
Fs = 20000;
T = 0:1/Fs:5/1000;
x=0.5*(square(2*pi*F*T));
stem(T,x);
title('Square wave with peak-to-peak magnitude 1')
xlabel('time(s)')
ylabel('Magnitude')
grid on
%%
F = 1000;
Fs = 20000;
T = 0:1/Fs:5/1000;
x=0.5*(square(2*pi*F*T));
n=256;
y=fft(x,n);
y=fftshift(y);
m = abs(y)/n;
f1 = -Fs/2:Fs/(n-1):Fs/2;
plot(f1,m)
title('DFT for N=256')
xlabel('Frequency')
ylabel('|X(f)|/N')
grid on
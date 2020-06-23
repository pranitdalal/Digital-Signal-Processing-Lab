Fs = 12000;
t = 0:1/Fs:0.01;
x = 10*cos(2*pi*1e3*t) + 6*cos(2*pi*2e3*t) + 2*cos(2*pi*4e3*t);
plot(t,x)
hold on
stem(t,x)
hold off
grid on
title('Original Signal x(t) time-sampled at 12KHz')
xlabel('t in seconds') 
ylabel('Amplitude')
%%
Fs = 12000;
t = 0:1/Fs:0.01;
N=64;
x = 10*cos(2*pi*1e3*t) + 6*cos(2*pi*2e3*t) + 2*cos(2*pi*4e3*t);
y=fft(x,N);
y=fftshift(y);
m = abs(y)/N;
f = -6000:12000/(N-1):6000;
subplot(311)
stem(f,m)
grid on
title('DFT with N = 64')
xlabel('Frequency')
ylabel('|X(f)/N|')

N1 = 128;
x = 10*cos(2*pi*1e3*t) + 6*cos(2*pi*2e3*t) + 2*cos(2*pi*4e3*t);
y1=fft(x,N1);
y1=fftshift(y1);
m1 = abs(y1)/N1;
f = -6000:12000/(N1-1):6000;
subplot(312)
stem(f,m1)
grid on
title('DFT with N = 128')
xlabel('Frequency')
ylabel('|X(f)/N|')

N2 = 1024;
x = 10*cos(2*pi*1e3*t) + 6*cos(2*pi*2e3*t) + 2*cos(2*pi*4e3*t);
y2=fft(x,N2);
y2=fftshift(y2);
m2 = abs(y2)/N2;
f = -6000:12000/(N2-1):6000;
subplot(313)
stem(f,m2)
grid on
title('DFT with N = 256')
xlabel('Frequency')
ylabel('|X(f)/N|')
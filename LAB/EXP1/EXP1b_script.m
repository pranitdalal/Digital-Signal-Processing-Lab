Fs1 = 8000;
N=128;
t = 0:1/Fs1:0.01;
x = 10*cos(2*pi*1e3*t) + 6*cos(2*pi*2e3*t) + 2*cos(2*pi*4e3*t);
%plot(t,x,'k')
%hold on

y=fft(x,N);
y=fftshift(y);
m = abs(y)/N;
f = -Fs1/2:Fs1/(N-1):Fs1/2;
subplot(311);
stem(f,m);
grid on
title('Sampling freq. Fs = 8000Hz')
xlabel('Frequency')
ylabel('|X(f)/N|')


Fs2 = 5000;
t = 0:1/Fs2:0.01;
x = 10*cos(2*pi*1e3*t) + 6*cos(2*pi*2e3*t) + 2*cos(2*pi*4e3*t);
%plot(t,x,'b')
%hold on

y1=fft(x,N);
y1=fftshift(y1);
m = abs(y1)/N;
f = -Fs2/2:Fs2/(N-1):Fs2/2;
subplot(312);
stem(f,m);
grid on
title('Sampling freq. Fs = 5000Hz')
xlabel('Frequency')
ylabel('|X(f)/N|')


Fs3 = 4000;
t = 0:1/Fs3:0.01;
x = 10*cos(2*pi*1e3*t) + 6*cos(2*pi*2e3*t) + 2*cos(2*pi*4e3*t);
%plot(t,x,'r')
%hold on

y2=fft(x,N);
y2=fftshift(y2);
m = abs(y2)/N;
f = -Fs3/2:Fs3/(N-1):Fs3/2;
subplot(313);
stem(f,m);
grid on
title('Sampling freq. Fs = 4000Hz')
xlabel('Frequency')
ylabel('|X(f)/N|')
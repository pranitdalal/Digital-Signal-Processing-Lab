x = load ('E:\3rd Year\6th Sem\Digital Signal Processing\LAB\EXP2\signals\eeg1-f3.dat');
fs = 100;
t = 0:1/fs:1;

N = 256;

bpf = designfilt('bandpassiir','FilterOrder',20,'HalfPowerFrequency1',0.5 ,'HalfPowerFrequency2',4 ,'SampleRate',100);
y = filter(bpf,x);
figure(1);
subplot(211);
plot(x);
title('Time domain response of original signal');
xlabel('Time(s)');
ylabel('Amplitude');
subplot(212);
plot(y);
title('Time domain response of filtered(delta band) signal');
xlabel('Time(s)');
ylabel('Amplitude');

y1 = fft(x,N);
y1 = fftshift(y1);
m1 = abs(y1/N);
f1 = (-N/2:(N/2-1))*100/N;
figure(2);
subplot(211);
plot(f1,m1);
title('fft response of original signal');
xlabel('Frequency(Hz)');
ylabel('Amplitude');
y2 = fft(y,N);
y2 = fftshift(y2);
m2 = abs(y2/N);
f2 = (-N/2:(N/2-1))*100/N;
subplot(212);
plot(f2,m2);
title('fft response of filtered(delta band) signal');
xlabel('Frequency(Hz)');
ylabel('Amplitude');
%%
x = load ('C:\Users\Pranit Dalal\Downloads\EXP2\signals\eeg1-f3.dat');
fs = 100;
t = 0:1/fs:1;

N = 256;

bpf = designfilt('bandpassiir','FilterOrder',20,'HalfPowerFrequency1',4 ,'HalfPowerFrequency2',8 ,'SampleRate',100);
y = filter(bpf,x);
figure(1);
subplot(211);
plot(x);
title('Time domain response of original signal');
xlabel('Time(s)');
ylabel('Amplitude');
subplot(212);
plot(y);
title('Time domain response of filtered(theta band) signal');
xlabel('Time(s)');
ylabel('Amplitude');

y1 = fft(x,N);
y1 = fftshift(y1);
m1 = abs(y1/N);
f1 = (-N/2:(N/2-1))*100/N;
figure(2);
subplot(211);
plot(f1,m1);
title('fft response of original signal');
xlabel('Frequency(Hz)');
ylabel('Amplitude');
y2 = fft(y,N);
y2 = fftshift(y2);
m2 = abs(y2/N);
f2 = (-N/2:(N/2-1))*100/N;
subplot(212);
plot(f2,m2);
title('fft response of filtered(theta band) signal');
xlabel('Frequency(Hz)');
ylabel('Amplitude');
%%
x = load ('C:\Users\Pranit Dalal\Downloads\EXP2\signals\eeg1-f3.dat');
fs = 100;
t = 0:1/fs:1;

N = 256;

bpf = designfilt('bandpassiir','FilterOrder',20,'HalfPowerFrequency1',8 ,'HalfPowerFrequency2',13 ,'SampleRate',100);
y = filter(bpf,x);
figure(1);
subplot(211);
plot(x);
title('Time domain response of original signal');
xlabel('Time(s)');
ylabel('Amplitude');
subplot(212);
plot(y);
title('Time domain response of filtered(alpha band) signal');
xlabel('Time(s)');
ylabel('Amplitude');

y1 = fft(x,N);
y1 = fftshift(y1);
m1 = abs(y1/N);
f1 = (-N/2:(N/2-1))*100/N;
figure(2);
subplot(211);
plot(f1,m1);
title('fft response of original signal');
xlabel('Frequency(Hz)');
ylabel('Amplitude');
y2 = fft(y,N);
y2 = fftshift(y2);
m2 = abs(y2/N);
f2 = (-N/2:(N/2-1))*100/N;
subplot(212);
plot(f2,m2);
title('fft response of filtered(alpha band) signal');
xlabel('Frequency(Hz)');
ylabel('Amplitude');

Fs1 = 12000;
t1 = 0:1/Fs1:0.005;
x1 = 10*cos(2*pi*1e3*t1) + 5*sin(2*pi*3e3*t1) ;
subplot(311);
stem(t1,x1);
grid on
title('Original Signal sampled at Fs1=12Khz');
xlabel('Time(s)')
ylabel('Magnitude')

t2 = 0:1/Fs1:0.01;
x2 = upsample(x1,2);  %L = 2
x2 = x2(1:end-1);
subplot(312);
stem(t2,x2);
grid on
title('Upsampled with L=2(added zeroes)/Zero-padded signal')
xlabel('Time(s)')
ylabel('Magnitude')

Fs1 = 12000;
t1 = 0:1/Fs1:0.005;
x1 = 10*cos(2*pi*1e3*t1) + 5*sin(2*pi*3e3*t1) ;

t2 = 0:1/Fs1:0.01;
x2 = upsample(x1,2);  %L = 2
x2 = x2(1:end-1);

Fs2 = 24000;
t = 0:1/Fs2:0.01;
n=33;
fc=6000;
Wn = fc/Fs1;   %Normalised cutoff freq

[b,a] = butter(n,Wn);
y2 = filter(b,a,x2);
y3 = filtfilt(b,a,x2);
subplot(313);
grid on
plot(t2,y3,t2,x2);
title('After Filtering using Butterworth LPF')
grid on
xlabel('Time(s)')
ylabel('Magnitude')

%%
figure
%Implementing a butterworth Filter on matlab.
[b,a] = butter(6,(6000/(24000/2)), 'low' ); %sixth order butterworth filter
freqz(b,a);
title( 'Filter Response' );




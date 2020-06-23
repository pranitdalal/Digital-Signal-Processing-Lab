N =64;
wc = pi/4;           %cut-off frequency
k = (N-1)/2;
n = 0:1:N-1;
hd = (sin(wc*(n-k)))./(pi*(n-k));        %impulse response
%w1 = (n>=0)-(n>=N);                                    %rectangular window                              
%w2 = ((n>=0)-(n>=N)).*(1-2*(n-(N-1)/2)/(N-1));        %triangular window
%w3 = ((n>=0)-(n>=N)).*(0.5-0.5*cos((2*pi*n)/(N-1)));  %hanning window
%w4 = ((n>=0)-(n>=N)).*(0.54-0.46*cos((2*pi*n)/(N-1)));%hamming window
w5 = ((n>=0)-(n>=N)).*(0.42-0.5*cos((2*pi*n)/(N-1))+0.08*cos((4*pi*n)/(N-1)));

h = hd.*w5;
c = -pi:0.01:pi;
[h1,w] = freqz(h,1,c);
h2 = abs(h1);
%figure, freqz(h,1,c);
%title('N=64 Hamming window');

t = 0:1:3*(N-1);
x = 3*cos(pi/8*t)+4*cos(pi/2*t);
%plot(t,x)
grid on

w2 = -pi:2*pi/(N-1):pi;

y = filtfilt(h,1,x);
subplot(221)
plot(t,x)

x1 = fft(x,N);
x1 = fftshift(x1);
x1a = abs(x1/N);
subplot(222)
plot(w2,x1a);

subplot(223);
plot(t,y)

y1 = fft(y,N);
y1 = fftshift(y1);
y1a = abs(y1/N);
subplot(224);
plot(w2,y1a)
hold on
%%
N = 256;
wc = pi/3;
k = (N-1)/2;
n = 0:1:N-1;
hd = (sin(wc*(n-k)))./(pi*(n-k));
w2 = ((n>=0)-(n>=N)).*(1-2*(n-(N-1)/2)/(N-1));
h = hd.*w2;
c = -pi:0.01:pi;
[h1,w] = freqz(h,1,c);
h1 = abs(h1);
%plot(w,h1);

t = 0:1:3*(N-1);
x = 3*sin(pi/8*t)+5*cos(pi*t);
%plot(t,x)
grid on

y = filtfilt(h,1,x);
subplot(211)
plot(t,x)

subplot(212);
plot(t,y)

%%
N = 256;
wc = pi/3;
k = (N-1)/2;
n = 0:1:N-1;
hd = (sin(wc*(n-k)))./(pi*(n-k));
w3 = ((n>=0)-(n>=N)).*(0.5-0.5*cos((2*pi*n)/(N-1)));
h = hd.*w3;
c = -pi:0.01:pi;
[h1,w] = freqz(h,1,c);
h1 = abs(h1);
%plot(w,h1);

t = 0:1:3*(N-1);
x = 3*sin(pi/8*t)+5*cos(pi*t);
%plot(t,x)
grid on

y = filtfilt(h,1,x);
subplot(211)
plot(t,x)

subplot(212);
plot(t,y)
%%
N = 256;
wc = pi/3;
k = (N-1)/2;
n = 0:1:N-1;
hd = (sin(wc*(n-k)))./(pi*(n-k));
w4 = ((n>=0)-(n>=N)).*(0.54-0.46*cos((2*pi*n)/(N-1)));
h = hd.*w4;
c = -pi:0.01:pi;
[h1,w] = freqz(h,1,c);
h1 = abs(h1);
%plot(w,h1);

t = 0:1:3*(N-1);
x = 3*sin(pi/8*t)+5*cos(pi*t);
%plot(t,x)
grid on

y = filtfilt(h,1,x);
subplot(211)
plot(t,x)

subplot(212);
plot(t,y)
%%
N = 64;
wc = pi/3;
k = (N-1)/2;
n = 0:1:N-1;
hd = (sin(wc*(n-k)))./(pi*(n-k));
w5 = ((n>=0)-(n>=N)).*(0.42-0.5*cos((2*pi*n)/(N-1))+0.08*cos((4*pi*n)/(N-1)));
h = hd.*w5;  %For Blackman Window
c = -pi:0.01:pi;
[h1,w] = freqz(h,1,c);
h1 = abs(h1);

t = 0:1:3*(N-1);
x = 3*sin(pi/8*t)+4*cos(pi*t);
%plot(t,x)
grid on

y = filtfilt(h,1,x);
subplot(211)
plot(t,x)
title('Original Signal in time Domain');
xlabel('Time(s)');
ylabel('Amplitude');

subplot(212);
plot(t,y)
ylim([-5 5]);
title('Filtered Signal in time Domain');
xlabel('Time(s)');
ylabel('Amplitude');
%%
N=64;
wc = pi/4;
k = (N-1)/2;
n = 0:1:N-1;
hd = (sin(wc*(n-k)))./(pi*(n-k));
w1 = (n>=0)-(n>=N).*(0.42-0.5*cos((2*pi*n)/(N-1))+0.08*cos((4*pi*n)/(N-1))); %rectangular window
h = hd.*w1;
c = -pi:0.01:pi;
[h1,w] = freqz(h,1,c);
h2 = abs(h1);

t = 0:1:3*(N-1);
x = 3*cos(pi/8*t)+4*cos(pi/2*t)+randn(size(t));

w2 = -pi:2*pi/(N-1):pi;

y = filtfilt(h,1,x);


x1 = fft(x,N);
x1 = fftshift(x1);
x1a = abs(x1/N);
subplot(211);
plot(w2,x1a);
title('FFT of Original Signal with Noise');
xlabel('Normalized Frequency(pi rad/sec)');
ylabel('Amplitude');

y1 = fft(y,N);
y1 = fftshift(y1);
y1a = abs(y1/N);
subplot(212);
plot(w2,y1a);
title('FFT of Filtered(Blackman) Signal with Noise');
xlabel('Normalized Frequency(pi rad/sec)');
ylabel('Amplitude');
%%
N = 64;
wc = pi/3;
k = (N-1)/2;
n = 0:1:N-1;
hd = (sin(wc*(n-k)))./(pi*(n-k));
%plot(n,hd);
% grid on
w1 = (n>=0)-(n>=N);
h = hd.*w1;
c = -pi:0.01:pi;
[h1,w] = freqz(h,1,c);
h2 = abs(h1);


t = 0:1:3*(N-1);
x = 3*cos(pi/8*t)+5*cos(pi/2*t);
y = filtfilt(h,1,x);
x1 = 3*cos(pi/8*t)+5*cos(pi/2*t) + 0.1*randn(size(t));
y1 = filtfilt(h,1,x1);

yn = y1-y;
xn = x1-x;

R1 = snr(y,yn);
R2 = snr(x,xn);

E1 = 0; %y
E2 = 0; %yn
E3 = 0; %x
E4 = 0; %xn

for i=1:1:3*(N-1)
    E1 = E1+y(i)*y(i);
end

for i=1:1:3*(N-1)
    E2 = E2+yn(i)*yn(i);
end

for i=1:1:3*(N-1)
    E3 = E3+x(i)*x(i);
end

for i=1:1:3*(N-1)
    E4 = E4+xn(i)*xn(i);
end

SNRin = 10*log(E3/E4);
SNRout = 10*log(E1/E2);
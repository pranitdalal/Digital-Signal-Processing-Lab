clear all;
N = 512;
Fs = 10000;
T = 1/Fs;
t = 0:T:(N-1)*T;
F = [697,770,852,941;1209,1336,1477,1633];

D_string = 'Entered Character is ';
i = input(D_string, 's');

if i == '1'
    f1 = F(1,1);
    f2 = F(2,1);
elseif i == '2'
    f1 = F(1,1);
    f2 = F(2,2);
elseif i == '3'
    f1 = F(1,1);
    f2 = F(2,3);
elseif i == 'A'
    f1 = F(1,1);
    f2 = F(2,4);
elseif i == '4'
    f1 = F(1,2);
    f2 = F(2,1);
elseif i == '5'
    f1 = F(1,2);
    f2 = F(2,2);
elseif i == '6'
    f1 = F(1,2);
    f2 = F(2,3);
elseif i == 'B'
    f1 = F(1,2);
    f2 = F(2,4);
elseif i == '7'
    f1 = F(1,3);
    f2 = F(2,1);
elseif i == '8'
    f1 = F(1,3);
    f2 = F(2,2);
elseif i == '9'
    f1 = F(1,3);
    f2 = F(2,3);
elseif i == 'C'
    f1 = F(1,3);
    f2 = F(2,4);
elseif i == '*'
    f1 = F(1,4);
    f2 = F(2,1);
elseif i == '0'
    f1 = F(1,4);
    f2 = F(2,2);
elseif i == '#'
    f1 = F(1,4);
    f2 = F(2,3);
elseif i == 'D'
    f1 = F(1,4);
    f2 = F(2,4);
else
    fprintf('Invalid Selection\n');
end

y = cos(2*pi*f1*t) + cos(2*pi*f2*t);

figure;
plot(t,y);
title('Time domain representation of output signal')
xlabel('Time');
ylabel('Amplitude')
y1 = fft(y,N);
y1 = fftshift(y1);
y1 = abs(y1/N);
w2 = -pi:2*pi/(N-1):pi;
figure;
plot(w2,y1);
title('Fourier transform showing the two composing frequencies')
xlabel('Normalised frequency');
ylabel('Amplitude')

y_rms = zeros(2,4);

L=512;
n = 0:1:L-1;

BPF11 = cos(2*pi/Fs*F(1,1)*n);
Y11 = conv(y,BPF11);

y_fft11 = fft(Y11,N);
y_fft11 = fftshift(y_fft11);
y_fft11 = abs(y_fft11/N);
y_rms(1,1) = rms(y_fft11);


BPF12 = cos(2*pi/Fs*F(1,2)*n);
Y12 = conv(y,BPF12);

y_fft12 = fft(Y12,N);
y_fft12 = fftshift(y_fft12);
y_fft12 = abs(y_fft12/N);
y_rms(1,2) = rms(y_fft12);


BPF13 = cos(2*pi/Fs*F(1,3)*n);
Y13 = conv(y,BPF13);

y_fft13 = fft(Y13,N);
y_fft13 = fftshift(y_fft13);
y_fft13 = abs(y_fft13/N);
y_rms(1,3) = rms(y_fft13);


BPF14 = cos(2*pi/Fs*F(1,4)*n);
Y14 = conv(y,BPF14);

y_fft14 = fft(Y14,N);
y_fft14 = fftshift(y_fft14);
y_fft14 = abs(y_fft14/N);
y_rms(1,4) = rms(y_fft14);


BPF21 = cos(2*pi/Fs*F(2,1)*n);
Y21 = conv(y,BPF21);

y_fft21 = fft(Y21,N);
y_fft21 = fftshift(y_fft21);
y_fft21 = abs(y_fft21/N);
y_rms(2,1) = rms(y_fft21);


BPF22 = cos(2*pi/Fs*F(2,2)*n);
Y22 = conv(y,BPF22);

y_fft22 = fft(Y22,N);
y_fft22 = fftshift(y_fft22);
y_fft22 = abs(y_fft22/N);
y_rms(2,2) = rms(y_fft22);


BPF23 = cos(2*pi/Fs*F(2,3)*n);
Y23 = conv(y,BPF23);

y_fft23 = fft(Y23,N);
y_fft23 = fftshift(y_fft23);
y_fft23 = abs(y_fft23/N);
y_rms(2,3) = rms(y_fft23);


BPF24 = cos(2*pi/Fs*F(2,4)*n);
Y24 = conv(y,BPF24);

y_fft24 = fft(Y24,N);
y_fft24 = fftshift(y_fft24);
y_fft24 = abs(y_fft24/N);
y_rms(2,4) = rms(y_fft24);


[M,I] = max(y_rms.');

if I(1)==1&&I(2)==1
    fprintf('Detected sequence = 1');
elseif I(1)==1&&I(2)==2
    fprintf('Detected sequence = 2');
elseif I(1)==1&&I(2)==3
    fprintf('Detected sequence = 3');
elseif I(1)==1&&I(2)==4
    fprintf('Detected sequence = A');
elseif I(1)==2&&I(2)==1
    fprintf('Detected sequence = 4');
elseif I(1)==2&&I(2)==2
    fprintf('Detected sequence = 5');
elseif I(1)==2&&I(2)==3
    fprintf('Detected sequence = 6');
elseif I(1)==2&&I(2)==4
    fprintf('Detected sequence = B');
elseif I(1)==3&&I(2)==1
    fprintf('Detected sequence = 7');
elseif I(1)==3&&I(2)==2
    fprintf('Detected sequence = 8');
elseif I(1)==3&&I(2)==3
    fprintf('Detected sequence = 9');
elseif I(1)==3&&I(2)==4
    fprintf('Detected sequence = C');
elseif I(1)==4&&I(2)==1
    fprintf('Detected sequence = *');
elseif I(1)==4&&I(2)==2
    fprintf('Detected sequence = 0');
elseif I(1)==4&&I(2)==3
    fprintf('Detected sequence = #');
elseif I(1)==4&&I(2)==4
    fprintf('Detected sequence = D');
end
fprintf("\r");


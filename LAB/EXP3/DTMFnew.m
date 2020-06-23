clear all;
N = 512;
Fs = 10000;
T = 1/Fs;
t = 0:T:70*N*T+6*T;
t1 = 0:T:10*N*T;
F = [697,770,852,941;1209,1336,1477,1633];
j = 1:1:4;
f1 = zeros(1,4);
f2 = zeros(1,4);

prompt = 'Enter sequence: ';
x = input(prompt,'s');

for j=1:4
if x(j) == '1'
    f1(j) = F(1,1);
    f2(j) = F(2,1);
elseif x(j) == '2'
    f1(j) = F(1,1);
    f2(j) = F(2,2);
elseif x(j) == '3'
    f1(j) = F(1,1);
    f2(j) = F(2,3);
elseif x(j) == 'A'
    f1(j) = F(1,1);
    f2(j) = F(2,4);
elseif x(j) == '4'
    f1(j) = F(1,2);
    f2(j) = F(2,1);
elseif x(j) == '5'
    f1(j) = F(1,2);
    f2(j) = F(2,2);
elseif x(j) == '6'
    f1(j) = F(1,2);
    f2(j) = F(2,3);
elseif x(j) == 'B'
    f1(j) = F(1,2);
    f2(j) = F(2,4);
elseif x(j) == '7'
    f1(j) = F(1,3);
    f2(j) = F(2,1);
elseif x(j) == '8'
    f1(j) = F(1,3);
    f2(j) = F(2,2);
elseif x(j) == '9'
    f1(j) = F(1,3);
    f2(j) = F(2,3);
elseif x(j) == 'C'
    f1(j) = F(1,3);
    f2(j) = F(2,4);
elseif x(j) == '*'
    f1(j) = F(1,4);
    f2(j) = F(2,1);
elseif x(j) == '0'
    f1(j) = F(1,4);
    f2(j) = F(2,2);
elseif x(j) == '#'
    f1(j) = F(1,4);
    f2(j) = F(2,3);
elseif x(j) == 'D'
    f1(j) = F(1,4);
    f2(j) = F(2,4);
else
    fprintf('Invalid Selection\n');
end
end


no_sig = zeros(1,5121);
a = cos(2*pi*f1(1)*t1) + cos(2*pi*f2(1)*t1);
b = cos(2*pi*f1(2)*t1) + cos(2*pi*f2(2)*t1);
c = cos(2*pi*f1(3)*t1) + cos(2*pi*f2(3)*t1);
d = cos(2*pi*f1(4)*t1) + cos(2*pi*f2(4)*t1);

z = [a no_sig b no_sig c no_sig d];

%plot(t,z);

fprintf('\r');
for i = 1:7
    y = z((i-1)*5121+1:i*5121-1);
    y_rms = zeros(2,4);

L=128;
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
if M(1)==0&&M(2)==0
    fprintf('No Signal');
elseif I(1)==1&&I(2)==1
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

end

% UPSAMPLING AND DOWNSAMPLING OF 48KHZ AUDIO SIGNAL
clc
clear all
close all
[xn, fs] = audioread('C:\Users\Pranit Dalal\Downloads\EXP2\signals\audio_record1.m4a');
N=1024;                             %number of point in DTFT
y = fftshift(fft(xn,N));
f =(-(length(y)/2):((length(y)/2)-1))*fs/length(y);
figure(1)
stem(f,abs(y)/N);
xlabel('Frequency');ylabel('Amplitude');
title('Frequency spectrum of original audio');
%upsampling
x1 = upsample(xn,2);
y1 = fftshift(fft(x1,N));
f =(-(length(y1)/2):((length(y1)/2)-1))*2*fs/length(y1);
figure(2)
stem(f,abs(y1)/N);
xlabel('frequency');ylabel('amplitude');
title('freq spectrum of upsampled audio');
%downsampling
x2 = downsample(xn, 4);
y2 = fftshift(fft(x2,N));
f =(-(length(y2)/2):((length(y2)/2)-1))*0.25*fs/length(y2);
figure(3)
stem(f,abs(y2)/N);
xlabel('frequency');ylabel('amplitude');
title('freq spectrum of downsampled audio');
nBits = 16;
audiowrite('audio_record1_upsampled.wav', x1, fs, 'BitsPerSample',nBits);
audiowrite('audio_record1_downsampled.wav', x2, fs, 'BitsPerSample',nBits);
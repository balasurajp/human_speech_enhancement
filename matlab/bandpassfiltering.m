clearvars;
close all;
[f,fs] = audioread('dspsrav1.wav');
pOrig = audioplayer(f,fs);
pOrig.play;
N = size(f,1); 
figure;
subplot(2,1,1);
stem(1:N, f(:,1));
title('Original Signal');
    df = fs / N;
    w = (-(N/2):(N/2)-1)*df;
    y = fft(f(:,1), N) / N;
    y2 = fftshift(y);
    figure;
    plot(w,abs(y2));
n = 10;
beginFreq = 3000 / (fs/2);
endFreq = 7000 / (fs/2);
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
fOut = filter(b, a, f);
p = audioplayer(4.5*fOut, fs);
p.play;
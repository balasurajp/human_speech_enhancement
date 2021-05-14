%high pass filtering technique
clearvars;
close all;
[f,fs] = audioread('hpaudio.wav');
pOrig = audioplayer(f,fs);
N = size(f,1); 

df = fs / N;
w = (-(N/2):(N/2)-1)*df;
y = fft(f(:,1), N) / N;
y2 = fftshift(y);

n = 10;
beginFreq = 3000 / (fs/2);
endFreq = 7000 / (fs/2);
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
fOut = filter(b, a, f);
p = audioplayer(fOut, fs);
audiowrite('enhanced_speech.wav',fOut,fs);

yout = fft(fOut(:,1), N) / N;
y3 = fftshift(yout);
%display figures
figure;
plot(1:N, f(:,1));
xlabel('samples');
ylabel('Amplitude');
title('Original Signal');

figure;
plot(w,abs(y2));
xlabel('Frequency(w)');
ylabel('Amplitude');
title('FFT-Original Signal');

figure;
plot(1:N, fOut(:,1));
xlabel('samples');
ylabel('Amplitude');
title('Output Signal');

figure;
plot(w,abs(y3));
xlabel('Frequency(w)');
ylabel('Amplitude');
title('FFT-Output Signal');

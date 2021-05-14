import scipy.io.wavfile as wav
import sys
import math
import scipy.signal as dsp

# usage python spectral_sub.py name noise_start noise_stop 

audio_file = sys.argv[1] + '.wav'
raw_audio = wav.read(audio_file)
audio_len = len(raw_audio[1])
audio_fs  = raw_audio[0]

#Short-time fourier transform Parameters
win_len= round(0.025 * audio_fs)
hm_window = dsp.hamming(win_len)
overlap   = math.floor(0.55 * win_len)
#Noise Paramaters (Learning time)
t_start = float(sys.argv[2])
t_end   = float(sys.argv[3])
#Spectogram of Raw-Audio
[s,f,t] = dsp.spectrogram(raw_audio[1],audio_fs,hm_window,overlap,nfft=1024,return_onesided=False,mode='complex')
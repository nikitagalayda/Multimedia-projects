fileName = 'MM_Sample_1.m4a';

[y, fs] = audioread(fileName);
N = length(y);
fs_10ms = fs/100;

fprintf('Information of the sound file "%s":\n', fileName);
fprintf('Duration = %g seconds\n', length(y)/fs);
fprintf('Sampling rate = %g samples/second\n', fs);
fprintf('Total number of samples %d\n', length(y));
%fprintf("%s\n", class(y))

%m = median(buffer(y, 900));

%---------------WAVEFORM-------------------
subplot(5, 1, 1)
time_wave=(1:length(y))/fs_10ms;
%plot(time_wave, y);
plot(y)
line([N-24000 N-24000], [min(y) max(y)], 'Color', 'red');
line([24000 24000], [min(y) max(y)], 'Color', 'red');
title(['Waveform']);

%---------------ENERGY---------------------
% Window set to 960 for 200ms windows
% buffer takes a window, gathers all of the values in that window, and puts
% them into a column. Then we can sum the values easily.
energy_window_size = 960;
energy = frame_energy(y, energy_window_size);
time_energy = (1:length(energy))/fs_10ms * energy_window_size;
subplot(5, 1, 2)
plot(time_energy, energy)
title(['Energy']);

%---------------ZCR------------------------
zcr_window_size = 960;
zcr = frame_zcr(y, zcr_window_size);
time_zcr = (1:length(zcr))/fs_10ms * zcr_window_size;
subplot(5, 1, 3)
plot(time_zcr, zcr)
title(['ZCR']);

%---------------PITCH----------------------
pitch_window_size = 1200;
pitch_contour = pitch_cont(fileName, pitch_window_size);
time_pitch = (1:length(pitch_contour))/fs_10ms * pitch_window_size;
subplot(5, 1, 4)
plot(time_pitch, pitch_contour)
title(['Pitch']);

%---------------EPD------------------------
[N1, N2] = epd(y, fs, energy, zcr);
time_energy = (1:length(energy))/fs_10ms * energy_window_size;
time_wave=(1:length(y))/fs_10ms;
subplot(5, 1, 5)
%plot(time_wave, y);
plot(y)
title(['EPD']);
line([N2 N2], [min(y) max(y)], 'Color', 'red');
line([N1 N1], [min(y) max(y)], 'Color', 'red');
% line([N1*energy_window_size/fs_10ms N1*energy_window_size/fs_10ms], [min(y) max(y)], 'Color', 'red');
% line([N2*energy_window_size/fs_10ms N2*energy_window_size/fs_10ms], [min(y) max(y)], 'Color', 'red');
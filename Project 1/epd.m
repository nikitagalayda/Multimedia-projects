function [N1, N2] = epd(signal, fs, energy, zcr)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    ms_100 = fs/2;
    
    signal_100 = signal(1:ms_100); % first 100ms of the signal
    signal_100_end = signal(length(signal)-ms_100:length(signal));
    
    AE = mean(signal_100_end.^2);
    %AE_end = max(signal_100_end.^2);
    ZCR = 10;%frame_zcr(signal_100, ms_100);
    LTU = 20*AE;
    %LTU_end = 5*AE_end;
    LTL = AE;
    %LTL_end = 2*AE;
    LZTC = 0.8*ZCR;
    energy_points = signal.^2;
    
    N1 = 0;
    N2 = length(energy);
    
    for i = 1:length(energy_points)
        if(energy_points(i) > LTU)
            N1 = i;
            break
        end
    end
    for i = N1:-1:1
        if(energy_points(i) <= LTL)
            N1 = i
            break
        end
    end
    for i = N1:1
        if(zcr(i) < LZTC)
            lztc_cnt = lztc_cnt + 1;
            if(lztc >= 3)
                N1 = i;
                break
            end
        end
    end

    for i = length(energy_points)-1:-1:1
        if(energy_points(i) > LTU)
            N2 = i;
            break
        end
    end
     for i = N2:length(energy_points)
         if(energy_points(i) <= LTL)
             N2 = i;
             break
         end
     end
     for i = N2:length(zcr)
         if(zcr(i) < LZTC)
             lztc_cnt = lztc_cnt + 1;
             if(lztc >= 3)
                 N2 = i;
                 break
             end
         end
     end
end


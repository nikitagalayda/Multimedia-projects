function pitch_contour = pitch_cont(fileName, pitch_window_size)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [au,fs]=audioread(fileName);

    %index1=1;
    frameSize=1200;
    %index2=index1+frameSize-1;
    %frame=au(index1:index2);

    frameNum = floor(length(au)/frameSize);
    
    frame_Autocorrelation = [];
    pitch_contour = [];
    f_min=40;%lower bound 40Hz
    f_max=1100;%upper bound 1100Hz
    p_max=ceil(fs/f_min);%the index of 40Hz
    p_min=floor(fs/f_max);%the index of 1100Hz

    winNum = floor(length(au)/frameSize);

    for i=1:winNum
        index1 = 1+(i-1)*frameSize;
        index2=index1+frameSize-1;
        if(index2 < length(au))  
            frame=au(index1:index2);

            for j=1:frameSize
                frame_Autocorrelation(j) = sum(frame(1+(j-1):frameSize).*frame(1:frameSize-(j-1)));
            end

            [FV,FP] = max(frame_Autocorrelation(p_min:p_max));
            pitch_contour(i) = fs/(FP+p_min-1);
        else
            break
        end
    end
end


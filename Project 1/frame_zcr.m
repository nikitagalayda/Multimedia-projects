function zcr = frame_zcr(data, frame_size)
    %Returns an array of Zero-crossing rates
    %   Given the window size, calculates the ZCR for each frame and returns as
    %   an array

    zcr = sum(abs(diff(sign(buffer(data, frame_size)))));
end


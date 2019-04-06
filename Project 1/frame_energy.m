function energy = frame_energy(data, frame_size)
    %Returns an array of energy values of signal
    %   Given the window size, calculates the energy for each frame and returns as
    %   an array;
    energy = sum(abs(buffer(data.^2, frame_size)));
end


function energy = frame_energy(data, frame_size)
    %Returns an array of energy values of signal
    %   Given the window size, calculates the energy for each frame and returns as
    %   an array;

    % for i = 1:frame_num
    %     for j = 1:frame_size
    %         %temp = data(j)^2;
    %         %data(j) = data(j)^2;
    %         temp = (data(j)*(0.54 - 0.46*cos((2*pi*data(j))/frame_size-1)))^2;
    %     end
    %     energy(i) = energy(i) + temp;


    energy = sum(abs(buffer(data.^2, frame_size)));


end


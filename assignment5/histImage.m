function h = histImage(im)

    % histogram array
    h = zeros(1, 256);

    for value = 0:255
        % find by color
        h(value + 1) = numel(find(im == value));
    end

end
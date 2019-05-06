function nim = mapImage(im, tm)
    % check if tm is valid
    if length(tm) < 256
        disp('tm must contain at least 256 elements!')
        nim = -1;
        return
    end
    
    nim = arrayfun(@(x) tm(x + 1), im);
end
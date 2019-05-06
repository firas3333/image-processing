function tm = histShape(h1, h2)
    % calculate normalized accumulative histograms
    c1 = h1 ./ sum(h1);
    c2 = h2 ./ sum(h2);
    for i = 2:256
        c1(i) = c1(i) + c1(i - 1);
        c2(i) = c2(i) + c2(i - 1);
    end
    
    % two pointers algorithm
    p1 = 1;
    p2 = 1;
    tm = zeros(1, 256);
    % make sure indices are in bounds
    % check if we've reached the end of c1 (1.0 because it's normalized)
    while p1 <= 256 && p2 <= 256 && c1(p1) < 1
        if c1(p1) <= c2(p2)
            % found a match
            
            tm(p1) = p2;
            p1 = p1 + 1;
        else
            % keep looking
            p2 = p2 + 1;
        end
    end
end
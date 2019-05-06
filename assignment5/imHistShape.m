function nim = imHistShape (im1,im2)
    % calculate histograms
    h1 = histImage(im1);
    h2 = histImage(im2);
    
    % calculate tonemap
    tm = histShape(h1, h2);
    
    % apply tonemap to im1 and return
    nim = mapImage(im1, tm);
end
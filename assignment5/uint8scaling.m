function im = uint8scaling(im)
    X = min(im(:));
    im = im - X;
   
    X = max(im(:));
    im = im * (255 / X);
    
    im = uint8(im);
end
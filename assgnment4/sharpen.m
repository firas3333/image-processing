function sharpIm = sharpen(im, maskSTD, lambda)
    noisyim = cleanImageMean(im, maskSTD);
    Bsharp= double(im) - double(noisyim);
    sharpIm =uint8(im) + uint8(double(Bsharp) * lambda);
end
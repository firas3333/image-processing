function sharpIm = sharpen(im, maskRadius, maskSTD, lambda)
    noisyim = cleanImageMean(im, maskRadius, maskSTD);
    Bsharp= double(im) - double(noisyim);
    sharpIm = im + uint8(double(Bsharp) * lambda);
end
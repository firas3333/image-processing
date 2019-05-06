function    noisyIm = addGaussianNoise(im, s)
noisyIm = im2double(im);
noisyIm = noisyIm + sqrt(s)*randn(size(noisyIm)) + s;

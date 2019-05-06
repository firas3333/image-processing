function  PSNRval= calcPSNR (noisyIm,im)
im=double(im);
noisyIm=double(noisyIm);
mse = sum((im(:)-noisyIm(:)).^2);
PSNRval = 10*log10(255*255/mse);


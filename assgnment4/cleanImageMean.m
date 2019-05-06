function    cleanIm = cleanImageMean (im, maskSTD)
m=ones(2,2);
k =maskSTD*m ;
%Convolve image with Blur Kernels
convIm = conv2(double(im),double(k));
cleanIm=(convIm.^2).^0.5;
[x,y]=size(cleanIm);
cleanIm=cleanIm(x-255:x,y-255:y);
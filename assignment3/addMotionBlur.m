function noisyIm = addMotionBlur(im,t)
k = zeros(3,t);
k(1,:)=1;
%Convolve image with Blur Kernels
convIm = conv2(double(im),double(k));
noisyIm=(convIm.^2).^0.5;

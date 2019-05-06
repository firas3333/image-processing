function nim = blurImage(im,blurLevel)
% Blurs given image at a given blur level.
% Input: im = gray scale image
%          blurLevel - value in [1..100] where 1 = no blur and 100 max blur
% Output: nim - grayscale image same size as im
%
ker = ones(blurLevel,blurLevel)./(blurLevel.^2);
nim = conv2_cyclic(im,ker);
% nim = filter2(ker,im,'same');



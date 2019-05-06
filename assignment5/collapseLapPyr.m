function    img = collapseLapPyr(L)
levels=length(L);
lastimg=L{levels};
for i=1:levels-1
    US=upSample(lastimg);
    lastimg=double(L{levels-i})+double(US);
end
img=lastimg;



% (file name is accordingly collapseLapPyr.m )
% This routine reconstructs the original image from its Laplacian Pyramid.
% 
% Input:      L = the Laplacian pyramid. L is a 1D array of matrices implemented using matlab's cell.
% 
% Output:   img = a grayscale image (values in [0,255]).
% 
% Method:  Works level by level from top of pyramid. Uses function upSample.
% 
% Note: This routine should work for a Laplacian Pyramid with any number of levels.

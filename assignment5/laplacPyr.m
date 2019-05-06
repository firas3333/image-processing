function    L = laplacPyr(img,levels)
img=double(img);
G = gaussPyr(img,levels);
L=cell(1:levels);
for i=1:levels
    if i==levels
        L{levels}=G{levels};
    else
        US=upSample(G{i+1});
        L{i}=double(G{i})-double(US);
    end    
end

% (file name is accordingly laplacPyr.m )
% This routine creates a Laplacian pyramid.
% 
% Input:      img = a grayscale image (values in [0,255])
% levels = the number of levels created in the Laplacian Pyramid (minimum value = 1).
% Output:   L = the Laplacian pyramid. L is a 1D array of matrices implemented using matlab's cell.
% 
% Method:  Starts with img and creates level after level using function downSample and upSample.
% Or using gaussPyr and upSample.

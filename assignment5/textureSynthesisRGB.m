function    newtexture = textureSynthesisRGB(textureRGB,numLevels,numRepeats,show)
R=textureRGB(:,:,1);
G=textureRGB(:,:,2);
B=textureRGB(:,:,3);
Rtexture = textureSynthesis(R,numLevels,numRepeats,show);
Gtexture = textureSynthesis(G,numLevels,numRepeats,show);
Btexture = textureSynthesis(B,numLevels,numRepeats,show);
newtexture = cat(3,Rtexture,Gtexture,Btexture);

% (file name is accordingly textureSynthesisRGB.m )
% This routine synthesizes a new RGB image with texture statistics similar to the given texture.
% 
% Input:      textureRGB = an RGB image (size MxMx3) (values in [0,255]) containing a color texture.
% numLevels = the number of levels created in the Laplacian Pyramids used in the process
% (minimum value = 1).
% numRepeats = the number of iterations to perform during synthesis.
% show  =  an OPTIONAL binary argument. If TRUE (~0) then function displays the result
% for each iteration. Between displays user must press space bar.
%     If FALSE (0) or is not given then does not display anything.
%     
%     Output:   newtextureRGB = an RGB image (size MxMx3) (values in [0,255]) of size same as input image textureRGB.
%     
%     Method:  Input image is split into 3 grayscale images: R,G,B  one for each color channel.
%     For each channel use  textureSynthesis function to create a new single channel texture.
%     combine resulting 3 textures into a single new RGB image.
%     
    

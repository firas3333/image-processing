function    newtexture = textureSynthesis(texture,numLevels,numRepeats,show)
switch nargin
    case 3
            show=0;
            disp('hopefully show is the only thing thats missing, for now i did the work for you you wont be bothered with mor imgs :)')
end            
randomImg=rand(size(texture)) * 255;
LPTexture = laplacPyr(texture,numLevels);
for j=1:numRepeats
    randomImg = imHistShapeDouble(randomImg, texture);
    %new random image lap pyramid for each iteration
    LPRandImg = laplacPyr(randomImg,numLevels);
    %matching the histograms of each level fro the random pyramid to the of
    %the texture pyramid
    for i=1:numLevels
        disp('im matching histograms sorry its taking long itll be over soon...!')
        LPRandImg{i} = imHistShapeDouble(LPRandImg{i},LPTexture{i});
    end
    %colpsing random img after matching histograms of the pyramids levels
    randomImg = collapseLapPyr(LPRandImg);
    %changing the range back
    %if you want to see the resault of each image produced in the
    %procces..
    if show==1
        txt = sprintf('result for iteration num:%d', j);
        if j==numRepeats
            txt = sprintf('last iteration for this texture');
        end    
        figure(1)
        imshow(randomImg,[]),title(txt)
        disp('please press space bar to continue')
        pause
        close
    end
end    
newtexture=uint8scaling(randomImg);


% (file name is accordi7u8ngly textureSynthesis.m )
% This routine synthesizes a new image with texture statistics similar to the given texture.
% 
% Input:      texture = a grayscale image (values in [0,255]) containing a texture.
% numLevels = the number of levels created in the Laplacian Pyramids used in the process
% (minimum value = 1).
% numRepeats = the number of iterations to perform during synthesis.
% show  =  an OPTIONAL binary argument. If TRUE (~0) then function displays the result
% for each iteration. Between displays user must press space bar.
%     If FALSE (0) or is not given then does not display anything.
%     
%     Output:   newtexture = a grayscale image (values in [0,255]) of size same as input image texture.
%     
%     Method:  Follows the Heeger and Bergen method:
%     1. Create random image of required size
%     2. Build Laplacian pyramid for input texture and for random image.
%     3. Shape histogram of each level of random image to equal corresponding level of texture pyramid.
%     4. Collapse pyramid of random image producing synthetic texture.
%     5. Correct synthetic texture (collapsed image) to range.
%     6. Repeat from step 2.
%     
%     Notes: Correct collapsed image to be within gray value range. Either scale or clip or use some
%     combination.
%     Note histogram shaping usually works on 0..255 but laplacian values are �minVal + maxval  so
%     scale the values to 0..255 range before applying histShape and don�t forget to scale back to correct
%     range after mapping.
%     Use matlab function rand (values in range 0..1).
%     Use function nargin to evaluate if show is given.
    

%firas ayoub-308185313
numLevels=4; 
numRepeats=3;
show =0; 
[textureRGB,map]=imread('brick1.tif');
grayscaleImg=double(imread('texture1bw.tif'));
textureRGB = ind2rgb(textureRGB,map);
%taking only green color from the color map
G=textureRGB(:,:,2);
newGraytexturefromGray =textureSynthesis(grayscaleImg,numLevels,numRepeats,show);
newGraytexturefromRGB = textureSynthesis(G,numLevels,numRepeats,show);
newRGBtexture = textureSynthesisRGB(textureRGB,numLevels,numRepeats,show);
figure(5)
subplot(2,2,1),imshow(textureRGB,[]),title('orginal im/texture');
subplot(2,2,3),imshow(newRGBtexture,[]),title('newRGBtexture');
subplot(2,2,4 ),imshow(newGraytexturefromRGB,[]),title('newGraytexture used only the G of the rgb img(texture)');
figure(6)
subplot(1,2,1),imshow(grayscaleImg,[]),title('orginal im/texture');
subplot(1,2,2),imshow(newGraytexturefromGray,[]),title('new grayscale texture using grayscale img(texture)');
imwrite(newGraytexturefromRGB,'newGraytexturefromRGB.tif')
imwrite(newRGBtexture,'newRGBtexture.tif')
imwrite(newGraytexturefromGray,'newGraytoGray.tif')
% What type of textures fail to synthesize well?
%the ones with the big patterns like the bricks ,  but the wools almost
%kept kind of feeling with the texture
% 
% SUBMIT: the mfiles and the original and synthesized examples.
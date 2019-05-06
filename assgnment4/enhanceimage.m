%Firas Ayoub-308185313

%block begin-----------------------------------------
blocks='blocks.tif';
disp('blocks:')
imblock=imread(blocks);
maskRadius=[3 3];
disp('image of blocks with noise of random lines cleaned by median mask radius used 3x3 so i can keep the shape of the blocks')
cleanblocks = cleanImageMedian (imblock, maskRadius);
figure(1)
subplot(1,2,1),imshow(imblock),title('original img');
subplot(1,2,2),imshow(cleanblocks,[]),title('cleaned by median');
%block end-----------------------------------------

%cups begin-----------------------------------------
cupsIm = imread('cups.tif');
[X, Y] = size(cupsIm);
%image to fft 2-d
G = fft2(cupsIm);
%creating mask
M = zeros(X, Y);
M(1,1) = 1/2;
M(3,20) = 1/2;
%mask ->fft 2-d
H = fft2(M);
figure(2)
subplot(1,2,1),Fftplotting(fftshift(G)),title('cups FFT before enhancing')
subplot(1,2,2),Fftplotting(fftshift(H)),title('FFT for mask')


%inverse filttering
lambda = 1/200;
cleanCups = (abs(H) > lambda) .* G ./ H;
cleanCups(isnan(cleanCups)) = 110;
cleanCups = uint8(ifft2(cleanCups));
figure(3)
subplot(2,2,1),imshow(cupsIm,[]),title('original')
subplot(2,2,2),imshow(cleanCups,[]),title('enhanced')
subplot(2,2,3),imshow(M,[]),title('Mask')
disp('inverse filtering to clean echo in image');
%cups end-----------------------------------------
%house begin-----------------------------------------
disp('house: motion blur noise')
house2im = im2double(imread('house2.tif'));
%L=number of smeered pixels looking at the image matrix and by trying different values 10 gave best results
L = 10;
%angle of the motion (horizontal to ax x) 180 degree 
theta = 180;
%creating the point spread function (mask)
psf = fspecial('motion', L, theta);
%chose it simply by estimation and alot of different trys
noiseVar = 0.0001;
% noise to signal power ratio
nsr = noiseVar / var(house2im(:));
disp('house2 cleaning motion blur')
cleanHouse = deconvwnr(house2im, psf, nsr);
figure(4)
subplot(1,2,1),imshow(house2im),title('original')
subplot(1,2,2),imshow(cleanHouse,[]),title('enhanced')

%house end-----------------------------------------

%mission begin-----------------------------------------
missionIm = imread('mission.tif');
fft = fftshift(fft2(missionIm));
oldfft=fft;
%points found in the fft
fft(109:128, 109:149) = fft(109:128, 109:149) .* 2;
fft(130:149, 109:149) = fft(130:149, 109:149) .* 2;
fft(129:129, 109:128) = fft(129:129, 109:128) .* 2;
fft(129:129,130:149 ) = fft(129:129, 130:149) .* 2;

figure(5)
subplot(1,2,1),Fftplotting((oldfft)),title('mission FFT before enhancement')
subplot(1,2,2),Fftplotting((fft)),title('FFT for enhanced mission')

cleanmission = ifft2(fftshift(fft));
figure(6)
subplot(1,2,1),imshow(missionIm),title('original')
subplot(1,2,2),imshow(cleanmission,[]),title('enhanced')
%mission end-----------------------------------------

%oldwoman begin-----------------------------------------
oldwomanIm = imread('oldWoman.tif');
fft=fftshift(fft2(oldwomanIm));
oldfft=fft;
disp('for the 4 points i found on the fft i had to do median cleaning for the 3point around them(the white dots in the image)')
fft(120, 160) = median(fft(119:121, 159:161),'all');
fft(149, 160) = median(fft(148:150, 159:161),'all');
fft(109, 98) = median(fft(108:110, 97:99),'all');
fft(138, 98) = median(fft(137:139, 97:99),'all');

figure(7)
subplot(1,2,1),Fftplotting(oldfft),title('oldwoman FFT before enhancing')
subplot(1,2,2),Fftplotting(fft),title('FFT for enhanced oldwoman')
cleanoldwoman = FFT2im(fftshift(fft));
figure(8)
subplot(1,2,1),imshow(oldwomanIm),title('original')
subplot(1,2,2),imshow(cleanoldwoman,[]),title('enhanced')

%oldwoman end-----------------------------------------

%stroller begin-----------------------------------------
strollerim = imread('stroller.tif');
disp('image needs to circulary shifted (-5)(theres a thin line on the top that should be on the bottom of the image) and deblurred(sharppened)')
disp('i used the sharpen that we created last exc. with MR=[2,2] std=1/5 and lambda=3 for no particular reason other than it looked the best in my opinion')
shiftim = circshift(strollerim, -5,1);
cleanstroller = sharpen(shiftim, 1/5, 3);
figure(9)
subplot(1,2,1),imshow(strollerim),title('original')
subplot(1,2,2),imshow(cleanstroller,[]),title('enhanced')
%stroller end-----------------------------------------

%windows begin -----------------------------------------
windowsim = imread('windows.tif');
disp('windows:')
disp('in this image we have a gussain noise so i used clean image mean maskstd=1/10, and then sharpened with maskstd=1/5 and lambda=3 and for both methods mask radius=[2,2]')
cleanedBYmean = cleanImageMean(windowsim, 1/10);
cleanwindows = sharpen(cleanedBYmean, 1/5, 3);
figure(10)
subplot(1,2,1),imshow(windowsim),title('original')
subplot(1,2,2),imshow(cleanwindows,[]),title('enhanced')
%windows end-----------------------------------------

%face begin-----------------------------------------
face='face.tif';
disp('the idea here is to crop each image (like in the mapimage function)and place them one on top of the other and the creat median for each pixel in the three different images(frames)')
imface=imread(face);
img1=imface(20:144,27:132);
img1=img1(1:124,2:104);
img2=imface(39:209,127:247);
img3=imface(19:252,11:128);
img2=imrotate(img2,90);
img2=imresize(img2,[256,256]);
img1=imrotate(img1,8.5);
img1=imresize(img1,[256,256]);
img3=imresize(img3,[256,256]);
img3=imrotate(img3,90);

for i=1:256
    for j=1:256
        cleanface(i,j)=median([img1(i,j),img2(i,j),img3(i,j)]);
    end
end
figure(11)
subplot(1,2,1),imshow(face),title('original img');
subplot(1,2,2),imshow(cleanface,[]),title('cleaned by median');
%face end-----------------------------------------

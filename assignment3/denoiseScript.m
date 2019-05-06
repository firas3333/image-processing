%Firas Ayoub - 308185313
path='C:\Users\firas\OneDrive\Desktop\ip3\barbarasmall.tif';
im=imread(path);
p=3000;
s= 0.05;
t=15;
maskRadius=[2 2];
maskSTD=1/25;
lambda=3;
disp('(a):');
noisyIma=addSPnoise(im,p);
cleanIma = cleanImageMedian (noisyIma, maskRadius);
cleanIma2 = cleanImageMean(noisyIma, maskRadius, maskSTD);
figure(1)
subplot(2,2,1),imshow(noisyIma),title('SPnoise')
subplot(2,2,2),imshow(im),title('original')
subplot(2,2,3),imshow(cleanIma,[]),title('cleaned by median');
subplot(2,2,4),imshow(cleanIma2,[]),title('cleaned by mean');
disp('psnr between original image and noisy image')
PsnrORNO=calcPSNR(noisyIma,im);
disp(PsnrORNO)
disp('psnr between original image and denoised image using median:')
PsnrORmed=calcPSNR(cleanIma,im);
disp(PsnrORmed)
disp('psnr between original image and denoised image using mean:')
PsnrORmea=calcPSNR(cleanIma2,im);
disp(PsnrORmea)

disp('(b):');
noisyIm2=addGaussianNoise(im, s);
cleanImb = cleanImageMedian (noisyIm2, maskRadius);
cleanImb2 = cleanImageMean(noisyIm2, maskRadius, maskSTD);
figure(2)
subplot(2,2,1),imshow(noisyIm2),title('GaussianNoise')
subplot(2,2,2),imshow(im),title('original')
subplot(2,2,3),imshow(cleanImb,[]),title('cleaned by median');
subplot(2,2,4),imshow(cleanImb2,[]),title('cleaned by mean');
disp('psnr between original image and noisy image')
PsnrORNO=calcPSNR(noisyIm2,im);
disp(PsnrORNO)
disp('psnr between original image and denoised image using median:')
PsnrORmed=calcPSNR(cleanImb,im);
disp(PsnrORmed)
disp('psnr between original image and denoised image using mean:')
PsnrORmea=calcPSNR(cleanImb2,im);
disp(PsnrORmea)
disp('(c):');
disp('in my opinion and i believe anyones opinion visualy it looks better to clean sp noise using the median method and usin the mean method to clean Gnoise and it makes since given the way each noise work since usualy a single pixel has the same colour as its nieghbour so giving the noisy pixels in spnoise the average colour of its nieghbours will give almost perfect resault while using mean will destor even the right coloured pixels as for gussain noise its better to use the mean method because noise isnt distrebuted evenly as for the psnr')
disp('SPnoise using median we got a larger psnr than using mean')
disp('Gnoise using median we got a larger psnr than using mean but in much less segnificant way (almost same psnr)')
disp('d')
heavyP=(256*256)/2;%half the pixels
noisyImd=addSPnoise(im,heavyP);
n=5;
psnrd = zeros(1, n);
rads=1:n;
for i=1:n
  maskRadiusd=[i i];
  cleanImd = cleanImageMedian (noisyImd, maskRadiusd);
  psnrd(i)=calcPSNR(cleanImd,im);
end
figure(3)
plot(rads, psnrd);
xlabel('sizes of masks');
ylabel('PSNR values');
title('psnr value depending on Median filtering of Spnoise with different mask sizes');    
disp('as we can see the psnr start law because the mask is of size 1(pixel) and its meaningless because it keeps the full destortion and then slowly psnr starts to grows until it peaks at the perfect mask size then it will gradualy start go lower because the mask is too large and we are calculating colors of pixels that we dont want') 







disp('e')
heavys=0.02;
noisyIme=addGaussianNoise(im, heavys);
n=5;
maskRadiuse=[7 7];
psnre = zeros(1, n);
mstd=1:n;
for i=1:n
  maskSTDe=1/(n^2);
  cleanIme =cleanImageMean(noisyIme, maskRadius, maskSTDe);
  psnre(i)=calcPSNR(cleanIme,im);
end
figure(4)
plot(mstd, psnre);
xlabel('mstd');
ylabel('PSNR values');
title('psnr value depending on mean filtering of Gnoise with different maskstd'); 
disp('psnr stays the same although it doesnt make sence ')
disp('i:')
noisyImi=addSPnoise(im,p);
sharpImi = sharpen(noisyImi, maskRadius, maskSTD, lambda);
subplot(1,2,1),imshow(noisyImi),title('SPnoise')
subplot(1,2,2),imshow(sharpImi),title('sharpen SPnoise')
disp('the black dots(pepper) almost dissapear ')







sharpIm = sharpen(im, maskRadius, maskSTD, lambda);
noisyIm2 = addGaussianNoise(im, s);
%zero padding
noisyIm3 = addMotionBlur(im,t);
figure(8)
subplot(2,2,1),imshow(noisyIm),title('SPnoise')
subplot(2,2,2),imshow(noisyIm2),title('GaussianNoise')
%i used [] instead of defining min(image), max(image)
subplot(2,2,3),imshow(noisyIm3,[]),title('motion blur')
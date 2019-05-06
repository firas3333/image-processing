%STUDENT NAMES AND ID
%FIRAS AYOUB 308185313
%AHMED TAYAH 205690720
path='C:\Users\firas\OneDrive\Desktop\Firas.Ayoub.308185313-Ahmed.Tayah.205690720\object(1).tif';
path2='C:\Users\firas\OneDrive\Desktop\Firas.Ayoub.308185313-Ahmed.Tayah.205690720\darkimage (1).tif';
ROTATIONPATH2='C:\Users\firas\OneDrive\Desktop\Firas.Ayoub.308185313-Ahmed.Tayah.205690720\darkimage (1)ROT.tif';
im=imread(path);
h=histImage(im);
im2=imread(path2);
h2=histImage(im2);
ROTim=imread(ROTATIONPATH2);
ROTh2=histImage(ROTim);
%(A)
if sum(h2-h)==0;
    %only if it has the same Histogram we get the figure shown
    figure
%     title('DIFFERENT IMAGES SAME HISTOGRAM')
    subplot(2,2,1),imshow(im2),title('straight image')
    subplot(2,2,2),imshow(ROTim),title('rotated image')
    subplot(2,2,3),bar(h2,20),title('hitogram for straight image'),xlabel('x'),ylabel('y')
    subplot(2,2,4),bar(ROTh2,20),title('histogram for rotated image'),xlabel('x'),ylabel('y')   
end
pause
close all
%(B) BLUR DIDNT WORK I DONT KNOW WHY BUT THIS IS THE SCRIPT
% eList=zeros(1,100);
% cList=zeros(1,100);
% for i=1:100
%     nim = blurImage((im),i);
%     h=histImage(nim);
%     [m,v,e] = calcHistStat(h);
%     eList(i)=e;
%     cList(i)=sqrt(v);
% end
% figure2
% %title('BLUR EFFECT ON CONTRAST AND ENTROPY')
% %this should be a downward function on contras meaning the larger the
% %blur th smaller the contrast
% subplot(1,2,1),plot(eList),title('ENTROPY')
% subplot(1,2,2),plot(cList),title('CONTRAST')
% pause
% close all

%(C)didnt do it 

%(D)NEGATIVE IMAGES
%we do a new map where each color get its exact negative eg. 1 gets 256 
tmnegative=zeros(1,256);
for i =1:256 ,tmnegative(i)=256-i;end
binim = mapImage (im,tmnegative);
nim2 = mapImage (im2,tmnegative);
figure 
subplot(2,2,1), imshow(im),title('img1 normal colors')
subplot(2,2,2), imshow(binim),title('img1 negative colors')
subplot(2,2,3), imshow(im2),title('img2 normal colors')
subplot(2,2,4), imshow(nim2),title('img2 negative colors')
pause 
close all

%(e) chosing a threshold where all colors under it becomes zeros and all
%ones above it becom 256
threshold=128;
tmbinary=zeros(1,256);
tmbinary(threshold:256)=255;
binim = mapImage (im,tmbinary);
figure2
subplot(1,2,1),imshow(im),title('noraml colors')
subplot(1,2,2),imshow(binim),title('binary colors')

pause
close all

%(f) 

nim = imHistShape (im,im2);
hfornewim=histImage(im);

figure 
subplot(3,2,1), imshow(im),title('img1 normal colors')
subplot(3,2,2), imshow(nim),title('img1 after mapping histograms')
subplot(3,2,3), bar(h,20),title('histogram for normal image')
subplot(3,2,4), bar(hfornewim,20),title('histogram for new image')
subplot(3,2,5), bar(h2,20),title('histogram for img2 ')

pause 
close all



% nh = nhistImage(im);
% nh2 = nhistImage(im2);
% ah = ahistImage(im);
% ah2 = ahistImage(im2);
% [m,v,e] = calcHistStat(h);
% [m2,v2,e2] = calcHistStat(h2);
% 

% % nim = mapImage (im,tm);
% nim2 = mapImage (im2,tm);

% nim2 = imHistShape (im2,im);
% nim = blurImage(double(im2),100);
% 
% subplot(1,4,1), imshow(im)
% subplot(1,4,2), imshow(nim)
% subplot(1,4,3), imshow(im2)
% subplot(1,4,4), imshow(nim2)
% 

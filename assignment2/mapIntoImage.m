function    [newImage] = mapIntoImage(imageA,imageB)
%Firas Ayoub-308185313
%ahmed tayah- 205690720
path='C:\Users\firas\OneDrive\Desktop\image proccessing\hm2\barbarasmall.tif';
path2='C:\Users\firas\OneDrive\Desktop\image proccessing\hm2\darkimage (1).tif';
imA=imread(path);
imB=imread(path2);
[ximA,yimA]= size(imA);
[ximB,yimB]= size(imB);
[x1,y1]=cropimage(imA); %thats the x',y' for image A 
[x2,y2]=cropimage(imB); % thats the x,y for image B
isConvexA = checkConvex(x1,y1);
isConvexB = checkConvex(x2,y2);
if isConvexA==false || isConvexB==false;
    disp('chose points that form a polygon')
    return
end    
    
T=createTprojMat(x1,y1,x2,y2); %Projection matrix
[AXx1,AXy1] = meshgrid(1:yimA,1:ximA);
AXz1=ones(ximA,yimA);
Good = inpolygon(AXx1, AXy1, x1, y1);
goodpixels= find(Good == 1); %the pixels that we want 
%polygon MAt
Poly= transpose([AXx1(goodpixels) AXy1(goodpixels) AXz1(goodpixels)]);
sourceCoor = pinv(T) * Poly;
% normalize by Z axis
Z = sourceCoor(3,:);
X = sourceCoor(1,:) ./ Z;
Y = sourceCoor(2,:) ./ Z;
indx=find(X<1 | X>yimA); %out of range pixels
X(indx)=1; 
Y(indx)=1;
indy=find(Y<1 | Y>ximA); %out of range pixels
X(indy)=1; 
Y(indy)=1;
V = BilinearInt(X, Y, ximB, imB);
newIm = imA;
newIm(goodpixels) = V;   
imshow(newIm);

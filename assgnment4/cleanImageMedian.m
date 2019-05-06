function    cleanIm = cleanImageMedian (im, maskRadius)
[X,Y]=size(im);
xrad=maskRadius(1)*2+1;
yrad=maskRadius(2)*2+1;
flt=zeros(xrad,yrad);
cleanIm=zeros(X,Y);
for i=2:X-1
    for j=2:Y-1
        %NOTE change the mask right now hardcoded to 3X3
        flt=[im(i-1,j-1),im(i-1,j),im(i-1,j+1),im(i,j-1),im(i,j),im(i,j+1),im(i+1,j-1),im(i+1,j),im(i+1,j+1)];
        cleanIm(i,j)=median(flt);
    end
end
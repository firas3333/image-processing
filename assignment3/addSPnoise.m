function noisyIm=addSPnoise(im,p)
%p/2 black
%p/2 white
noisyIm=im;
[Xi,Yi]=size(noisyIm);
%choosing p/2 random pixels to be black
for i=1:p/2;
    x=Xi*rand;
    y=Yi*rand;   
    %sometime i get a zero from the rand so here i make sure i wont try to
    %change the color of pixel that doesnt exist
    while round(x)<=0 || round(y)<=0
        x=Xi*rand;
        y=Yi*rand;
    end    
    noisyIm(round(x),round(y))=0;
end 
%choosing p/2 random pixels to be white
for i=1:p/2;
    x=Xi*rand;
    y=Yi*rand;
    while round(x)<=0 || round(y)<=0
        x=Xi*rand;
        y=Yi*rand;
    end    
    noisyIm(round(x),round(y))=255;
end

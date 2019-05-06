function    G = gaussPyr(img,levels)
img=double(img);
[x,y]=size(img);
%i cant get more than log the min number of pixels(ax x or y) 
n=log2(min(x,y));
%so i initiate my cell to be of that size
if levels>n
    disp('error: image doesnt have enough pixels to do this many levels')
    return;
end    
G=cell(1,levels);
for i=1:levels
    if i==1
        %first level the image stays the same
        G{1}=img; 
        DS=img;
    else
        %downsampling
        DS = downSample(DS);
        G{i}=DS;
    end    
end 




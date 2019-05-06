
function h = histImage(im)
h=zeros(1,256);
for i=1:length(im),  h(im(i))= h(im(i))+1;end



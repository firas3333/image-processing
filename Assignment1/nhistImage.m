function   nh = nhistImage(im)
h=histImage(im);
nh=h./sum(h);
   

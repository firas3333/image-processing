function    DS = downSample(I)
I=double(I);
gaussainmask=[0.0025 0.0125 0.0200 0.0125 0.0025;
0.0125 0.0625 0.1000 0.0625 0.0125;
0.0200 0.1000 0.1600 0.1000 0.0200;
0.0125 0.0625 0.1000 0.0625 0.0125;
0.0025 0.0125 0.0200 0.0125 0.0025];
convI=conv2_cyclic(double(I),double(gaussainmask));
DS = convI(1:2:end, 1:2:end);

function c = conv2_cyclic(a,b);
% convolve a and b using cyclic padding. 
% return imag c same size as a
% assume b <= a
aa = [ a a a ; a a a ; a a a];
c = conv2(aa,b,'same');
c = c(size(a,1)+1:2*size(a,1),size(a,2)+1:2*size(a,2));

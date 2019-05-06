function   ah = ahistImage(im)
h=histImage(im);
ah=zeros(1,256);
ah(1)=h(1);
for i=2:length(h),  ah(i)=h(i)+ah(i-1);end;


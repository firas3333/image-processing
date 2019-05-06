function   [m,v,e] = calcHistStat(h)
nh=h./sum(h);
greysclae=zeros(1,256);
for i=1:256 ,greysclae(i)=i-1;end;
m=sum((h.*greysclae)./sum(h));
v=sum(greysclae.^2.*h)/(sum(h)-(m^2));
e=-sum(nh(nh>0).*log2(nh(nh>0)));

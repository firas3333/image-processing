function    tm = histShape (h1,h2)
color1=cumsum(h1 ./ sum(h1));
color2=cumsum(h2./sum(h2));
p1=1;
p2=1;
tm = zeros(1, 256);
while p1<=256&&p1<=256&&color1(p1)<1;
     if color1(p1)-color2(p2)<=0;
         tm(p1)=p2;
         p1=p1+1;
    else
            p2=p2+1;
    end
 end
end       
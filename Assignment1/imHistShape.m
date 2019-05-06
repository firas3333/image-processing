function    nim = imHistShape (im1,im2)
h=histImage(im1);
h2=histImage(im2);
tm = histShape (h,h2);
nim= mapImage (im1,tm);
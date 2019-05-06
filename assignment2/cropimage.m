function [x,y]=cropimage(im)
    disp('please chose 4 points by clicking your mouse please chose your points in a clock wise order ') 
    imshow(im)
    [x,y]=ginput(4);
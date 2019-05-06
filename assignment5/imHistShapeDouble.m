function nim = imHistShapeDouble(im1, im2)
    nim = double(imHistShape(uint8scaling(im1), uint8scaling(im2)));
end
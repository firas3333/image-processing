function V = BilinearInt(X, Y, xim, im)
% initiate  nieghbours
    SE = (floor(X) .* xim) + floor(Y);
    NE = (floor(X) .* xim) + floor(Y) + 1;
    SW = ((floor(X) - 1) .* xim) + floor(Y);
    NW = ((floor(X) - 1) .* xim) + floor(Y) + 1;
    
    
    delX = X - floor(X);
    delY = Y - floor(Y);
    S = double(im(SE)) .* double(delX) + double(im(SW)) .* double(1 - delX);
    N = double(im(NE)) .* double(delX) + double(im(NW)) .* double(1 - delX);
    V = double(N) .* double(delY) + double(S) .* double(1 - delY);
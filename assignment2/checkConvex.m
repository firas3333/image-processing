function isConvex = checkConvex(px,py)
%to be 100% completly honost i coppied this code from matlabgeeks.com i
%understand it completly but i didnt see a point in changing names of variables ...
% can determine if the polygon is convex based on the direction the angles
% turn.  If all angles are the same direction, it is convex.
v1 = [px(1) - px(end), py(1) - py(end)];
v2 = [px(2) - px(1), py(2) - py(1)];
signPoly = sign(det([v1; v2]));
% check subsequent vertices
for k = 2:4-1
    v1 = v2;
    v2 = [px(k+1) - px(k), py(k+1) - py(k)]; 
    curr_signPoly = sign(det([v1; v2]));
    % check that the signs match
    if not (isequal(curr_signPoly, signPoly))
        isConvex = false;
        return 
    end
end
% check the last vectors
v1 = v2;
v2 = [px(1) - px(end), py(1) - py(end)];
curr_signPoly = sign(det([v1; v2]));
if not (isequal(curr_signPoly, signPoly))
    isConvex = false;
else
    isConvex = true;
end
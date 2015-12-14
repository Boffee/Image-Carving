function I=imageRemove(I,direction)
obj_mask = getMask(I);
h = max(sum(obj_mask, 1));
w = max(sum(obj_mask, 2));

if direction == 'v'
    I = kCarveHorizontal(I, h, obj_mask);
%     I = kInsertHorizontal(I, h);
else
    I = kCarveVertical(I, w, obj_mask);
%     I = kInsertVertical(I, w);
end
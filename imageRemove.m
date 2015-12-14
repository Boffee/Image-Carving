function I=imageRemove(I,direction)
obj_mask = getMask(I);
h = max(sum(obj_mask, 1));
w = max(sum(obj_mask, 2));

if direction == 'v'
    I = kRemoveHorizontal(I, h, mask);
else
    I = kRemoveVertical(I, w, mask);
end
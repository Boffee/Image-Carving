function I = kInsertVertical(I, k)
    % rotate by 90 degrees
    I = cat(3,I(:,:,1)',I(:,:,2)',I(:,:,3)');
    I = kInsertHorizontal(I, k);
    I = cat(3,I(:,:,1)',I(:,:,2)',I(:,:,3)');
end

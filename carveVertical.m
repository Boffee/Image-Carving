function I = carveVertical(I)
    % rotate by 90 degrees
    I = cat(3,I(:,:,1)',I(:,:,2)',I(:,:,3)');
    I = carveHorizontal(I);
    I = cat(3,I(:,:,1)',I(:,:,2)',I(:,:,3)');
end
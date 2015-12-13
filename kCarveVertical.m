function I = kCarveVertical(I, k)

I = cat(3,I(:,:,1)',I(:,:,2)',I(:,:,3)');
for i = 1:k
    I = carveHorizontal(I);
end
I = cat(3,I(:,:,1)',I(:,:,2)',I(:,:,3)');

end

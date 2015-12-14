function I = kCarveVertical(I, k, grad_mask)

I = cat(3,I(:,:,1)',I(:,:,2)',I(:,:,3)');
if nargin < 3
    I = kCarveHorizontal(I, k);
else
    I = kCarveHorizontal(I, k, grad_mask');
end
I = cat(3,I(:,:,1)',I(:,:,2)',I(:,:,3)');

end

function I = kCarveHorizontal(I, k, grad_mask)
if nargin < 3
    for i = 1:k
        I = carveHorizontal(I);
    end
else 
    for i = 1:k
        [I, ~, grad_mask] = carveHorizontal(I, grad_mask);
    end
end
end

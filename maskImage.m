function im = maskImage(im, mask)
    for c = 1:size(im,3)
        im(:,:,c) = im(:,:,c).*mask;
    end
end
function I = contentAmplify(I, scale)

if scale < 1
    disp('scale must be greater than 1');
    return;
end

[ho wo bo] = size(I);
I = imresize(I, scale);
[hn wn bn] = size(I);

I = kCarveHorizontal(I, hn-ho);
I = kCarveVertical(I, wn-wo);

end
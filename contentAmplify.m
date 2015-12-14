function I = contentAmplify(I, scale)



[ho wo bo] = size(I);
I = imresize(I, scale);
[hn wn bn] = size(I);

r = hn-ho;
c = wn-wo;

if r < 0
    I = kInsertHorizontal(I, abs(r));
    I = kInsertVertical(I, abs(c));
else
    I = kCarveHorizontal(I, r);
    I = kCarveVertical(I, c);
end

end
function I = imageResize(I, h, w)

[ho, wo, bo] = size(I);

r = h-ho;
c = w-wo;

if r < c
    if r > 0
        I = kInsertHorizontal(I, abs(r));
    else
        I = kCarveHorizontal(I, abs(r));
    end
    if c > 0
        I = kInsertVertical(I, abs(c));
    else
        I = kCarveVertical(I, abs(c));
    end
else
    if c > 0
        I = kInsertVertical(I, abs(c));
    else
        I = kCarveVertical(I, abs(c));
    end
    if r > 0
        I = kInsertHorizontal(I, abs(r));
    else
        I = kCarveHorizontal(I, abs(r));
    end
end
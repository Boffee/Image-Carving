function I = kInsertHorizontal(I, k)

carved_seams = [];
inserted_seams = [];


for i = 1:k
    [I, seam] = carveHorizontal(I);
    carved_seams = cat(1, {seam}, carved_seams);
end

for i = 1:numel(carved_seams)
    seam = carved_seams{i};
    for j = 1:numel(inserted_seams)
        seam = allocateSeamSpace(seam, inserted_seams{j});
    end
    I = allocateSeamSpace(I, seam);
%     seam = rgb2gray(seam) > 0;
%     seam = cat(3, seam, zeros(size(seam)), seam);
    I = I + seam;
    if max(seam(1,:)) == 1
        % current seam touch the top boundary, so insert below
        seam = [zeros(1,size(seam,2),3); seam];
        insert_seam = (seam + ...
            maskImage([I;zeros(1,size(I,2),3)], (rgb2gray(seam) > 0)))/2;
    else
        % insert above
        seam = [seam; zeros(1,size(seam,2),3)];
        insert_seam = (seam + ...
            maskImage([zeros(1,size(I,2),3);I], (rgb2gray(seam) > 0)))/2;
    end
%     insert_seam = rgb2gray(insert_seam) > 0;
%     insert_seam = cat(3, insert_seam, zeros(size(insert_seam)), zeros(size(insert_seam)));
    inserted_seams = cat(1, {insert_seam}, inserted_seams);
    I = allocateSeamSpace(I, insert_seam);
    I = I + insert_seam;
end

end

function I = allocateSeamSpace(I, seam)
    [h w b] = size(I);
    seam_mask = rgb2gray(seam) > 0;

    %% get mask for pixels that are shifted by the seam
    shift_mask = zeros(h,w);
    for col = 1:w
        seam_found = false;
        for row = 1:h
            if row > size(seam, 1) || seam_mask(row,col) == 1
                seam_found = true;
            end
            if seam_found
                shift_mask(row,col) = 1;
            end
        end
    end
    
    result = zeros(h+1,w,b);
    result = result + [maskImage(I,~shift_mask); zeros(1,w,b)]...
        + [zeros(1,w,b); maskImage(I,shift_mask)];
    
    I = result;
end
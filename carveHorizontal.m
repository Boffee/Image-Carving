function [I, remove] = carveHorizontal(I)


method = 'sobel';

%% L1 norm gradient - color
[Gx(:,:,1), Gy(:,:,1)] = imgradientxy(I(:,:,1), method);
[Gx(:,:,2), Gy(:,:,2)] = imgradientxy(I(:,:,2), method);
[Gx(:,:,3), Gy(:,:,3)] = imgradientxy(I(:,:,3), method);

Gx = sqrt(Gx(:,:,1).^2+Gx(:,:,2).^2+Gx(:,:,3).^2);
Gy = sqrt(Gy(:,:,1).^2+Gy(:,:,2).^2+Gy(:,:,3).^2);
G = Gx + Gy;
% G([1 end],:) = 1e10;


%% L1 norm gradient - bw
% [Gx, Gy] = imgradientxy(rgb2gray(I), method);
% G = Gx+Gy;

%% L2 norm gradient - color
% [Gr,~] = imgradient(I(:,:,1), method);
% [Gg,~] = imgradient(I(:,:,2), method);
% [Gb,~] = imgradient(I(:,:,3), method);
% G = Gr.^2+Gg.^2+Gb.^2;

%% carve
[seam_mask, mask] = findSeam(G,1); % horizontal cut

% if nargin > 1
%     keep = maskImage(G, mask);
%     remove = maskImage(G, seam_mask);
%     G = G - keep - remove + [keep(2:end,:,:); zeros(1,size(keep,2))];
%     G = G(1:size(G,1)-1,:,:);
% end

keep = maskImage(I, mask);
remove = maskImage(I, seam_mask);
I = I - keep - remove + [keep(2:end,:,:); zeros(1,size(keep,2),3)];
I = I(1:size(I,1)-1,:,:);


end


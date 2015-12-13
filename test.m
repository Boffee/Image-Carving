%% read file
f1 = 'wave.png';
f2 = 'bubble.jpg';
f3 = 'lake_small.jpg';
f4 = 'space_shuttle.jpg';
f5 = 'atlantis.jpg';

I = im2double(imread(f5));
figure(), imshow(I);
%% gradient
% method = 'sobel';
% 
% [Gx(:,:,1), Gy(:,:,1)] = imgradientxy(I(:,:,1), method);
% [Gx(:,:,2), Gy(:,:,2)] = imgradientxy(I(:,:,2), method);
% [Gx(:,:,3), Gy(:,:,3)] = imgradientxy(I(:,:,3), method);
% 
% Gx = sqrt(Gx(:,:,1).^2+Gx(:,:,2).^2+Gx(:,:,3).^2);
% Gy = sqrt(Gy(:,:,1).^2+Gy(:,:,2).^2+Gy(:,:,3).^2);
% G = Gx + Gy;

%% resize
% tic
% for i = 1:100
%     I = carveHorizontal(I);
% end
% toc
% tic
% for i = 1:100
%     I = carveVertical(I);
% end
% toc

% I = kInsertVertical(I, 100);

[ho, wo, bo] = size(I);
Iresize = imageResize(I, ho-50, wo+50);
figure(), imshow(Iresize);

% Iamp = contentAmplify(I,1.2);
% figure(), imshow(Iamp);


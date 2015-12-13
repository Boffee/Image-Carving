%% read file
f1 = 'wave.png';
f2 = 'bubble.jpg';
f3 = 'lake_small.jpg';
f4 = 'space_shuttle.jpg';
f5 = 'atlantis.jpg';

path = 'path.jpg';
painting = 'painting.jpg';
painting3 = 'painting3.jpg';

I = im2double(imread(painting3));
[ho, wo, bo] = size(I);
figure(), imshow(I);

%% Shrink
Ishrink = imageResize(I, ho-300, wo+100);
figure(), imshow(Ishrink);

%% enlarge
Ienlarge = imageResize(I, ho, wo+100);
figure(), imshow(Ienlarge);

%% resize
Iresize = imageResize(I, ho+1, wo+1);
figure(), imshow(Iresize);


%% amplify
Iamp = contentAmplify(I,1.2);
figure(), imshow(Iamp);

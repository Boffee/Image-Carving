%% read file
f1 = 'wave.png';
f2 = 'bubble.jpg';
f3 = 'lake_small.jpg';
f4 = 'space_shuttle.jpg';
f5 = 'atlantis.jpg';

painting = 'painting.jpg';

I = im2double(imread(painting));
[ho, wo, bo] = size(I);
figure(), imshow(I);

%% Shrink
Ishrink = imageResize(I, ho, wo-200);
figure(), imshow(Ishrink);

%% enlarge
Ienlarge = imageResize(I, ho, wo+100);
figure(), imshow(Ienlarge);

%% resize
Iresize = imageResize(I, ho+50, wo+50);
figure(), imshow(Iresize);


%% amplify
Iamp = contentAmplify(I,1.2);
figure(), imshow(Iamp);


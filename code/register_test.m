%%
burst_path = 'images\auvers\';
burst_registered = register_burst(burst_path, 1);

%%
fixed = imread('images\woods\out_fba.jpg');
moving = imread('images\woods\out_sparseBDB.jpg');
imshowpair(fixed(:,:,1), moving(:,:,1),'Scaling','joint');

%%
[optimizer, metric] = imregconfig('monomodal');
% [optimizer, metric] = imregconfig('multimodal');
% optimizer.InitialRadius = 0.009;
% optimizer.Epsilon = 1.5e-4;
% optimizer.GrowthFactor = 1.01;
% optimizer.MaximumIterations = 300;

%%
% movingRegistered = imregister(moving(:,:,1), fixed(:,:,1), 'affine', optimizer, metric);
movingRegistered = imregister(moving(:,:,1), fixed(:,:,1) ,'affine',optimizer, metric);

%%
imshowpair(fixed(:,:,1), movingRegistered,'Scaling','joint');
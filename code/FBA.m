%% Initialization
p = 35;
ks = 50;
burst_path = 'images\auvers\';
% [burst, image_number] = read_burst(burst_path);
[burst, image_number] = register_burst(burst_path);

%% Read first image for configuration
first_image = burst(:,:,:,1);
[weight, acc_fft] = weight_FFT(first_image);
image_size = size(first_image);
gaussian = get_gau_ker(min(image_size) / 50);
weight = filtre_lineaire(weight, gaussian);
weight = weight .^ p;
acc_fft = multmat(acc_fft, weight);

%% Fourier Burst Accumulation
for index = 2 : image_number
    [crnt_weight, crnt_fft] = weight_FFT(burst(:,:,:,index));
    crnt_weight = filtre_lineaire(crnt_weight, gaussian);
    crnt_weight = crnt_weight .^ p;
    acc_fft = acc_fft + multmat(crnt_fft, crnt_weight);
    weight = weight + crnt_weight;
end

%% Restore image
image_restored = ifft2(divmat(acc_fft, weight), 'symmetric');
imwrite(uint8(image_restored),[burst_path 'result\output.png'],'png');

%% Sharpening
[image_afterDn,isRGB] = read_image([burst_path 'result\denoised.png']); % image denoised on IPOL
gaussian_s = get_gau_ker(3);
image_s = Gaussian3(image_restored, gaussian_s);
% image_s = Gaussian3(image_afterDn, gaussian_s);
acc_s = 2*double(image_afterDn)-image_s;
acc_fin = acc_s+0.4*(image_restored-double(image_afterDn));
imwrite(uint8(image_restored),[burst_path 'result\output.png'],'png');

%% Show images and evaluate
experiences=ones(image_size(1),image_size(2),image_size(3),image_number+1);
experiences(:,:,:,1:image_number)=burst(:,:,:,1:image_number);
experiences(:,:,:,image_selected+1)=acc_fin;
showimages(experiences);

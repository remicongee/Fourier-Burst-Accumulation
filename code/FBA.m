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
% weight = cat(3, weight, weight, weight);
image_restored = ifft2(divmat(acc_fft, weight), 'symmetric');
image(uint8(image_restored));

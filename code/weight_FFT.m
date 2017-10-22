function [ weight, image_fft ] = weight_FFT( image )
%WEIGHT_FFT Calculate Fourier weight for the input image.
%   TODO

image_size = size(image);
% image_fft = zeros(image_size);
channels = length(image_size);

image_fft = fft2(image);

module_fft = abs(image_fft);
weight = mean(module_fft, channels);

end


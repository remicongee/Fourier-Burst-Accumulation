function [ burst_registered ] = register_burst( burst_path, isRGB )
%REGISTER_BURST Image registration for RGB or GrayScale.
%   The fixed image is the first one of the burst readed.
%   Return burst_registered by (length, height, channel, number)

[burst, image_number] = read_burst(burst_path);
image_fixed = burst(:,:,:,1);
channel_number = 2 * isRGB + 1;
dim = isRGB + 3;
burst_registered = image_fixed;
[optimizer, metric] = imregconfig('monomodal');
for image_idx = 2 : image_number
    current = [];
    moving_image = burst(:,:,:,image_idx);
    for channel_idx = 1 : channel_number
        fixed = image_fixed(:,:,channel_idx);    
        moving = moving_image(:,:,channel_idx);
        moving_registered = imregister(moving, fixed,'affine',optimizer, metric);
        current = cat(channel_number, current, moving_registered);
    end
    burst_registered = cat(dim, burst_registered, current);
end

end


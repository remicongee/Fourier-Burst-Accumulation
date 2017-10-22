function [ burst, image_number ] = read_burst( burst_path )
%READ_BURST Read a burst of images(.jpg) under certain path.
%   Return (length, height, channel, number)

image_dir = dir([burst_path '*.jpg']);
image_number = length(image_dir);
[first, isRGB] = read_image([burst_path image_dir(1).name]);
image_size = size(first);
burst = first;
dim = isRGB + 3;
for index = 2 : image_number
    [current, isrgb] = read_image([burst_path image_dir(index).name]);
    if isrgb ~= isRGB
        error('[%d-th] Channel numbers do not match !', index);
    elseif size(current) ~= image_size
        error('[%d-th] Size do not match !', index);
    end
    burst = cat(dim, burst, current);
end

end


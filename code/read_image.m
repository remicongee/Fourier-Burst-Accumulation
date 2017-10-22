function [ image, isRGB ] = read_image( image_name )
%READ_IMAGE Read a Gray(RGB) image and returns its component(s).
%   TODO

image = imread(image_name);
channel_number = size(size(image));
isRGB = 1;

if channel_number == 1
    isRGB = 0;
elseif channel_number == 3
    isRGB = 1;
end

end


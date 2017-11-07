function [ image_out ] = Gaussian3( image,kernel )
sz = size(image);
image_out = zeros(sz);
len = sz(3);
for i = 1 : len
    image_out(:,:,i) = filtre_lineaire(image(:,:,i),kernel);
end

end

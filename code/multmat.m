function [ result ] = multmat( matA, matB )
%MULTMAT Multi-dimensional matrix multiplication.
%   TODO

sz = size(matA);
result = zeros(sz);
len = sz(3);
for i = 1 : len
    result(:,:,i) = matA(:,:,i) .* matB;
end

end


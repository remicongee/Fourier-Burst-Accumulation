%%
first_fft = fft2(first_image);
first_ifft = ifft2(first_fft, 'symmetric');
image(uint8(first_ifft));

%%
A = rand(1,3);
B = rand(3,3,3);
sum(bsxfun(@times,sum(bsxfun(@times,A,permute(B,[2 1 3])),1),C.'),2)
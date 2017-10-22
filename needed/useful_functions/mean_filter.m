function out=mean_filter(im,r)
% function out=mean_filter(im,r)
% filtrage passe bas par la moyenne sur une fenêtre carrée de
% rayon r
%
% Gaussian lowpass filter. 
   
[y,x]=size(im);

%on construit le masque 

masque=zeros(y,x);
masque(1:r+1,1:r+1)=1;
masque(y-r+1:y,x-r+1:x)=1;
masque(y-r+1:y,1:r+1)=1;
masque(1:r+1,x-r+1:x)=1;

masque=masque/sum(sum(masque));

% On applique le filtre par multiplication dans l'espace de Fourier:

out=real(ifft2(fft2(masque).*fft2(im)));


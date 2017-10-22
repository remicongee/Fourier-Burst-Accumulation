function out=gauss_filter(im,sig)
% function out=gauss_filter(im,sig)
% filtrage passe bas gaussien d'écart-type sig.
%
% Gaussian lowpass filter. 
   
[y,x]=size(im);

XX=ones(y,1)*([0:x/2 -x/2+1:-1]);
YY=([0:y/2 -y/2+1:-1])'*ones(1,x);
%on construit le masque 
% C'est une gaussienne, dont la moyenne est choisie de sorte que
% l'integrale soit la meme que celle du filtre passe bas
% (2*pi*sig^2=1/4*x*y (on a suppose que x=y))

masque=exp(-(XX.^2+YY.^2)/2/sig^2);

masque=masque/sum(sum(masque));

% On applique le filtre par multiplication dans l'espace de Fourier:

out=real(ifft2(fft2(masque).*fft2(im)));


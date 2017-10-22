function out=filtergauss(im)
% function out=filtergauss(im)
% filtrage passe bas gaussien.
%
% Gaussian lowpass filter. 
   
[y,x]=size(im);

XX=ones(y,1)*([0:x/2 -x/2+1:-1]);
YY=XX';
%on construit le masque 
% C'est une gaussienne, dont la moyenne des carres
% est choisie de sorte que
% l'integrale soit la meme que celle du filtre passe bas
% (2*pi*sig^2=1/2*x*y (on a suppose que x=y))

sig=x/sqrt(2)/sqrt(2*pi);

masque=exp(-(XX.^2+YY.^2)/2/sig^2);
%sum(sum(masque.^2))/y/x

% On applique le filtre par multiplication dans l'espace de Fourier:

out=real(ifft2(masque.*fft2(im)));


function out=filterlow(im)

% function out=filterlow(im)
% filtrage passe bas parfait d'une image. image supposee de taille
% pair et carree.
% Perfect lowpass filter. The size of the image is supposed even. And
% the image is supposed to be a square.

[y,x]=size(im);

XX=ones(y,1)*([0:x/2 -x/2+1:-1]);
YY=XX';
%on construit le masque des basses frequences:
masque=(abs(XX)<=(x/4-1)).*(abs(YY)<=(y/4-1));

% On applique le filtre par multiplication dans l'espace de Fourier:

out=real(ifft2(masque.*fft2(im)));


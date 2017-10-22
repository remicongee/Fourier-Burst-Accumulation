function out=masque_gaussien(x,y,sig)
% function out=masque_gaussien(x,y,sig)
% masque gaussien de taille x,y et d'écart-type sig.
%
% Gaussian lowpass filter. 
   

XX=ones(y,1)*([0:x/2 -x/2+1:-1]);
YY=([0:y/2 -y/2+1:-1])'*ones(1,x);
%on construit le masque 
% C'est une gaussienne, dont la moyenne est choisie de sorte que
% l'integrale soit la meme que celle du filtre passe bas
% (2*pi*sig^2=1/4*x*y (on a suppose que x=y))

masque=exp(-(XX.^2+YY.^2)/2/sig^2);

maxi=max(max(masque));


out=255*masque/maxi;

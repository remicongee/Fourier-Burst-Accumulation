function out=noise(im,std)
% function out=noise(im,std)
%
% ajoute un bruit blanc gaussien d'ecart type std
% a l'image.
% Adds a white gaussian noise of standard deviation std to the image. 
   
[y,x]=size(im);

out=im+std*randn(y,x);

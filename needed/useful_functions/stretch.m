function out=stretch(im)
% function out=stretch(im)
%
% Effectue un stretching des niveaux de gris d'une ima.
% Stretch the gray levels of an image 
   
[y,x]=size(im);


mi=min(min(im))
ma=max(max(im))

coef=255/(ma-mi)

out=coef*(im-mi);




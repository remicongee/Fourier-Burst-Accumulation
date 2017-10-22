function out=seuil(im,s)
%function out=seuil(im,s)
%renvoie une image a 1 dans les zones ou elle im est plus grand 
% ou egal au seuil s
% returns a binary (0/255) image of the same size as im, in whitch 
% the pixels have value 255, if and only if their value in the original image
% was >= to s. 
   
   
 out=255*(im>=s);
 
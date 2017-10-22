function out=gradx(im)
%function out=gradx(im)
%renvoie le gradient x de l'image.
%returns the gradient of the image in the x direction.
   
   
[y,x]=size(im);

out=zeros(y,x);
out(:,1:x-1)=im(:,2:x)-im(:,1:x-1);
out(:,x)=0;

   
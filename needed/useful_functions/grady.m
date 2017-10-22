function out=grady(im)
%function out=grady(im)
   %renvoie le gradient y de l'image
%returns the gradient of the image in the y direction.   
   
[y,x]=size(im);

out=zeros(y,x);
out(:,1:y-1)=im(:,2:y)-im(:,1:y-1);
out(:,y)=0;

   
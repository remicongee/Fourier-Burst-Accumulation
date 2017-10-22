function out=etiquette(im,connexite)
%function    out=etiquette(im,connexite)
%
%Numerote les composantes connexes de l'image binaire im (im=/=0).
%connexite designe le type de connexite choisie (4 par defaut)
%
%Numbers the connected components of the binary image im (im=/=0)
% connexite if the desired type of connexity (4 by default).

if (nargin<2)
   connexite=4;
end

   
 
tmp=tempname();
tmpo=tempname();
tmpoiml=sprintf('%s.iml',tmpo);
tmpima=sprintf('%s.ima',tmp);

writeima(im,tmp);
system(sprintf('etiq32 -i %s -o %s -32 -c %d',tmpima,tmpoiml,connexite));

out=readiml(tmpo);

system(sprintf('rm %s %s',tmpoiml,tmpima));

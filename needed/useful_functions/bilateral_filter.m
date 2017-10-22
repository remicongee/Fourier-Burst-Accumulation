function out=bilateral(im,r,s)
%function out=bilateral(im,r,s)
%
%filtre bilateral
%r : ecart-type du noyau radiométrique
%s : ecart-type du noyau spatial 
%
 
tmp=tempname();
tmpo=tempname();
tmpoima=sprintf('%s.ima',tmpo);
tmpima=sprintf('%s.ima',tmp);

writeima(im,tmp);
system(sprintf('/tsi/tp/bin/bilateral  %s %s -r %f -s %f',tmpima,tmpoima,r,s));

out=readima(tmpo);

system(sprintf('rm %s %s',tmpoima,tmpima));

function out=inverse_gradient_filter(im,r,cst)
%function out=inverse_gradient_filter(im,r,cst)
%
%filtre du gradient inverse
%r : rayon du filtre
%cst : constante du filtre 
%
 
tmp=tempname();
tmpo=tempname();
tmpoima=sprintf('%s.ima',tmpo);
tmpima=sprintf('%s.ima',tmp);

writeima(im,tmp);
system(sprintf('/tsi/tp/bin/gradient-inverse  %s %s %d %f',tmpima,tmpoima,r,cst));

out=readima(tmpo);

system(sprintf('rm %s %s',tmpoima,tmpima));

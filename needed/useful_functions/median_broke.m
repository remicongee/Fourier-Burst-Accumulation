function out=median(im,r)
%function out=median(im,r)
%
%Applique le filtre median  a l'image im par un masque de rayon r.

 
tmp=tempname();
tmpo=tempname();
tmpoima=sprintf('%s.ima',tmpo);
tmpima=sprintf('%s.ima',tmp);

writeima(im,tmp);
system(sprintf('/tsi/tp/bin/median  %s %s -r %d',tmpima,tmpoima,r));

out=readima(tmpo);

system(sprintf('rm %s %s',tmpoima,tmpima));

function out=nagao(im)
% function out=nagao(im)
%the Nagao filter.
 
tmp=tempname();
tmpo=tempname();
tmpoima=sprintf('%s.ima',tmpo);
tmpima=sprintf('%s.ima',tmp);

writeima(im,tmp);
system(sprintf('/tsi/tp/bin/nagao  %s %s',tmpima,tmpoima));

out=readima(tmpo);

system(sprintf('rm %s %s',tmpoima,tmpima));

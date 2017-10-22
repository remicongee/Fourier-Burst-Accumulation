function out=readima(name)
%function out=readima(name)
%
% Lit une image (grise) au format IMA.
% Le nom ne doit pas contenir l'extension .ima
%read a gray image in the IMA format
% the extension .ima must not apear in the name.

dimname=sprintf('%s.dim',name);
imaname=sprintf('%s.ima',name);

fid=fopen(dimname,'r');
X=fscanf(fid,'%d %d');
fclose(fid);

x=X(1);
y=X(2);

fid=fopen(imaname,'r');
out=fread(fid,x*y,'uint8');
fclose(fid);


out=reshape(out,x,y);
out=out';

out=out;

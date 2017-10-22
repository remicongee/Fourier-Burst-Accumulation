function out=readiml(name)
%function out=readiml(name)
%
% Lit une image (grise) au format IML.(entiers 32bits non signes)
% Le nom ne doit pas contenir l'extension .iml
% read a gray image in the IML format (32bits unsigned integers)
% the extension .iml must not apear in the name.

dimname=sprintf('%s.dim',name);
imaname=sprintf('%s.iml',name);

fid=fopen(dimname,'r');
X=fscanf(fid,'%d %d');
fclose(fid);

x=X(1);
y=X(2);

fid=fopen(imaname,'r');
out=fread(fid,x*y,'uint32');
fclose(fid);


out=reshape(out,x,y);
out=out';

out=out;

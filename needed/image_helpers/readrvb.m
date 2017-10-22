function [r,v,b]=readrvb(name)
%function [r,v,b]=readrvb(name)
%
% Lit une image (couleur) au format IMA/RVB.
% Le nom ne doit pas contenir l'extension .rvb
% Read an RVB (a special format) color image
% The extension .rvb must not apear in the name
% returns, RED (r), GREEN (v) and BLUE (b) components of the image



dimname=sprintf('%s.dim',name);
imaname=sprintf('%s.rvb',name);

fid=fopen(dimname,'r');
X=fscanf(fid,'%d %d');
fclose(fid);

x=X(1);
y=X(2);

r=zeros(1,x*y);
v=zeros(1,x*y);
b=zeros(1,x*y);
fid=fopen(imaname,'r');
im=fread(fid,3*x*y,'uint8');
r(:)=im(1:3:x*y*3);
v(:)=im(2:3:x*y*3);
b(:)=im(3:3:x*y*3);

fclose(fid);


r=reshape(r,x,y);
r=r';
v=reshape(v,x,y);
v=v';
b=reshape(b,x,y);
b=b';

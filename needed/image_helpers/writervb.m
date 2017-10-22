function writervb(r,v,b,name)
% function writervb(r,v,b,name)
%
% Sauvegarde une image (couleur) au format IMA/RVB
% Le nom (name) ne doit pas contenir l'extnsion .rvb!
% Saves a color image in the RVB format. .rvb must not apear in the name.
% r=RED, v=GREEN, b=BLUE
   
namedim=sprintf('%s.dim',name);
nameima=sprintf('%s.rvb',name);


fid=fopen(namedim,'w');
[y,x]=size(r);
fprintf(fid,'%d %d\n255\n',x,y);
fclose(fid);


fid=fopen(nameima,'w');
r=r';
v=v';
b=b';
im=zeros(1,x*y*3);
im(1:3:x*y*3)=r(:);
im(2:3:x*y*3)=v(:);
im(3:3:x*y*3)=b(:);
uint8(im);
fwrite(fid,im,'uint8');
fclose(fid);

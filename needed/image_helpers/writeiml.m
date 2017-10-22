function writeiml(im,name)
% function writeiml(im,name)
%
% Sauvegarde une image (grise) au format IML (entiers 32bits non signes)
% Le nom ne doit pas contenir l'extension .iml!
% Saves a gray image im to the disk under the name "name".
% The IML format (32bits unsigned integers) is used and the extension 
% .iml must not apear in the name.

   
namedim=sprintf('%s.dim',name);
nameima=sprintf('%s.iml',name);


fid=fopen(namedim,'w');
[y,x]=size(im);
fprintf(fid,'%d %d\n255\n',x,y);
fclose(fid);


fid=fopen(nameima,'w');
im=im';
uint8(im);
fwrite(fid,im,'uint32');
fclose(fid);

function writeima(im,name)
% function writeima(im,name)
%
% Sauvegarde une image (grise) au format IMA
% Le nom ne doit pas contenir l'extension .ima!
% Saves a gray image im to the disk under the name "name".
% The IMA format is used and the extension .ima must not apear in the name.

   
namedim=sprintf('%s.dim',name);
nameima=sprintf('%s.ima',name);


fid=fopen(namedim,'w');
[y,x]=size(im);
fprintf(fid,'%d %d\n255\n',x,y);
fclose(fid);


fid=fopen(nameima,'w');
im=im';
uint8(im);
fwrite(fid,im,'uint8');
fclose(fid);

function writepgm(im,name)
%function writepgm(im,name)
% 
% Sauvegarde une image au format pgm (gris) n'a besoin d'aucune installation 
% particuliere.
% Saves a gray image in the popular PGM format

   
fid=fopen(name,'w');
[y,x]=size(im);
im=im';
uint8(im);

fprintf(fid,'P5\n');
fprintf(fid,'%d %d\n255\n',x,y);
fwrite(fid,im,'uint8');
fclose(fid);

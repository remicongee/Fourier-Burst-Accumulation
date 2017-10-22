function writepgm_color(a,name)
%function writepgm_color(r,v,b,name)
% 
% Sauvegarde une image au format pgm (couleur) n'a besoin d'aucune 
%  installation  particuliere.
% Saves an image in the PGM color format
% r=RED, v=GREEN, b=BLUE components
   
fid=fopen(name,'w');
[y,x]=size(a(:,:,1));
r=a(:,:,1)';
v=a(:,:,2)';
b=a(:,:,3)';
uint8(r);
uint8(v);
uint8(b);

im=zeros(1,x*y*3);
im(1:3:x*y*3)=r;
im(2:3:x*y*3)=v;
im(3:3:x*y*3)=b;
fprintf(fid,'P6\n');
fprintf(fid,'%d %d\n255\n',x,y);
fwrite(fid,im,'uint8');
fclose(fid);

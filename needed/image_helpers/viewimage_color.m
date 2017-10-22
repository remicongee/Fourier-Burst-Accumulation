function viewimage_color(r,v,b)
% function viewimage_color(r,v,b)
%
% Affiche une image (couleur) en utilisant gimp
% Displays a color image in gimp r=RED, v=GREEN, b=BLUE components.

name=tempname();
name=sprintf('%s.pgm',name);

writepgm_color(r,v,b,name);
%system(sprintf('xv %s && rm %s &',name,name));
%system(sprintf('display %s && rm %s &',name,name));
system(sprintf('gimp %s &',name));

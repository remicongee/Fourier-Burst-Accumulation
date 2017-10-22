function viewimage(im)
% function viewimage(im)
%
% Affiche une image (en niveaux de gris) en utilisant gimp
% Displays a gray image in gimp. im is a matrix.

name=tempname();
name=sprintf('%s.pgm',name);

writepgm(im,name);
%system(sprintf('xv %s && rm %s &',name,name));

%system(sprintf('display %s && rm %s &',name,name));
system(sprintf('gimp %s &',name));


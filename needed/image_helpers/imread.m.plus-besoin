function out=readimage(name)
%function out=readimage(name)
%
% Lit une image en niveaux de gris
% peut lire tous les formats lus par
% la fonction convert. (et necessite donc 
% l'installation ImageMagick/convert)
% read a gray image called "name"
% full name (with extension) must be provided


tmp=tempname();

system(sprintf('identify -verbose %s | grep -i geometry | perl -pe ''s/.*[^0-9]([0-9]*)x([0-9]*)/$1 $2/''>%s.dim',name,tmp));

system(sprintf('convert %s gray:%s.ima',name,tmp));

out=readima(tmp);

system(sprintf('rm %s.ima %s.dim',tmp,tmp));

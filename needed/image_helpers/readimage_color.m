function [r,v,b]=readimage_color(name)
%function [r,v,b]=readimage_color(name)
%
% Lit une image couleur
% peut lire tous les formats lus par
% la fonction convert. (et necessite donc 
% l'installation ImageMagick/convert)
% Reads a color image
% returns RED (r), GREEN (g), BLUE (b) components of the image
% full name must be provided (including the extension)

tmp=tempname();


system(sprintf('identify -verbose %s | grep -i geometry | perl -pe ''s/.*[^0-9]([0-9]*)x([0-9]*)/$1 $2/''>%s.dim',name,tmp));

system(sprintf('convert %s RGB:%s.rvb',name,tmp));

[r,v,b]=readrvb(tmp);

system(sprintf('rm %s.rvb %s.dim',tmp,tmp));

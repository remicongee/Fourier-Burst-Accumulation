function out=normalize_image(im)
%function out=normalize_image(im)
%normalise une image entre 0 et 255.
%normalizes an image between 0 and 255.


out=im-min(min(im));
if max(max(out))>0 
  out=out/max(max(out))*255;
end

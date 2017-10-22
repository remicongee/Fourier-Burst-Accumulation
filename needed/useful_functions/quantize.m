function out=quantize(im,n)
   
%function out=quantize(im,n)
   % renvoie une version quantifiee de im sur n niveaux
   % n doit etre un entier >= 2 et l'image ne doit pas etre constante
   % Returns a quantified version of the image, having n different values.
   % n>=2 annd the image must be non-constant.   
   
 M=max(max(im));
 m=min(min(im));
 
 if (floor(n)~=n || n<2)
    'n n a pas une valeur correcte'
 else
    tmp=floor((im-m)/(M-m)*n)*(M-m)/n+m;
    tmp=(tmp<M).*tmp+(M*(n-1)+m)/n*(tmp==M)+(M-m)/2/n;
    out=tmp;
 end
 
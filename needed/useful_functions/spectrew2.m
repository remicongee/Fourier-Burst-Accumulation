function [out,freq]=spectrew2(im);
%function [out,freq]=spectrew2(im);
%
%renvoie la densite de puissance multiplie par w^2
% le vecteur freq contient les fequences reduites (plot(freq,out)...)
%Ne fonctionne correctement que pour des images de taille paire.

[y,x]=size(im);

x2=x/2;
y2=y/2;

[X,Y]=meshgrid([0:x2 -x2+1:-1], [0:y2 -y2+1:-1]);

X=X/x;
Y=Y/y;
pas=(0.5-0.1)/100;
p2=pas/2;
freq=0.1+p2:pas:0.5-p2;

w2=X.^2+Y.^2;
w=w2.^0.5;
sp=abs(fft2(im)).^2;
sp=sp/prod(size(im));


c=1;
for k=freq
    D=(w>(k-p2)).*(w<=(k+p2));
    e=sum(sum(D.*sp));
    out(c)=e/sum(sum(D))*k^2;
    c=c+1;
end


    
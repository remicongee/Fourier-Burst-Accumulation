function out=filtre_lineaire(im,mask);
%function out=filtre_lineaire(im,mask);
%
% revoie le resultat de la convolution de im avec mask

[y,x]=size(im);
[ym,xm]=size(mask);


mm=zeros(y,x);
mm(1:ym,1:xm)=mask;

out=real(ifft2(fft2(im).*fft2(mm)));

%on fait une translation pour ne pas avoir de décalage de l'image de
%sortie
y2=round((ym-1)/2);
x2=round((xm-1)/2);


mm=zeros(y,x);
mm(y2+1,x2+1)=1;
out=real(ifft2(fft2(out).*conj(fft2(mm))));



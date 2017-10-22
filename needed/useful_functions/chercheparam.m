
im=readimage('images/lena.tif');
ker=get_gau_ker(2);

imf=filtre_lineaire(im,ker);
imfb=noise(imf,3);

viewimage(imfb);

logl=-2:0.5:5;
err=0*logl;
c=1;

for k=logl
    lam=10^k;
    restau=wiener(imfb,ker,lam);
    err(c)=var_image(restau-im);
    c=c+1;
end
plot(logl,err)


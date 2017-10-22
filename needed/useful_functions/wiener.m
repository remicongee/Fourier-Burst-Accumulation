function out=wiener(im,K,lambda)
%function out=wiener(im,K,lambda)
% fonction qui realise un filtrage de wiener 
% avec comme terme de regularisation lambda* w^2


[y,x]=size(im);
% on met le noyau a l'echelle de l'image

KK=zeros(y,x);
[yK,xK]=size(K);
KK(1:yK,1:xK)=K;

x2=x/2;
y2=y/2;

% les frequences et leur normalisation
[X,Y]=meshgrid([0:x2 -x2+1:-1], [0:y2 -y2+1:-1]);

X=X/x;
Y=Y/y;


w2=X.^2+Y.^2;
w=w2.^0.5;

% trasformee de fourier de l'image degradee
g=fft2(im);
%transformee de fourier du noyau
k=fft2(KK);
%fonction de multiplication 
mul=conj(k)./(abs(k).^2+lambda*w.^2);

%filtrage de Wiener

out=real(ifft2(mul.*g));


%On effectue une translation pour des raisons techniques

y2=round((yK-1)/2);
x2=round((xK-1)/2);


mm=zeros(y,x);
mm(y2+1,x2+1)=1;
out=real(ifft2(fft2(out).*(fft2(mm))));



function view_spectre(im,option,Hamming);
   
%function view_spectre(im,option,Ham);
% Affiche le spectre de l'image
% si option == 1(defaut), alors on affiche le module de la transformee de Fourier
% si option == 2, alors on affiche le log du module de la transformee de 
% Fourier
% Si Hamming == 1 (defaut=0), alors multiplication prealable par une fenetre de Hamming
%
% Displays the spectrum of an image.
% option == 1  (default) ==> we display the modulus of the Fourier Transform
% option == 2  ==> We display le log(modulus(Fourier Transform))
% If Hamming == 1 (default=0) ==> Multiplication by a Hamming window.


if (nargin<3)
 Hamming=0;
end

if (nargin<2)
 option=1;
end

if (Hamming ==1) 
 [y,x]=size(im);
im=double(im);
 X=0:x-1;
 Y=0:y-1;
 XX=ones(y,1)*X;
 YY=Y'*ones(1,x);

 hamwin=(1-cos(2*pi*XX/(x-1))).*(1-cos(2*pi*YY/(y-1)));
 im=im.*hamwin;
end

   
if (option == 1)
   imshow(normalize_image(abs(fftshift(fft2(im)))));
else
   if (option == 2)
      imshow(normalize_image(log(0.1+abs(fftshift(fft2(im))))));
   end
end

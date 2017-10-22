function out=var_image(im,x0,y0,x1,y1);
%var_image(im,x0,y0,x1,y1)
% renvoie la variance du morceau d'image entre les points 
% (x0,y0) et (x1,y1)
% Si x0,y0,x1,y1 ne sont pas donnes alors il renvoie la variance de l'image
%entiere.

if (nargin<2)
	x0=1;
	y0=1;
	x1=size(im,2);
	y1=size(im,1);
end

t=x1;
x1=max(x0,x1);
x0=min(x0,t);
t=y1;
y1=max(y0,y1);
y0=min(y0,t);

tmp=im(y0:y1,x0:x1);
tmp=tmp(:);
out=var(tmp);


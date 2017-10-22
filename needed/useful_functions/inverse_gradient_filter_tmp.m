function out=inverse_gradient_filter(im,type,r,cst)
%function out=inverse_gradient_filter(im,type,r,cst)
%
%Effectue le filtrage par gradient inverse de l'image im par un masque de
%rayon r.
% si type == 1, le masque est un carre (de tote 2*r+1)
% si type == 2, le masque est un disque de rayon r.
% si type == 3, r est une matrice a deux colonnes contanant sur
% chaque ligne les coordonnees d'un decalage. (ex [ -1 0 ; 0 0 ; 1 0]
% est un masque horizontal de taille 3 pixels).
% 
% Performs le inverse gradient filter on the image im with a mask of radius r
% if type ==1, the mask is a square, the side of whitch is 2*r+1
% if type ==2, the mask is a disc of radius r
% if type ==3, r is 2-columns matrix, each line reprsenting a point
% of the mask (ex. [-1 0 ; 0 0; 1 0] is a horizental mask of 3
% pixels).


if (nargin<4)
   cst=1;
end

[y,x]=size(im);

if (type==3) % la forme est fournie par l'utilisateur
   shape=r;
end

if (type==1)
   c=1;
   for k=-r:r,
      for l=-r:r
         shape(c,1:2)=[k l];
         c=c+1;
      end
   end
end

if (type ==2)
   c=1;
   for k=-r:r,
      for l=-r:r
         if (l*l+k*k<=r*r) 
            shape(c,1:2)=[k l];
            c=c+1;
         end
      end
   end
end
   
xshape=shape(:,1);
yshape=shape(:,2);

nbcases=length(xshape);

xdeb=1-min(xshape);
xfin=x-max(xshape);
ydeb=1-min(yshape);
yfin=y-max(yshape);

tmpvals=zeros(nbcases,(xfin-xdeb+1)*(yfin-ydeb+1));
tmpcoeffs=tmpvals;
orig_vals=((im(xdeb:xfin,ydeb:yfin))(:))';

for k=1:nbcases
   dx=shape(k,1);
   dy=shape(k,2);
   subtab=im(ydeb+dy:yfin+dy,xdeb+dx:xfin+dx);
   tmpvals(k,:)=(subtab(:))';
   tmpcoeffs(k,:)=abs(tmpvals(k,:)-orig_vals)+cst;
end

tmpcoeffs=1./tmpcoeffs;
tmp=sum(tmpcoeffs.*tmpvals)./sum(tmpcoeffs);


tmp=reshape(tmp,xfin-xdeb+1,yfin-ydeb+1);
out=im;
out(ydeb:yfin,xdeb:xfin)=tmp;


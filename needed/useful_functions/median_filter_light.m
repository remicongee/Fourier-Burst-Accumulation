function out=median_filter_light(im,type,r)
%function out=median_filter_light(im,type,r)
%
%Light version of median_filter: use if memory is unsuffiscient for the
% the normalversion


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

offsets=yshape+xshape*y;

nbcases=length(xshape);

xdeb=1-min(xshape);
xfin=x-max(xshape);
ydeb=1-min(yshape);
yfin=y-max(yshape);

out=im;
im2=im(:);

for kx=xdeb:xfin
    for ky=ydeb:yfin
        offset=ky+(kx-1)*y;
        tmpoffsets=offset+offsets;
        out(ky,kx)=median(im2(tmpoffsets));
    end
end

% 
% tmp=zeros(nbcases,(xfin-xdeb+1)*(yfin-ydeb+1));
% 
% for k=1:nbcases
%    dx=shape(k,1);
%    dy=shape(k,2);
%    subtab=im(ydeb+dy:yfin+dy,xdeb+dx:xfin+dx);
%    tmp(k,:)=(subtab(:))';
% end
% 
% tmp=median(tmp);
% tmp=reshape(tmp,yfin-ydeb+1,xfin-xdeb+1);
% out=im;
% out(ydeb:yfin,xdeb:xfin)=tmp;
% 

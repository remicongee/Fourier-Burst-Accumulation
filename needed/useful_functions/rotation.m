function out=rotation(im,theta,alpha,x0,y0,ech,format)
%function out=rotation(im,theta,alpha,x0,y0,ech,format)
%
%Effectue la transformation g?om?trique d'une image par
%une rotation, homoth?tie et translation
%
% x' = alpha*cos(theta)*(x-x0) - alpha*sin(theta)*(y-y0) + x0
% y' = alpha*sin(theta)*(x-x0) + alpha*cos(theta)*(y-y0) + y0 
%
% theta : angle de rotation en degr?s
% alpha : facteur d'homoth?tie
% x0, y0 : centre de la rotation
% ech : plus proche voisin (0) ou bilin?aire (1)
% format : format de l'image originale (0), image complete (1)
% 

[y,x]=size(im);

ct=cos(theta*pi/180)/alpha;
st=sin(theta*pi/180)/alpha;
ct2=cos(theta*pi/180)*alpha;
st2=sin(theta*pi/180)*alpha;

if format == 0
    xmin=1;
    xmax=x;
    ymin=1;
    ymax=y;
elseif format == 1
    xv=[ 0 x 0 x ]'-x0;
    yv=[ 0 0 y y ]'-y0;
    xxv=ct2*xv-st2*yv+x0;
    yyv=st2*xv+ct2*yv+y0;
    xmin=floor(min(xxv));
    xmax=ceil(max(xxv));
    ymin=floor(min(yyv));
    ymax=ceil(max(yyv));
end
    
out=zeros(ymax-ymin+1,xmax-xmin+1);
 
if ech == 0
    for k=ymin-y0:ymax-y0,
        for l=xmin-x0:xmax-x0,
            xx = round( ct*l+st*k+x0); 
            yy = round(-st*l+ct*k+y0);
            if xx > 0 & yy > 0 & xx <= x & yy <= y
                out(k-ymin+1+y0,l-xmin+1+x0)=im(yy,xx);
            end
        end
    end
elseif ech == 1
    for k=ymin-y0:ymax-y0,
        for l=xmin-x0:xmax-x0,
            x1 = ct*l+st*k+x0; 
            y1 =-st*l+ct*k+y0;
            xx=floor(x1);
            yy=floor(y1);
            a=x1-xx;
            b=y1-yy;
            if xx > 0 & yy > 0 & xx < x & yy < y
                v00=(1-a)*(1-b)*im(yy,xx);
                v10=a*(1-b)*im(yy,xx+1);
                v01=(1-a)*b*im(yy+1,xx);
                v11=a*b*im(yy+1,xx+1);
                out(k-ymin+1+y0,l-xmin+1+x0)=round(v00+v10+v01+v11);
            end
        end
    end
end
    
    
    
    
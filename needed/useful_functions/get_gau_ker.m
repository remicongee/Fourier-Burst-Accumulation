function out=get_gau_ker(s)
%function out=get_gau_ker(s)
%
% renvoie un noyau gaussien d'cart type s.

ss=max(3,2*round(1.5*s)+1);

ms=(ss-1)/2;

x=-ms:ms;

y=exp(-x.^2/2/s^2);

out=y'*y;
out=out/sum(sum(out));



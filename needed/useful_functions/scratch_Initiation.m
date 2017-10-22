% TUTORIEL INTRODUCTIF A OCTAVE

%Charger une image
%readimage charge une image en niveaux de gris

im=readimage('images/lena.tif');

%pour obtenir de l'aide sur une fonction octave (si l'aide est
%disponible)

help size

%obtenir la taille d'une image et la stocker dans des variables y
%(nombre de lignes) et x (nombre de colonnes):

[y,x]=size(im);

%acceder a la valeur d'un pixel particulier (ligne 18, colonne 16
%dans l'exemple suivant)

im(18,16)
% si on ecrit
im(18,16);
% la valeur n'est pas affichee.

%Tracer le graphe qui represente une ligne particuliere de l'image
%(la ligne 129, dans cet exemple)

plot(im(129,:));

%tracer le graphe d'une colonne (la 134, ici)
plot(im(:,134));

%pour que les deux graphiques s'affichent en meme temps, on va
%utiliser la fonction figure(); qui cree une nouvelle figure

plot(im(129,:));
figure();
plot(im(:,134));

%AFFICHER UNE IMAGE en niveaux de gris
viewimage(im);

%trouver le MINIMUM d'une image
min(min(im))

%la fonction min appliquee a une image renvoie une ligne qui contient
%le minimum de chaque colonne de l'image. C'est pourquoi on doit
%l'appliquer deux fois pour obtenir le minimum global

%de meme pour le MAXIMUM

max(max(im)

%et la MOYENNE
mean(mean(im))

%Afficher l'HISTOGRAMME, on utilise la fonction hist (100 est le
%nombre d'intervalles d'integration de l'histogramme)
[hh,bins]=hist(im(:),100);
% (ne pas oublier le (:) qui transforme l'image en un vecteur)

%bins contient la valeur centrale de chaque intervalle de
%l'histogramme, il est donc utilisé comme varaible x

plot(bins,hh);

% Affichage du logarithme de l'histogramme
plot(bins,log(hh+1));


% UN PROGRAMME COMPLEXE

% ON dispose d'une image im et on veut calculer une image imp qui
% telle que chaque pixel de imp soit la moyenne du voisinage de 9
% pixels (un carre 3x3) correspondant dans l'image im
%les pixels trop proches du bord ne sont pas modifies (une bande de
%largeur 1 n'est pas du tout modifiee par l'algorithme

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PREMIERE METHODE, avec une boucle CETTE METHODE EST LENTE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic;

[y,x]=size(im);
%on cree une image resultat:
imp=zeros(y,x);
%on recopie la bande exterieure de im ver imp
imp(1,:)=im(1,:);
imp(:,1)=im(:,1);
imp(y,:)=im(y,:);
imp(:,x)=im(:,x);
%on parcours toute l'image pour appliquer une moyenne locale:

for k=2:y-1,
   for l=2:x-1,
      imp(k,l)=sum(sum(im(k-1:k+1,l-1:l+1)))/9;
      k
      l
      fflush(stdout);
   end
end
% toc affiche le temps ecoule depuis le dernier tic
toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEUXIEME METHODE, sans boucle sur toute l'image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic;
[y,x]=size(im);
%on cree une image resultat:
imp2=zeros(y,x);
%on recopie la bande exterieure de im ver imp
imp2(1,:)=im(1,:);
imp2(:,1)=im(:,1);
imp2(y,:)=im(y,:);
imp2(:,x)=im(:,x);

for dy=-1:1
   for dx=-1:1
      imp2(2:y-1,2:x-1)=imp2(2:y-1,2:x-1)+im(2+dy:y-1+dy,2+dx:x-1+dx);
   end
end
imp2(2:y-1,2:x-1)=imp2(2:y-1,2:x-1)/9;


% toc affiche le temps ecoule depuis le dernier tic
toc

%N'hesitez pas a poser des questions des que vous rencontrez un
%probleme avec octave

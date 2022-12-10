yol(k,y).
yol(y,c).
yol(c,m).
yol(m,o).
yol(o,s).
yol(o,a).
% pdf'te verilen haritadaki bilgiler gercek olarak tanimlanir.

yol2(X,Y):-yol(X,Y);yol(Y,X).
% odalar arası gecisler cift yonludur bu nedenle bu kuralı simetrik olarak tanimladim.

sarjaleti(s).
% sarj aleti salonda (s) bulunmaktadır.

gec(X,X,_,[X]).  %eger baslangic ve bitis ayni noktaysa yol yalnizca bu noktayi icerir.
gec(X,Y,Visited,[X|T]):-
yol2(X,Z), % X'ten Z'ye gecis var mi kontrolü yapilir.
not(member(Z,Visited)),  % eger Z daha once ziyaret edilmediyse yola eklenir.
gec(Z,Y,[Z|Visited],T).  % yola Z eklendikten sonra baslangic noktasi Z yapilir ve ilerlemeye devam edilir.

hedef(Y,X,V,G):-
gec(Y,X,V,G), % verilen baslangic noktasindan bitis noktasina bir yol var mi diye kontrol edilir.
sarjaleti(X). % verilen bitis noktasında sarj istasyonu var mi diye kontrol edilir.
% eger yukarda gecen iki sart da saglanıyorsa olusturulan hedef fonksiyonu true dondurur ve supurge sarj istasyonuna ulasir.

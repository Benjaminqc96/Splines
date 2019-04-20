clear
close all
clc
tasa=fopen('tasas.txt','r');
tot=fopen('poblacion.txt','r');
val=fscanf(tasa,'%f',[2,inf]);
valt=fscanf(tot,'%f',[2,inf]);
p=fclose(tasa);
pt=fclose(tot);
[nod,fnod,recta,q]=split(valt(2,:),valt(1,:));
[nodt,fnodt,rectat,qt]=split(val(2,:),val(1,:));
n=length(val);
%figure,fplot(recta,[nod(n-1),nod(n)])
%grid on
%hold on
%for k=1:n-2
 %   fplot(q(k),[nod(k),nod(k+1)])
%end
for p=1:n
    plot(nod(p),fnod(p),'o','MarkerFaceColor','r')
end
hold off
%figure,fplot(rectat,[nodt(n-1),nodt(n)])
%grid on
%hold on
%for k=1:n-2
 %   fplot(qt(k),[nodt(k),nodt(k+1)])
%end
for p=1:n
    plot(nodt(p),fnodt(p),'o','MarkerFaceColor','r')
end
hold off
mediadatos=mean(val(1,:));
desvestdatos=std(val(1,:));
nev=input('Ingrese el numero de eventos para la simulacion: ');
eventos=randn(1,nev);
finver=norminv(eventos,0,1);
k=round(3.322*log10(nev+1));
[a,b]=hist(finver,k);
inter=b;
frel=a/nev;
xd=(finver*desvestdatos)+mediadatos;
[xa,xb]=hist(xd,k);
interx=xb;
frelx=xa/nev;
figure,bar(interx,frelx,.4),xlabel('x'),ylabel('f(x)')
cont=0;
for i=1:length(xd)
    if isnan(xd(i))
        xd(i)=0;
    elseif xd(i)>fnod(n) && xd(i)<19000000
         cont=cont+1;
        res=sum(xd(i));
        
    end
end
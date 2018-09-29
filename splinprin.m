function split(n,
syms x
n=input('Cuantos pares de puntos desea ingresar: ');
A=zeros(n-2);
for i=1:n
    fprintf('Ingrese x%d: ',i)
    nod(i)=input('');
    fprintf('Ingrese y%d: ',i)
    fnod(i)=input('');
end
for j=1:n-1
    h(j)=nod(j+1)-nod(j);
    dy(j)=fnod(j+1)-fnod(j);
end
for k=1:n-2
    sol(k,1)=6*((dy(k+1)/h(k+1))-(dy(k)/h(k)));
    A(k,k)=2*(h(k)+h(k+1));
end
for k=1:n-3 
    A(k,k+1)=h(k+1);
    A(k+1,k)=h(k+1);
end
C=inv(A);
solu=C*sol;
sigm(1)=0;
sigm(n)=0;

for k=1:n-2
    sigm(k+1)=solu(k);
end
for i=1:n-2
    q1(i)=(sigm(i)/6)*((((nod(i+1)-x)^3)/h(i))-h(i)*(nod(i+1)-x));
    q2(i)=(sigm(i+1)/6)*((((x-nod(i))^3)/h(i))-h(i)*(x-nod(i)));
    q3(i)=(fnod(i)*((nod(i+1)-x)/h(i)))+(fnod(i+1)*((x-nod(i))/h(i)));
    q(i,1)=q1(i)+q2(i)+q3(i);
end
grid on
hold on
for k=1:n-2
    fplot(q(k),[nod(k),nod(k+1)])
end
hold off
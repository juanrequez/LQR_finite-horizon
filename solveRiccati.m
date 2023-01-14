function [t,P,Pv]=solveRiccati(tf,A,B,Q,R,F)
%Halla P (dependiente del tiempo) a trav�s de la resoluci�n de la ecuaci�n
%diferencial de Riccati. Los terminos de entrada son autoexplicativos. 
%Pv es la versi�n vectorial de P
%P es la versi�n matricial de P
%t es el tiempo


%rango de tiempo
tspan=[tf 0];
%condici�n final
Fend=F(:);

[t,Pv]=ode15s(@(t,P) difRiccati(t,P,A,B,Q,R),tspan,Fend);

t=flip(t);
Pv=flip(Pv);
[n,~]=size(A);
P=reshape(Pv',n,n,[]);



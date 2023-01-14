function [t,P,Pv]=solveRiccati(tf,A,B,Q,R,F)
%Halla P (dependiente del tiempo) a través de la resolución de la ecuación
%diferencial de Riccati. Los terminos de entrada son autoexplicativos. 
%Pv es la versión vectorial de P
%P es la versión matricial de P
%t es el tiempo


%rango de tiempo
tspan=[tf 0];
%condición final
Fend=F(:);

[t,Pv]=ode15s(@(t,P) difRiccati(t,P,A,B,Q,R),tspan,Fend);

t=flip(t);
Pv=flip(Pv);
[n,~]=size(A);
P=reshape(Pv',n,n,[]);



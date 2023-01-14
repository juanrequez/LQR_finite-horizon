function dP=difRiccati(t,P,A,B,Q,R)
%P entra como vector
P=reshape(P,size(A)); %convierte P de vector a matriz de tamaño nxn

dP=-P*A-A'*P-Q+P*B*inv(R)*B'*P;
%dP es una matriz
dP=dP(:); %convierte dP de matriz a vector de tamaño n^2 x 1


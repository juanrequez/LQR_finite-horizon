%debe ejecutarse este archivo antes la simulación de "lqr_finito.slx"
%Tamaño del sistema
n=2; %número de estados
m=2; %número de entradas
%Matrices de estado que describen a la planta
A=[-0.1107 0;0.1107 -0.1107]; %debe ser nxn
B=[-1 1;0 0]; %debe ser nxm
%matrices de costo cuadrático
Q=[10 0;0 15]; %debe ser nxn
R=100*[1 0;0 0.1]; %debe ser mxm
%matriz de costo terminal
F=[0 0;0 0]; %debe ser nxn
%Tiempo final del funcional
tf=30;
%Resolver la ecuación diferencial de Riccati desde t=0 hasta t=tf 
%la solución regresa P (Solución de la ecuación de Riccati) y Pv que es la
%solución, escrita en forma vectorial. P contiene capas, cada una
%correspondiente a un tiempo en el vector t correspondiente a una matriz P
[t,P,Pv]=solveRiccati(tf,A,B,Q,R,F);
%Para usar la solución de P en simulink, es necesario crear una estructura
%de datos que contiene al tiempo y a los valores de P, matriciales,
%siguiendo el siguiente código:
var.time=t;
var.signals.values=P;
var.signals.dimensions=[n n];
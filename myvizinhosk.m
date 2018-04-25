% % GUILHERME CARVALHO PEREIRA
%%SEM TERMINAR
%% INICIO
function Nimg = myvizinhosk(img,k)       %%CABEÇALHO DA FUNÇÃO
close all;                              
clc;
%% DEFININDO A MASCARA
Mask = [0.111 k/10 0.111;
        k/10 2*k/10 k/10;
        0.111 k/10 0.111];
%% APLICANDO A MASCARA A MATRIZ
Nimg = imfilter (img , Mask , 'same');
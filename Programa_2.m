% % % PROGRAMA 2
% % % PROGRAMA 2 UTILIZA A FUNÇÃO FILTER2 DO MATLAB (VER HELP)PARA PROCESSAR A IMAGEM CAMERAMAN.TIF
% % % DA BIBLIOTECA DO MATLAB
% % % GUILHERME CARVALHO 
% % % INICIO
%%LIMPANDO O PROMOT AS VARIÁVEIS E FECHANDO AS JANELAS
clc;
clear al;
close all;
%%CARREGANDO AS IMAGENS
A = imread('cameraman.tif');
B = filter2([1 2 ; -1 -2] , A);             %%UTILIZAN;A CONV2...FAZ UMA "CONVOLUÇÃO" COM A MATRIZ B
%%MOSTRANDO OS RESULTADOS DA "CONVOLUÇÃO"
disp('O MAXIMO VALOR DE A É ')
disp(max(A(:)))
disp('O MINIMO VALOR DE A É ')
disp(min(A(:)))
disp('ÁPOS A CONVOLUÇÃO O MAXIMO VALOR DA MATRIZ (C) PASSA A SER ')
disp(max(B(:)))
disp('O MINIMO VALOR DA MATRIZ (C) É ')
disp(min(B(:)))
%%MOSTRANDO AS IMAGENS
imshow(A)                                   %%IMAGEM NORMAL
figure();imshow(B)                          %%IMAGEM ÁPOS A CONVOLUÇÃO
figure();imshow(uint8(B))                   %%IMAGEM ÁPOS A CONVOLUÇÃO REPRESENTADA EM 8 BITS (0 -> 255)
figure();imshow(B , [min(B(:)) max(B(:))])  %%IMAGEM ÁPOS A CONVOLUÇÃO UTILIZANDO APENAS OS VALORES DE MINIMO E MAXIMO
figure();imshow(B , [])                     %%IMAGEM ÁPOS A CONVOLUÇÃO NO MESMO FORMATO DA ANTERIOR
%%%FIM


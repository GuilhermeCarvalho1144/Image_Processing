% % % PROGRAMA 2
% % % PROGRAMA 2 UTILIZA A FUN��O FILTER2 DO MATLAB (VER HELP)PARA PROCESSAR A IMAGEM CAMERAMAN.TIF
% % % DA BIBLIOTECA DO MATLAB
% % % GUILHERME CARVALHO 
% % % INICIO
%%LIMPANDO O PROMOT AS VARI�VEIS E FECHANDO AS JANELAS
clc;
clear al;
close all;
%%CARREGANDO AS IMAGENS
A = imread('cameraman.tif');
B = filter2([1 2 ; -1 -2] , A);             %%UTILIZAN;A CONV2...FAZ UMA "CONVOLU��O" COM A MATRIZ B
%%MOSTRANDO OS RESULTADOS DA "CONVOLU��O"
disp('O MAXIMO VALOR DE A � ')
disp(max(A(:)))
disp('O MINIMO VALOR DE A � ')
disp(min(A(:)))
disp('�POS A CONVOLU��O O MAXIMO VALOR DA MATRIZ (C) PASSA A SER ')
disp(max(B(:)))
disp('O MINIMO VALOR DA MATRIZ (C) � ')
disp(min(B(:)))
%%MOSTRANDO AS IMAGENS
imshow(A)                                   %%IMAGEM NORMAL
figure();imshow(B)                          %%IMAGEM �POS A CONVOLU��O
figure();imshow(uint8(B))                   %%IMAGEM �POS A CONVOLU��O REPRESENTADA EM 8 BITS (0 -> 255)
figure();imshow(B , [min(B(:)) max(B(:))])  %%IMAGEM �POS A CONVOLU��O UTILIZANDO APENAS OS VALORES DE MINIMO E MAXIMO
figure();imshow(B , [])                     %%IMAGEM �POS A CONVOLU��O NO MESMO FORMATO DA ANTERIOR
%%%FIM


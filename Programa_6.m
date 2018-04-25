% % PROGRAMA 6
% % ESSE PROGRAMA FOI DESENVOLVIDO PARA DIMINUIR UMA IMAGEM...
% % GUILHERME CARVALHO
% INICIO
%LIMPANDO O PROMPT APAGANDO AS VARIÁVEIS E FECGANDO AS TELAS
clc;
clear all;
close all;
%LENDO A MATRIZ
A = imread('lenna_rgb.jpg');
%OBTENDO AS DIMENSOES DA MATRIZ
[lin , col , z] = size(A);
%REDUZINDO AS IMAGENS
A_metade (1:lin/2 , 1:col/2 , :) = A(1:2:lin , 1:2:col , :);    %%DIVIDINDO A MATRIZ PELA METADE
A_resize = imresize(A , 0.5);                                   %%DIVIDINDO A MATRIZ PELA METADE USANDO O IMRESIZE
A_dif = A_metade - A_resize;                                    %%CALCULANDO A DIFERENÇA ENTRE AS DUAS
%MOSTRANDO AS IMAGENS
imshow(A);
title('IMAGEM ORIGINAL')
figure();
subplot(1,3,1);
imshow(A_metade)
title('IMAGEM REDUZIDA')
subplot(1,3,2);
imshow(A_resize)
title('IMAGEM REDUZIDA COM IMRESIZE')
subplot(1,3,3);
imshow(A_dif)
title('DIFERENÇA ENTRE AS DUAS IMAGENS')
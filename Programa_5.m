% % PROGRAMA 5
% % ESSE PROGRAMA FOI DESENVOLVIDO PARA ESPELHAR UMA IMAGEM
% % GUILHERME CARVALHO
% INICIO
%LIMPANDO O PROMPT APAGANDO AS VARIÁVEIS E FECGANDO AS TELAS
clc;
clear all;
close all;
%LENDO A IMAGEM
A = imread('lenna_rgb.jpg');
A_espelho = zeros(512:512:3);
[lin , col , z] = size(A);
%ESPELHANDO A IMAGEM
A_espelho(: , 1:col , :) = A (: , col:-1:1 , :);        %%A MATRIZ ESPELHO COM COLUNAS QUE VAO DE 1 ATE "col" INCREMENTADO DE 1 
                                                        %%RECEBE A MATRIZ NORMAL COM COLUNAS QUE VARIAM DE "col" ATE 1 DECREMENTANDO DE 1....
                                                        %%LINHAS E BANDAS NAO MUDAM
%MOSTRANDO OS RESULTADOS
subplot(1,2,1)
imshow(A)
title('IMAGEM ORIGINAL')
subplot(1,2,2)
imshow(uint8(A_espelho))
title('IMAGEM ESPELHADA')
%FIM
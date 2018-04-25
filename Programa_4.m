% % PROGRAMA 4
% % ESSE PROGRAMA FOI DESENVOLVIDO PARA QUE O PADRAO BAYER FOSSE COMPOMPARADA COM A FUNÇÃO RGB2GRAY DO MATLAB
% % GUILHERME CARVALHO
% INICIO
%LIMPANDO O PROMPT APAGANDO AS VARIÁVEIS E FECGANDO AS TELAS
clc;
clear all;
close all;
%LENDO A IMAGEM
A = imread('lenna_rgb.jpg');
%DIVIDINDO A IMAGEM NAS BANDA R, G E B
A_r = A(: , : , 1);                     %%COMANDO ATRIBUI A A_r TODAS AS LINHAS E COLUNAS DA MTRAIZ 1
A_g = A(: , : , 2);                     %%COMANDO ATRIBUI A A_g TODAS AS LINHAS E COLUNAS DA MTRAIZ 2
A_b = A(: , : , 3);                     %%COMANDO ATRIBUI A A_b TODAS AS LINHAS E COLUNAS DA MTRAIZ 3
%APLICANDO O MODELO BAYER
A_bayer = uint8(0.299*double(A_r)+0.587*double(A_g)+0.144*double(A_b));
%APLICANDO A FUNÇÃO RGB2GRAY
A_matlab = rgb2gray(A);
%CALCULANDO A DIFERENÇA ENTRE ELAS
A_dif = A_bayer - A_matlab;
%MOSTRANDO OS RESULTADOS
subplot(1,4,1,'align');
imshow(A)
title('LENNA RGB');
subplot(1,4,2,'align');
imshow(A_r)
title('LENNA RED BAND')
subplot(1,4,3,'align');
imshow(A_g)
title('LENNA GREEN BAND')
subplot(1,4,4,'align');
imshow(A_b)
title('LENNA BLUE BAND')
figure();
subplot(1,3,1);
imshow(A_matlab)
title('IMAGEM DO RGB2GRAY')
subplot(1,3,2);
imshow(A_bayer)
title('IMAGEM DO PADRAO BAYER')
subplot(1,3,3)
imshow(A_dif)
title('IMAGEM DA DIFERENÇA')
%FIM
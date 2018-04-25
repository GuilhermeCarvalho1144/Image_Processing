% % FUNÇÃO DO TOOLBOX DE PROCESSAMENTO DIGITAL DE IMAGENS. ESSA FUNÇÃO
% % TRANSLACIONA UMA IMAGEM A PARTIR DO PIXEL (0,0)...ESSA FUNÇÃO RECEBE COMO
% % PARAMETROS A IMAGEM A SER TRANSLACIONADA, A QUANTIDADE NO EIXO X E NO
% % EIXO Y QUE A MATRIZ SERÁ TRANSLACIONADA...ESSA FUNÇÃO RETORNA A MATRIZ JÁ
% % TRANSACIONADA COM AS MESMAS DIMENSÇOES DA MATRIZ ANTERIOR 
% % GUILHERME CARVALHO PEREIRA
%% INICIO
function Nimg = mytran(img,dx,dy)       %%CABEÇALHO DA FUNÇÃO
close all;                              
clc;
%% DEFININDO O TAMANHO DA MATRIZ DE SAIDA,,,SERÁ O MESMO DA ENTRADA
[lin , col] = size(img);
Nimg = zeros(lin , col);
%% DEFINE A MATRIZ DE TRANSLAÇÃO 
Trans = [1 0 dx
         0 1 dy
         0 0 1];
%% VARRENDO A MATRIZ
for i = 1 : lin
    for j = 1 : col
        Nponto = round (Trans  * [i , j ,1]');
        if Nponto(1) > 0 && Nponto(1)  <  lin && Nponto(2) > 0 &&Nponto (2) <  col  %%CASO O PIXEL ESTEJA NA BORDA DA IMAGEM
            Nimg(Nponto(1) , Nponto (2)) = img(i , j);
        end
    end
end
%% CONVERTENDO A MATRIZ PARA UINT8
Nimg = uint8(Nimg);
end
%% FIM
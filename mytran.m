% % FUN��O DO TOOLBOX DE PROCESSAMENTO DIGITAL DE IMAGENS. ESSA FUN��O
% % TRANSLACIONA UMA IMAGEM A PARTIR DO PIXEL (0,0)...ESSA FUN��O RECEBE COMO
% % PARAMETROS A IMAGEM A SER TRANSLACIONADA, A QUANTIDADE NO EIXO X E NO
% % EIXO Y QUE A MATRIZ SER� TRANSLACIONADA...ESSA FUN��O RETORNA A MATRIZ J�
% % TRANSACIONADA COM AS MESMAS DIMENS�OES DA MATRIZ ANTERIOR 
% % GUILHERME CARVALHO PEREIRA
%% INICIO
function Nimg = mytran(img,dx,dy)       %%CABE�ALHO DA FUN��O
close all;                              
clc;
%% DEFININDO O TAMANHO DA MATRIZ DE SAIDA,,,SER� O MESMO DA ENTRADA
[lin , col] = size(img);
Nimg = zeros(lin , col);
%% DEFINE A MATRIZ DE TRANSLA��O 
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
% % FUN��O DO TOOLBOX DE PROCESSAMENTO DIGITAL DE IMAGENS. ESSA FUN��O
% APLICA A TRANSFORMA��O DE SHEARING (CISALHAMENTO) NA IMAGEM....ESSA
% FUN��O RECEBE COMO PARAMETROS A IMAGEM EM QUE SER� APLICADA A
% TRANSFORMA��O E OS PARAMETROS VERTICAIS E HORIZONTAIS PARA QUE A MATRIZ
% DE TRANSFOMA��O SEJA DEFINIDA...A FUN��O RETORNA A IMAGEM AP�S APLICADA A
% TRANSFORMA��O, A IMAGEM RETORNADA TEM O MESMO TAMANHO DA IMAGEM ORIGINAL
% %GUILHERME CARVALHO PEREIRA
%% INICIO
function Nimg = myshearing(img,sh,sv)       %%CABE�ALHO DA FUN��O
close all;                              
clc;
%% DEFININDO O TAMNHO DA MATRIZ DE SAIDA..SER� O MESMO DA ENTRADA
[lin , col] = size (img);
Nimg = zeros(lin,col);
%% MATRIZ DE TRANSFORMA��O
Trans = [1  sh  0
         sv  1  0
         0   0  1];
     
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
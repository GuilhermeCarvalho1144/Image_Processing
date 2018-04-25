% % FUNÇÃO DO TOOLBOX DE PROCESSAMENTO DIGITAL DE IMAGENS. ESSA FUNÇÃO
% APLICA A TRANSFORMAÇÃO DE SHEARING (CISALHAMENTO) NA IMAGEM....ESSA
% FUNÇÃO RECEBE COMO PARAMETROS A IMAGEM EM QUE SERÁ APLICADA A
% TRANSFORMAÇÃO E OS PARAMETROS VERTICAIS E HORIZONTAIS PARA QUE A MATRIZ
% DE TRANSFOMAÇÃO SEJA DEFINIDA...A FUNÇÃO RETORNA A IMAGEM APÓS APLICADA A
% TRANSFORMAÇÃO, A IMAGEM RETORNADA TEM O MESMO TAMANHO DA IMAGEM ORIGINAL
% %GUILHERME CARVALHO PEREIRA
%% INICIO
function Nimg = myshearing(img,sh,sv)       %%CABEÇALHO DA FUNÇÃO
close all;                              
clc;
%% DEFININDO O TAMNHO DA MATRIZ DE SAIDA..SERÁ O MESMO DA ENTRADA
[lin , col] = size (img);
Nimg = zeros(lin,col);
%% MATRIZ DE TRANSFORMAÇÃO
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
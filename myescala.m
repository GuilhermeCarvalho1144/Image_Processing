% % FUNÇÃO DO TOOLBOX DE PROCESSAMENTO DIGITAL DE IMAGENS. ESSA FUNÇÃO
% %ALTERA A ESCALA DA IMAGEM APLICANDO UMA MATRIZ DE TRANSFORMAÇÃO...A
% %FUNÇÃO RECEBE COMO PARAMETROS A IMAGEM QUE SERÁ ALTERADA, E OS VALORES DE
% %X E Y QUE DEFINIRAM A MATRIZ DE TRANSFORMAÇÃO...A FUNÇÃO TEM COMO SAIDA
% %UMA IMAGEM COM A ESCALA ALTERADA E COM O MESMO TAMANHO DA IMAGEM ORIGINAL
% %GUILHERME CARVALHO PEREIRA
%% INICIO
function Nimg = myescala(img,sx,sy)       %%CABEÇALHO DA FUNÇÃO
close all;                              
clc;
%% DEFININDO O TAMNHO DA MATRIZ DE SAIDA..SERÁ O MESMO DA ENTRADA
[lin , col] = size (img);
Nimg = zeros(lin,col);
%% MATRIZ DE TRANSFORMAÇÃO
Trans = [sx  0  0
         0  sy  0
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
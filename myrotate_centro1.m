% % FUNÇÃO DO TOOLBOX DE PROCESSAMENTO DIGITAL DE IMAGENS. ESSA FUNÇÃO
% % ROTACIONA UMA MATRIZ CO EIXO Z COM O CENTRO DE ROTAÇÃO NO PIXEL CENTRAL
% % DA IMAGEM...ELA RECEBE COMO PARAMENTROS A IMAGEM A SER ROTACIONADA E O
% % ANGULO DE ROTAÇÃO EM GRAUS... TEM COMO RETORNO A IMAGEM JA
% % ROTACIONADA COM AS MESMAS DIMENSÕES DA IMAGEM ORIGINAL
% % GUILHERME CARVALHO PEREIRA
%% INICIO
function Nimg = myrotate_centro1(img,ang)       %%CABEÇALHO DA FUNÇÃO
close all;
clc;
%% DEFININDO O TAMANHO DA IMAGEM DE SAIDA.....SERÁ O MESMO DA IMAGEM DE
%ENTRADA
[lin , col] = size(img);
Nimg = zeros(lin , col);
%% DEFINE A MATRIZES DE ROTAÇÃO
Trans_rot = [ cosd(ang) -sind(ang) 0;
          sind(ang) cosd(ang)  0;
              0         0      1]; %%ROTAÇÃO ENTORNO DO EIXO Z
Trans = [1 0 floor(lin/2)          %%FUNÇÃO FLOOR APROXIMA O NUMERO PARA O MENOR INTEIRO MAIS PROXIMO
         0 1 floor(col/2)
         0 0           1];         %%TRANSLAÇÃO DO PIXEL (0,0) PARA O PIXEL CENTRAL
Trans_inv = [1 0 -floor(lin/2)
             0 1 -floor(col/2)
             0 0            1];    %%TRANSLAÇÃO DO PIXEL CENTRAL PARA O PICEL (0,0)
%% VARRENDO A MATRIX
for i = 1 : lin
    for j = 1 : col
        Nponto = round (Trans * Trans_rot * Trans_inv   * [i , j ,1]');
        if Nponto(1) > 0 && Nponto(1)  <  lin && Nponto(2) > 0 &&Nponto (2) <  col  %%CASO O PIXEL ESTEJA NA BORDA DA IMAGEM
            Nimg(Nponto(1) , Nponto (2)) = img(i , j);
        end
    end
end
%% CONVERTENDO A MATRIZ PARA UINT8
Nimg = uint8(Nimg);
end
%FIM


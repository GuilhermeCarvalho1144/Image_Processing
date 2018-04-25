% % FUN��O DO TOOLBOX DE PROCESSAMENTO DIGITAL DE IMAGENS. ESSA FUN��O
% % ROTACIONA UMA MATRIZ CO EIXO Z COM O CENTRO DE ROTA��O NO PIXEL CENTRAL
% % DA IMAGEM...ELA RECEBE COMO PARAMENTROS A IMAGEM A SER ROTACIONADA E O
% % ANGULO DE ROTA��O EM GRAUS... TEM COMO RETORNO A IMAGEM JA
% % ROTACIONADA � MAIOR QUE A IMAGEM ORIGINAL (N�O H� CORTES)
% % GUILHERME CARVALHO PEREIRA
%% INICIO
function Nimg = myrotate_centro2(img,ang)       %%CABE�ALHO DA FUN��O
close all;
clc;
%% DEFININDO O TAMANHO DA IMAGEM DE SAIDA.....SER� MAIOR QUE A IMAGEM ORIGINAL (N�O H� CORTES)
[lin , col] = size(img);
col2 = round(sqrt(lin^2 + col^2));
lin2 = col2;
Nimg = zeros(lin2 , col2);
%% DEFINE A MATRIZES DE ROTA��O
Trans_rot = [ cosd(ang) -sind(ang) 0;
          sind(ang) cosd(ang)  0;
              0         0      1]; %%ROTA��O ENTORNO DO EIXO Z
Trans = [1 0 floor(lin2/2)          %%FUN��O FLOOR APROXIMA O NUMERO PARA O MENOR INTEIRO MAIS PROXIMO
         0 1 floor(col2/2)
         0 0           1];         %%TRANSLA��O DO PIXEL (0,0) PARA O PIXEL CENTRAL
Trans_inv = [1 0 -floor(lin/2)
             0 1 -floor(col/2)
             0 0            1];    %%TRANSLA��O DO PIXEL CENTRAL PARA O PICEL (0,0)
%% VARRENDO A MATRIX
for i = 1 : lin
    for j = 1 : col
        Nponto = round (Trans * Trans_rot * Trans_inv   * [i , j ,1]');
        if Nponto(1) > 0 && Nponto(1)  <  lin2 && Nponto(2) > 0 &&Nponto (2) <  col2  %%CASO O PIXEL ESTEJA NA BORDA DA IMAGEM
            Nimg(Nponto(1) , Nponto (2)) = img(i , j);
        end
    end
end
%% CONVERTENDO A MATRIZ PARA UINT8
Nimg = uint8(Nimg);
end
%FIM


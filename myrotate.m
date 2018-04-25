% % FUN��O DO TOOLBOX DE PROCESSAMENTO DIGITAL DE IMAGENS. ESSA FUN��O
% % ROTACIONA UMA MATRIZ CO EIXO Z COM O CENTRO DE ROTA��O NO PIXEL
% % [0,0]...ELA RECEBE COMO PARAMENTROS A IMAGEM A SER ROTACIONADA E O ANGULO
% % DE ROTA��O EM GRAUS... TEM COMO RETORNO A IMAGEM JA ROTACIONADA COM AS
% % MESMAS DIMENS�ES DA IMAGEM ORIGINAL 
% % GUILHERME CARVALHO PEREIRA
%% INICIO
function Nimg = myrotate(img,ang)       %%CABE�ALHO DA FUN��O
close all;
clc;
%% DEFININDO O TAMANHO DA IMAGEM DE SAIDA.....SER� O MESMO DA IMAGEM DE
%ENTRADA
[lin , col] = size(img);
Nimg = zeros(lin , col);
%% DEFINE A MATRIZ DE ROTA��O
Trans = [ cosd(ang) -sind(ang) 0;
          sind(ang) cosd(ang)  0;
              0         0      1]; %%ROTA��O ENTORNO DO EIXO Z
%% VARRENDO A MATRIX
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
%FIM
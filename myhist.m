% % FUN��O DO TOOLBOX DE PROCESSAMENTO DIGITAL DE IMAGENS. ESSA FUN��O RECE
% % COMO PARAMETRO UMA IMAGEM, SEJA ELA RGB OU EM TONS DE CINZA (SE FOR
% % RGB CONVERTE PARA TONS DE CINZA USANDO "RGB2GRAY")...A FUN��O RETORNA 
% % O HISTOGRAMA NORMALIZADO E O HISTORGRAMA CALCULADO PELA FUN��O "IMHIST"
% % DO MATLAB 
% % GUILHERME CARVALHO PEREIRA
%% INICIO
function imgh = myhist(img)         %%CABE�ALHO DA FUN��O
close all;                          %%FECHA TODAS AS JANELAS
clc;                                %%LIMPA O PROMPT DE COMANDO
%% CALCULOS
[lin , col , z] = size(img);        %%VERIFICA O TAMANHO DA IMAGEM
if(z ~= 1)                          %%SE A IMAGEM FOR RGB CONVERTE PARA TONS DE CINZA
    img = rgb2gray(img);
    imgh = img;
end
    imghist = zeros(1 , 256);       %%VETOR DO HISTOGRAMA
    for i = 1 : lin                 %%CALCULO DO HISTOGRAMA
        for j  = 1 : col
            imghist(img(i , j)+1) = imghist(img(i , j)+1)+1;
        end
    end
    imghist = (imghist) / max(imghist); %%NORMALIZA A IMAEGM
    imgh=imghist;
end

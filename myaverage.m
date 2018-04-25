% % FUNÇÃO DO TOOLBOX DE PROCESSAMENTO DIGITAL DE IMAGENS. ESSA FUNÇÃO
% % CRIA UMA MASCARA MEDIA (USANDO A FUNÇÃO FSPECIAL), O TAMNHO DA MASCARA
% % PODE SER DEFINIDA PELO PRAMETRO K, 1 PARA UMA MASCARA 3x3 E 2 PARA UMA
% % MASCARA %5x5. ESSA FUNÇÃO UTILIZA O IMFILTER PARA APLICAR A MASCARA A
% % IMAGEM UTILIZANDO O PARAMETRO SAME...FUNÇÃO AINDA EM CONTRUÇÃO
% % GUILHERME CARVALHO PEREIRA
%% INICIO
function Nimg = myaverage(img,k)       %%CABEÇALHO DA FUNÇÃO
close all;                              
clc;
%% DEFININDO A MASCARA
if k == 1 
    Mask = fspecial('average');
end
if k == 2
    Mask = fspecial('average' , [5 5] );
end
%% APLICANDO A MASCARA A MATRIZ
Nimg = imfilter (img , Mask , 'same');
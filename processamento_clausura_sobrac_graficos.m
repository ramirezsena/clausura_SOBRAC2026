clearvars; close all; clc;
%% 0.1 Carregamento dos dados
F1_mic1_branco = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_branco\Lp_terco_mic1.mat');
F1_mic2_branco = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_branco\Lp_terco_mic2.mat');
F1_mic3_branco = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_branco\Lp_terco_mic3.mat');
F2_mic1_branco = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_branco\Lp_terco_mic1.mat');
F2_mic2_branco = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_branco\Lp_terco_mic2.mat');
F2_mic3_branco = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_branco\Lp_terco_mic3.mat');

F1_mic1_rosa = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_rosa\Lp_terco_mic1.mat');
F1_mic2_rosa = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_rosa\Lp_terco_mic2.mat');
F1_mic3_rosa = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_rosa\Lp_terco_mic3.mat');
F2_mic1_rosa = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_rosa\Lp_terco_mic1.mat');
F2_mic2_rosa = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_rosa\Lp_terco_mic2.mat');
F2_mic3_rosa = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_rosa\Lp_terco_mic3.mat');

F1_mic1_branco_clausura = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_branco_clausura\Lp_terco_mic1.mat');
F1_mic2_branco_clausura = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_branco_clausura\Lp_terco_mic2.mat');
F1_mic3_branco_clausura = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_branco_clausura\Lp_terco_mic3.mat');
F2_mic1_branco_clausura = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_branco_clausura\Lp_terco_mic1.mat');
F2_mic2_branco_clausura = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_branco_clausura\Lp_terco_mic2.mat');
F2_mic3_branco_clausura = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_branco_clausura\Lp_terco_mic3.mat');

F1_mic1_rosa_clausura = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_rosa_clausura\Lp_terco_mic1.mat');
F1_mic2_rosa_clausura = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_rosa_clausura\Lp_terco_mic2.mat');
F1_mic3_rosa_clausura = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_rosa_clausura\Lp_terco_mic3.mat');
F2_mic1_rosa_clausura = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_rosa_clausura\Lp_terco_mic1.mat');
F2_mic2_rosa_clausura = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_rosa_clausura\Lp_terco_mic2.mat');
F2_mic3_rosa_clausura = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_rosa_clausura\Lp_terco_mic3.mat');

F1_mic1_branco_clausura_material = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_branco_clausura_material\Lp_terco_mic1.mat');
F1_mic2_branco_clausura_material = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_branco_clausura_material\Lp_terco_mic2.mat');
F1_mic3_branco_clausura_material = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_branco_clausura_material\Lp_terco_mic3.mat');
F2_mic1_branco_clausura_material = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_branco_clausura_material\Lp_terco_mic1.mat');
F2_mic2_branco_clausura_material = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_branco_clausura_material\Lp_terco_mic2.mat');
F2_mic3_branco_clausura_material = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_branco_clausura_material\Lp_terco_mic3.mat');

F1_mic1_rosa_clausura_material = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_rosa_clausura_material\Lp_terco_mic1.mat');
F1_mic2_rosa_clausura_material = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_rosa_clausura_material\Lp_terco_mic2.mat');
F1_mic3_rosa_clausura_material = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_rosa_clausura_material\Lp_terco_mic3.mat');
F2_mic1_rosa_clausura_material = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_rosa_clausura_material\Lp_terco_mic1.mat');
F2_mic2_rosa_clausura_material = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_rosa_clausura_material\Lp_terco_mic2.mat');
F2_mic3_rosa_clausura_material = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_rosa_clausura_material\Lp_terco_mic3.mat');

F1_mic1_branco_clausura_material_membrana = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_branco_clausura_material_membrana\Lp_terco_mic1.mat');
F1_mic2_branco_clausura_material_membrana = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_branco_clausura_material_membrana\Lp_terco_mic2.mat');
F1_mic3_branco_clausura_material_membrana = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_branco_clausura_material_membrana\Lp_terco_mic3.mat');
F2_mic1_branco_clausura_material_membrana = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_branco_clausura_material_membrana\Lp_terco_mic1.mat');
F2_mic2_branco_clausura_material_membrana = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_branco_clausura_material_membrana\Lp_terco_mic2.mat');
F2_mic3_branco_clausura_material_membrana = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_branco_clausura_material_membrana\Lp_terco_mic3.mat');

F1_mic1_rosa_clausura_material_membrana = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_rosa_clausura_material_membrana\Lp_terco_mic1.mat');
F1_mic2_rosa_clausura_material_membrana = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_rosa_clausura_material_membrana\Lp_terco_mic2.mat');
F1_mic3_rosa_clausura_material_membrana = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_rosa_clausura_material_membrana\Lp_terco_mic3.mat');
F2_mic1_rosa_clausura_material_membrana = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_rosa_clausura_material_membrana\Lp_terco_mic1.mat');
F2_mic2_rosa_clausura_material_membrana = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_rosa_clausura_material_membrana\Lp_terco_mic2.mat');
F2_mic3_rosa_clausura_material_membrana = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F2_rosa_clausura_material_membrana\Lp_terco_mic3.mat');

freq = load('C:\Users\Ramirez\Documents\MATLAB\CONTROLE_RUIDO_MATLAB\codigo_alunos_medicao\codigo_alunos_medicao\figuras_F1_branco\f_terco.mat');

%% 0.2 Carregamento de cores
azul = [0.00 0.32 0.60];
ciano = [0.00 0.60 0.75];
verde = [0.20 0.55 0.35];
laranja = [0.90 0.45 0.10];
cinza = [0.35 0.35 0.35];
roxo = [0.45 0.25 0.65];
roxo_claro = [0.85 0.80 0.78];

azul_escuro = [0.00 0.25 0.50];
azul_medio  = [0.00 0.45 0.74];
azul_claro  = [0.40 0.75 0.95];

branco_claro  = [1.00 1.00 1.00];
branco_medio  = [0.90 0.90 0.90];
branco_escuro  = [0.75 0.75 0.75];

rosa_escuro = [0.55 0.05 0.25];
rosa_medio  = [0.90 0.25 0.55];
rosa_claro  = [1.00 0.65 0.78];

rotulos_freq = {'12,5','16','20','25','31,5','40','50','63','80','100', ...
                '125','160','200','250','315','400','500','630','800','1000', ...
                '1250','1600','2000','2500','3150','4000','5000','6300', ...
                '8000','10000','12500','16000','20000'};
limites = [-10 10];
%% 1. Ruído Branco - sem clausura
%% 1.1 Fonte 1
grafico3BarrasMedia(F1_mic1_branco.Lp_terco_mic1(:),F1_mic2_branco.Lp_terco_mic2(:),F1_mic3_branco.Lp_terco_mic3(:),'Nível de Pressão Sonora - Ruído Branco sem Clausura - Fonte 1','branco',limites);

%% 1.2 Fonte 2
grafico3BarrasMedia(F2_mic1_branco.Lp_terco_mic1(:),F2_mic2_branco.Lp_terco_mic2(:),F2_mic3_branco.Lp_terco_mic3(:),'Nível de Pressão Sonora - Ruído Branco sem Clausura - Fonte 2','branco',limites);

%% 2. Ruído Rosa - sem clausura
%% 2.1 Fonte 1
grafico3BarrasMedia(F1_mic1_rosa.Lp_terco_mic1(:),F1_mic2_rosa.Lp_terco_mic2(:),F1_mic3_rosa.Lp_terco_mic3(:),'Nível de Pressão Sonora - Ruído Rosa sem Clausura - Fonte 1','rosa',limites);

%% 2.2 Fonte 2
grafico3BarrasMedia(F2_mic1_rosa.Lp_terco_mic1(:),F2_mic2_rosa.Lp_terco_mic2(:),F2_mic3_rosa.Lp_terco_mic3(:),'Nível de Pressão Sonora - Ruído Rosa sem Clausura - Fonte 2','rosa',limites);

%% 3. Ruído Branco - com clausura
%% 3.1 Fonte 1
grafico3BarrasMedia(F1_mic1_branco_clausura.Lp_terco_mic1(:),F1_mic2_branco_clausura.Lp_terco_mic2(:),F1_mic3_branco_clausura.Lp_terco_mic3(:),'Nível de Pressão Sonora - Ruído Branco com Clausura - Fonte 1','branco',limites);

%% 3.2 Fonte 2
grafico3BarrasMedia(F2_mic1_branco_clausura.Lp_terco_mic1(:),F2_mic2_branco_clausura.Lp_terco_mic2(:),F2_mic3_branco_clausura.Lp_terco_mic3(:),'Nível de Pressão Sonora - Ruído Branco com Clausura - Fonte 2','branco',limites);

%% 4. Ruído Rosa - com clausura
%% 4.1 Fonte 1
grafico3BarrasMedia(F1_mic1_rosa_clausura.Lp_terco_mic1(:),F1_mic2_rosa_clausura.Lp_terco_mic2(:),F1_mic3_rosa_clausura.Lp_terco_mic3(:),'Nível de Pressão Sonora - Ruído Rosa com Clausura - Fonte 1','rosa',limites);

%% 4.2 Fonte 2
grafico3BarrasMedia(F2_mic1_rosa_clausura.Lp_terco_mic1(:),F2_mic2_rosa_clausura.Lp_terco_mic2(:),F2_mic3_rosa_clausura.Lp_terco_mic3(:),'Nível de Pressão Sonora - Ruído Rosa com Clausura - Fonte 2','rosa',limites);

%% 5. Ruído Branco - com clausura e com material
%% 5.1 Fonte 1
grafico3BarrasMedia(F1_mic1_branco_clausura_material.Lp_terco_mic1(:),F1_mic2_branco_clausura_material.Lp_terco_mic2(:),F1_mic3_branco_clausura_material.Lp_terco_mic3(:),'Nível de Pressão Sonora - Ruído Branco com Clausura e com Material - Fonte 1','branco',limites);

%% 5.2 Fonte 2
grafico3BarrasMedia(F2_mic1_branco_clausura_material.Lp_terco_mic1(:),F2_mic2_branco_clausura_material.Lp_terco_mic2(:),F2_mic3_branco_clausura_material.Lp_terco_mic3(:),'Nível de Pressão Sonora - Ruído Branco com Clausura e com Material - Fonte 2','branco',limites);

%% 6. Ruído Rosa - com clausura e com material
%% 6.1 Fonte 1
grafico3BarrasMedia(F1_mic1_rosa_clausura_material.Lp_terco_mic1(:),F1_mic2_rosa_clausura_material.Lp_terco_mic2(:),F1_mic3_rosa_clausura_material.Lp_terco_mic3(:),'Nível de Pressão Sonora - Ruído Rosa com Clausura e com Material - Fonte 1','rosa',limites);

%% 6.2 Fonte 2
grafico3BarrasMedia(F2_mic1_rosa_clausura_material.Lp_terco_mic1(:),F2_mic2_rosa_clausura_material.Lp_terco_mic2(:),F2_mic3_rosa_clausura_material.Lp_terco_mic3(:),'Nível de Pressão Sonora - Ruído Rosa com Clausura e com Material - Fonte 2','rosa',limites);



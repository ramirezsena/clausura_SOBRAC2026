%{ 
Código de cálculo de potência sonora segundo a norma ISO 3741 utilizando o
método direto

Autores: Luiz Ramirez
         Jóshua Paiva Matos Cordeiro

Última atualização: 
%}

%% Limpeza
clear; clc; close all

%% 0.1 Carregamento dos dados
F1_mic1_branco = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_branco\Lp_terco_mic1.mat');
F1_mic2_branco = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_branco\Lp_terco_mic2.mat');
F1_mic3_branco = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_branco\Lp_terco_mic3.mat');
F2_mic1_branco = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_branco\Lp_terco_mic1.mat');
F2_mic2_branco = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_branco\Lp_terco_mic2.mat');
F2_mic3_branco = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_branco\Lp_terco_mic3.mat');

F1_mic1_rosa = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_rosa\Lp_terco_mic1.mat');
F1_mic2_rosa = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_rosa\Lp_terco_mic2.mat');
F1_mic3_rosa = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_rosa\Lp_terco_mic3.mat');
F2_mic1_rosa = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_rosa\Lp_terco_mic1.mat');
F2_mic2_rosa = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_rosa\Lp_terco_mic2.mat');
F2_mic3_rosa = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_rosa\Lp_terco_mic3.mat');

F1_mic1_branco_clausura = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_branco_clausura\Lp_terco_mic1.mat');
F1_mic2_branco_clausura = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_branco_clausura\Lp_terco_mic2.mat');
F1_mic3_branco_clausura = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_branco_clausura\Lp_terco_mic3.mat');
F2_mic1_branco_clausura = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_branco_clausura\Lp_terco_mic1.mat');
F2_mic2_branco_clausura = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_branco_clausura\Lp_terco_mic2.mat');
F2_mic3_branco_clausura = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_branco_clausura\Lp_terco_mic3.mat');

F1_mic1_rosa_clausura = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_rosa_clausura\Lp_terco_mic1.mat');
F1_mic2_rosa_clausura = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_rosa_clausura\Lp_terco_mic2.mat');
F1_mic3_rosa_clausura = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_rosa_clausura\Lp_terco_mic3.mat');
F2_mic1_rosa_clausura = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_rosa_clausura\Lp_terco_mic1.mat');
F2_mic2_rosa_clausura = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_rosa_clausura\Lp_terco_mic2.mat');
F2_mic3_rosa_clausura = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_rosa_clausura\Lp_terco_mic3.mat');

F1_mic1_branco_clausura_material = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_branco_clausura_material\Lp_terco_mic1.mat');
F1_mic2_branco_clausura_material = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_branco_clausura_material\Lp_terco_mic2.mat');
F1_mic3_branco_clausura_material = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_branco_clausura_material\Lp_terco_mic3.mat');
F2_mic1_branco_clausura_material = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_branco_clausura_material\Lp_terco_mic1.mat');
F2_mic2_branco_clausura_material = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_branco_clausura_material\Lp_terco_mic2.mat');
F2_mic3_branco_clausura_material = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_branco_clausura_material\Lp_terco_mic3.mat');

F1_mic1_rosa_clausura_material = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_rosa_clausura_material\Lp_terco_mic1.mat');
F1_mic2_rosa_clausura_material = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_rosa_clausura_material\Lp_terco_mic2.mat');
F1_mic3_rosa_clausura_material = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_rosa_clausura_material\Lp_terco_mic3.mat');
F2_mic1_rosa_clausura_material = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_rosa_clausura_material\Lp_terco_mic1.mat');
F2_mic2_rosa_clausura_material = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_rosa_clausura_material\Lp_terco_mic2.mat');
F2_mic3_rosa_clausura_material = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_rosa_clausura_material\Lp_terco_mic3.mat');

mic1_residual_inicial = load("C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_residual_inicial\Lp_terco_mic1.mat");
mic2_residual_inicial = load("C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_residual_inicial\Lp_terco_mic2.mat");
mic3_residual_inicial = load("C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_residual_inicial\Lp_terco_mic3.mat");

mic1_residual_final = load("C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_residual_final\Lp_terco_mic1.mat");
mic2_residual_final = load("C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_residual_final\Lp_terco_mic2.mat");
mic3_residual_final = load("C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_residual_final\Lp_terco_mic3.mat");

freq = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_branco\f_terco.mat');

%% 0.2 Carregamento de cores
azul = [0.00 0.32 0.60];
ciano = [0.00 0.60 0.75];
verde = [0.20 0.55 0.35];
laranja = [0.90 0.45 0.10];
cinza = [0.35 0.35 0.35];
roxo = [0.45 0.25 0.65];

rotulos_freq = {'12,5','16','20','25','31,5','40','50','63','80','100', ...
                '125','160','200','250','315','400','500','630','800','1 k', ...
                '1,25 k','1,6 k','2 k','2,5 k','3,15 k','4 k','5 k','6,3 k', ...
                '8 k','10 k','12,5 k','16 k','20 k'};

%% Velocidade do som
gama = 1.4; % [-]: coeficiente de expansão adiabática do ar
R_ar = 287; % [J/(kgK)]: constante do ar
T = 13.5; % [°C]: temperatura do ar

c = 20.05*sqrt(273+T); % [m/s]: velocidade do som pela norma 
% c = sqrt(gama*R_ar*(273.15+T)); % [m/s]: velocidade do som ideal
% c_ideal = 331.2 + 0.6*T; % [m/s]: velocidade do som aproximada p/ temperaturas de 0° a 40°

%% Testes de distâncias para estarmos de acordo com a ISO 3741

% Distência entre as fontes
d_F1_F2 = 2.948; % [m]: distância entre as fontes
f_min = 100;
d_min_F1_F2 = 0.5 * (c/f_min);
disp(['A distância mínima entre fontes deve ser ', num2str(d_min_F1_F2),' m.'])
disp(['A distância entre as fontes nas medições foi ', num2str(d_F1_F2),' m.'])

% Distância entre o microfone e a fonte
D1 = 0.16; % constante para frequências abaixo de 5000 Hz
V_cam = 207; % [m³]: volume da câmara reverberante (198,8 m³)
T60_cam_rev = load('T60_cam_rev.mat'); % [s]: tempo de reverberação por banda da câmara reverberante

%% Plot do T60 da câmara (dados das medições do exp. 2 de MEAV - Medição de TR em câmara reverberante)
figure('Position',[50 50 900 500])
bar(T60_cam_rev.T60_total)
xticks(1:length(T60_cam_rev.fc))
xticklabels(rotulos_freq(10:30))
title('{\itT}_{20} médio da câmara reverberante')
ylabel('Tempo de reverberação, {\itT}_{20} [s]')
xlabel('Frequência [Hz]')
grid on
arruma_fig('no','% 2.1f','virgula')
set(gca,'Fontsize',14)

%% Plot das distâncias mínimas
d_min_M_F = D1*sqrt(V_cam./T60_cam_rev.T60_total); % [m]: distância mínima entre o mic e a fonte

figure('Position',[50 50 900 500])
bar(d_min_M_F)
xticks(1:length(d_min_M_F))
xticklabels(rotulos_freq(10:30))
title('Distância mínima entre mics e fonte: Atendemos!')
ylabel('Distância [m]')
xlabel('Frequência [Hz]')
grid on
arruma_fig('no','% 2.1f','virgula')
set(gca,'Fontsize',14)

%% Correção do ruído residual

d_Lpi = F1_mic1_branco;

%% Plots do ruído residual
residual_terco_inicial = [mic1_residual_inicial.Lp_terco_mic1(:), mic2_residual_inicial.Lp_terco_mic2(:), mic3_residual_inicial.Lp_terco_mic3(:)];
residual_terco_inicial_media = 10*log10( (1/3) .* ( 10.^(mic1_residual_inicial.Lp_terco_mic1(:)./10) + 10.^(mic1_residual_inicial.Lp_terco_mic1(:)./10) + 10.^(mic1_residual_inicial.Lp_terco_mic1(:)./10) ) );

residual_terco_final = [mic1_residual_final.Lp_terco_mic1(:), mic2_residual_final.Lp_terco_mic2(:), mic3_residual_final.Lp_terco_mic3(:)];
residual_terco_final_media = 10*log10( (1/3) .* ( 10.^(mic1_residual_final.Lp_terco_mic1(:)./10) + 10.^(mic1_residual_final.Lp_terco_mic1(:)./10) + 10.^(mic1_residual_final.Lp_terco_mic1(:)./10) ) );

residual_terco_media = [residual_terco_inicial_media(:), residual_terco_final_media(:)];
residual_terco_todas = [residual_terco_inicial residual_terco_final];

figure('Position',[50 50 900 500]);
residual_terco = bar(residual_terco_media);
% residual_terco = bar(residual_terco_todas);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

set(gca,'XScale','linear')
set(gca,'FontSize',13)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Residual inicial','Residual final','Location','northeast')


%% 1. Ruído Branco - sem clausura

%% 1.1.4 Microfones 1, 2 e 3
F1_mics_terco_branco = [F1_mic1_branco.Lp_terco_mic1(:), F1_mic2_branco.Lp_terco_mic2(:), F1_mic3_branco.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F1_mics_terco_branco = bar(F1_mics_terco_branco);
plot_F1_mics_terco_branco(1).FaceColor = azul;
plot_F1_mics_terco_branco(2).FaceColor = laranja;
plot_F1_mics_terco_branco(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco sem Clausura - Fonte 1 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',13)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 1.2.4 Microfones 1, 2 e 3
F2_mics_terco_branco = [F2_mic1_branco.Lp_terco_mic1(:), F2_mic2_branco.Lp_terco_mic2(:), F2_mic3_branco.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F2_mics_terco_branco = bar(F2_mics_terco_branco);
plot_F2_mics_terco_branco(1).FaceColor = azul;
plot_F2_mics_terco_branco(2).FaceColor = laranja;
plot_F2_mics_terco_branco(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco sem Clausura - Fonte 2 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',13)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 2. Ruído Rosa - sem clausura

%% 2.1 Fonte 1

%% 2.1.4 Microfones 1, 2 e 3
F1_mics_terco_rosa = [F1_mic1_rosa.Lp_terco_mic1(:), F1_mic2_rosa.Lp_terco_mic2(:), F1_mic3_rosa.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F1_mics_terco_rosa = bar(F1_mics_terco_rosa);
plot_F1_mics_terco_rosa(1).FaceColor = azul;
plot_F1_mics_terco_rosa(2).FaceColor = laranja;
plot_F1_mics_terco_rosa(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa sem Clausura - Fonte 1 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',13)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 2.2 Fonte 2

%% 2.2.4 Microfones 1, 2 e 3
F2_mics_terco_rosa = [F2_mic1_rosa.Lp_terco_mic1(:), F2_mic2_rosa.Lp_terco_mic2(:), F2_mic3_rosa.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F2_mics_terco_rosa = bar(F2_mics_terco_rosa);
plot_F2_mics_terco_rosa(1).FaceColor = azul;
plot_F2_mics_terco_rosa(2).FaceColor = laranja;
plot_F2_mics_terco_rosa(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa sem Clausura - Fonte 2 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',13)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 3. Ruído Branco - com clausura

%% 3.1 Fonte 1

%% 3.1.4 Microfones 1, 2 e 3
F1_mics_terco_branco_clausura = [F1_mic1_branco_clausura.Lp_terco_mic1(:), F1_mic2_branco_clausura.Lp_terco_mic2(:), F1_mic3_branco_clausura.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F1_mics_terco_branco_clausura = bar(F1_mics_terco_branco_clausura);
plot_F1_mics_terco_branco_clausura(1).FaceColor = azul;
plot_F1_mics_terco_branco_clausura(2).FaceColor = laranja;
plot_F1_mics_terco_branco_clausura(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura - Fonte 1 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',13)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 3.2 Fonte 2

%% 3.2.4 Microfones 1, 2 e 3
F2_mics_terco_branco_clausura = [F2_mic1_branco_clausura.Lp_terco_mic1(:), F2_mic2_branco_clausura.Lp_terco_mic2(:), F2_mic3_branco_clausura.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F2_mics_terco_branco_clausura = bar(F2_mics_terco_branco_clausura);
plot_F2_mics_terco_branco_clausura(1).FaceColor = azul;
plot_F2_mics_terco_branco_clausura(2).FaceColor = laranja;
plot_F2_mics_terco_branco_clausura(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura - Fonte 2 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',13)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 4. Ruído Rosa - com clausura

%% 4.1 Fonte 1

%% 4.1.4 Microfones 1, 2 e 3
F1_mics_terco_rosa_clausura = [F1_mic1_rosa_clausura.Lp_terco_mic1(:), F1_mic2_rosa_clausura.Lp_terco_mic2(:), F1_mic3_rosa_clausura.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F1_mics_terco_rosa_clausura = bar(F1_mics_terco_rosa_clausura);
plot_F1_mics_terco_rosa_clausura(1).FaceColor = azul;
plot_F1_mics_terco_rosa_clausura(2).FaceColor = laranja;
plot_F1_mics_terco_rosa_clausura(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura - Fonte 1 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',13)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 4.2 Fonte 2

%% 4.2.4 Microfones 1, 2 e 3
F2_mics_terco_rosa_clausura = [F2_mic1_rosa_clausura.Lp_terco_mic1(:), F2_mic2_rosa_clausura.Lp_terco_mic2(:), F2_mic3_rosa_clausura.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F2_mics_terco_rosa_clausura = bar(F2_mics_terco_rosa_clausura);
plot_F2_mics_terco_rosa_clausura(1).FaceColor = azul;
plot_F2_mics_terco_rosa_clausura(2).FaceColor = laranja;
plot_F2_mics_terco_rosa_clausura(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura - Fonte 2 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',13)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 5. Ruído Branco - com clausura e com material

%% 5.1 Fonte 1

%% 5.1.4 Microfones 1, 2 e 3
F1_mics_terco_branco_clausura_material = [F1_mic1_branco_clausura_material.Lp_terco_mic1(:), F1_mic2_branco_clausura_material.Lp_terco_mic2(:), F1_mic3_branco_clausura_material.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F1_mics_terco_branco_clausura_material = bar(F1_mics_terco_branco_clausura_material);
plot_F1_mics_terco_branco_clausura_material(1).FaceColor = azul;
plot_F1_mics_terco_branco_clausura_material(2).FaceColor = laranja;
plot_F1_mics_terco_branco_clausura_material(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura e com Material - Fonte 1 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',13)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 5.2 Fonte 2

%% 5.2.4 Microfones 1, 2 e 3
F2_mics_terco_branco_clausura_material = [F2_mic1_branco_clausura_material.Lp_terco_mic1(:), F2_mic2_branco_clausura_material.Lp_terco_mic2(:), F2_mic3_branco_clausura_material.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F2_mics_terco_branco_clausura_material = bar(F2_mics_terco_branco_clausura_material);
plot_F2_mics_terco_branco_clausura_material(1).FaceColor = azul;
plot_F2_mics_terco_branco_clausura_material(2).FaceColor = laranja;
plot_F2_mics_terco_branco_clausura_material(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura e com Material - Fonte 2 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',13)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 6. Ruído Rosa - com clausura e com material

%% 6.1 Fonte 1

%% 6.1.4 Microfones 1, 2 e 3
F1_mics_terco_rosa_clausura_material = [F1_mic1_rosa_clausura_material.Lp_terco_mic1(:), F1_mic2_rosa_clausura_material.Lp_terco_mic2(:), F1_mic3_rosa_clausura_material.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F1_mics_terco_rosa_clausura_material = bar(F1_mics_terco_rosa_clausura_material);
plot_F1_mics_terco_rosa_clausura_material(1).FaceColor = azul;
plot_F1_mics_terco_rosa_clausura_material(2).FaceColor = laranja;
plot_F1_mics_terco_rosa_clausura_material(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura e com Material - Fonte 1 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',13)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 6.2 Fonte 2

%% 6.2.4 Microfones 1, 2 e 3
F2_mics_terco_rosa_clausura_material = [F2_mic1_rosa_clausura_material.Lp_terco_mic1(:), F2_mic2_rosa_clausura_material.Lp_terco_mic2(:), F2_mic3_rosa_clausura_material.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F2_mics_terco_rosa_clausura_material = bar(F2_mics_terco_rosa_clausura_material);
plot_F2_mics_terco_rosa_clausura_material(1).FaceColor = azul;
plot_F2_mics_terco_rosa_clausura_material(2).FaceColor = laranja;
plot_F2_mics_terco_rosa_clausura_material(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura e com Material - Fonte 2 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',13)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% Correção de ruído residual

delta_Lpi_F1_mic1_branco = F1_mic1_branco.Lp_terco_mic1(:) - mic1_residual_inicial.Lp_terco_mic1(:);
delta_Lpi_F1_mic2_branco = F1_mic2_branco.Lp_terco_mic2(:) - mic2_residual_inicial.Lp_terco_mic2(:);
delta_Lpi_F1_mic3_branco = F1_mic3_branco.Lp_terco_mic3(:) - mic3_residual_inicial.Lp_terco_mic3(:);

figure('Position',[50 50 900 500])
bar(delta_Lpi_F1_mic1_branco); hold on
bar(delta_Lpi_F1_mic2_branco); hold on
bar(delta_Lpi_F1_mic3_branco);
title('\Delta{\itL}_p = NPS_{fonte} - NPS_{residual}')
xlabel('Frequência [Hz]')
ylabel('\Delta{\itL}_p [dB]');
xticks(1:length(rotulos_freq))
xticklabels(rotulos_freq)
set(gca,'Fontsize',14)
legend('Mic. 1','Mic. 2','Mic. 3','Location','northeast')
xlim([9.4 30.6])
arruma_fig('no','% 2.1f','virgula')
grid on

disp(['Para a fonte sonora sem clausura, em todas as bandas os valores ultrapassam 15 dB, dispensando correção de ruído residual.']);
%% Comparação - Ruído residual vs fonte sem clausura

F1_branco_media = 10*log10( (1/3) * ( 10.^(F1_mic1_branco.Lp_terco_mic1(:)./10) + ...
                                      10.^(F1_mic2_branco.Lp_terco_mic2(:)./10) + ...
                                      10.^(F1_mic3_branco.Lp_terco_mic3(:)./10) ) );

F2_branco_media = 10*log10( (1/3) * ( 10.^(F2_mic1_branco.Lp_terco_mic1(:)./10) + ...
                                      10.^(F2_mic2_branco.Lp_terco_mic2(:)./10) + ...
                                      10.^(F2_mic3_branco.Lp_terco_mic3(:)./10) ) );

F1_F2_branco_media = 10*log10( (1/2) * (10.^(F1_branco_media(:)./10) + ...
                                        10.^(F2_branco_media(:)./10) ) );

figure('Position',[50 50 900 500]);
bar(F1_F2_branco_media); hold on;
bar(residual_terco_inicial_media) % escolhi o residual inicial porque é o de maiores níveis - medida + conservadora
xticks(1:length(rotulos_freq))
xticklabels(rotulos_freq)
xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])
legend('NPS médio','Residual','Location','northeast')
xlim([9.4 30.6])
ylim([0 1.2*max(F1_F2_branco_media)])
grid on
arruma_fig('no','% 2.1f','virgula')
set(gca,'Fontsize',14)

%% Gráfico da diferença entre o NPS médio e o residual médio

figure('Position',[50 50 900 500]);

% Relação sinal-ruído
d_Lp = F1_F2_branco_media - residual_terco_inicial_media;

bar(d_Lp);
hold on;

% Linhas horizontais de referência em 6 dB e 10 dB
yline(6, '--', '', ...
    'LineWidth', 1.5, ...
    'LabelHorizontalAlignment', 'left', ...
    'LabelVerticalAlignment', 'bottom');

yline(10, '--', '', ...
    'LineWidth', 1.5, ...
    'LabelHorizontalAlignment', 'left', ...
    'LabelVerticalAlignment', 'bottom');

% Eixo x
xticks(1:length(rotulos_freq));
xticklabels(rotulos_freq);
xlim([9.4 30.6]);

% Inclui 6 e 10 nos valores do eixo y
ax = gca;
valores_y = unique([ax.YTick, 6, 10]);
yticks(valores_y);

% Destaca 6 e 10 em negrito
rotulos_y = arrayfun(@(x) sprintf('%.0f',x), ...
    valores_y, 'UniformOutput', false);

rotulos_y{valores_y == 6}  = '\bf6';
rotulos_y{valores_y == 10} = '\bf10';

yticklabels(rotulos_y);
ax.TickLabelInterpreter = 'tex';

xlabel('Frequência [Hz]');
ylabel('\Delta{\itL}_p [dB]');
ylim([0 1.05*max(d_Lp)])

grid on;
arruma_fig('no','% 2.1f','virgula');
set(gca,'FontSize',14);

%% Cálculo de potência da fonte sonora

A0 = 1; % [m²]: área de referência
A = (55.26/c) * (V_cam./T60_cam_rev.T60_total); % [m²]: área de absorção equivalente
S = 210.68; % [m²]: área total de superfície da câmara reverberante (dado do sketchup do desenho com as minhas medidas)
ps = 101; % [kPa]: pressão atmosférica durante as medições
ps0 = 101.325; % [kPa]: pressão atmosférica de referência
teta_0 = 314; % [K]: constante de temperatura
teta_1 = 296; % [K]: outra constante de temperatura

% Correção de quantidade de referência (reference quantity correction)
C1 = -10 * log10(ps/ps0) + 5 * log10((273.15 + T) / teta_0);

% Correção de impedância de radiação
C2 = -10 * log10(ps/ps0) + 15 * log10((273.15 + T) / teta_1);

% Cálculo da potência sonora
Lw_terco = zeros(1,length(F1_F2_branco_media(10:30))); % criação do vetor de respostas por banda

for i=1:length(F1_F2_branco_media(10:30))
    Lw = F1_F2_branco_media(9+i) + ( 10.*log10(A(i)./A0) + 4.34*(A(i)/S) + 10*log10(1 + (S*c/(8*V_cam.*freq.f_terco(9+i))) ) + C1 + C2 - 6 );
    Lw_terco(i) = Lw;
end

figure('Position',[50 50 900 500]);

bar(Lw_terco) % fonte sonora sem clausura
xticks(1:length(Lw_terco))
xticklabels(rotulos_freq(10:30))
xlabel('Frequência [Hz]');
ylabel('{\itL}_w [dB ref. 1 pW]');
grid on
arruma_fig('no','% 2.1f','virgula');
set(gca,'FontSize',14);
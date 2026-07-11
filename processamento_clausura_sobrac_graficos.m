clearvars; close all; clc;
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

F1_mic1_branco_clausura_material_membrana = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_branco_clausura_material_membrana\Lp_terco_mic1.mat');
F1_mic2_branco_clausura_material_membrana = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_branco_clausura_material_membrana\Lp_terco_mic2.mat');
F1_mic3_branco_clausura_material_membrana = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_branco_clausura_material_membrana\Lp_terco_mic3.mat');
F2_mic1_branco_clausura_material_membrana = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_branco_clausura_material_membrana\Lp_terco_mic1.mat');
F2_mic2_branco_clausura_material_membrana = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_branco_clausura_material_membrana\Lp_terco_mic2.mat');
F2_mic3_branco_clausura_material_membrana = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_branco_clausura_material_membrana\Lp_terco_mic3.mat');

F1_mic1_rosa_clausura_material_membrana = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_rosa_clausura_material_membrana\Lp_terco_mic1.mat');
F1_mic2_rosa_clausura_material_membrana = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_rosa_clausura_material_membrana\Lp_terco_mic2.mat');
F1_mic3_rosa_clausura_material_membrana = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F1_rosa_clausura_material_membrana\Lp_terco_mic3.mat');
F2_mic1_rosa_clausura_material_membrana = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_rosa_clausura_material_membrana\Lp_terco_mic1.mat');
F2_mic2_rosa_clausura_material_membrana = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_rosa_clausura_material_membrana\Lp_terco_mic2.mat');
F2_mic3_rosa_clausura_material_membrana = load('C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\Clausura\codigo_alunos_medicao\figuras_F2_rosa_clausura_material_membrana\Lp_terco_mic3.mat');

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

%% 1. Ruído Branco - sem clausura
%% 1.1 Fonte 1
%% 1.1.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F1_mic1_branco.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco sem Clausura - Fonte 1 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 1.1.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F1_mic2_branco.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco sem Clausura - Fonte 1 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 1.1.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F1_mic3_branco.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco sem Clausura - Fonte 1 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

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
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 1.2 Fonte 2
%% 1.2.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F2_mic1_branco.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco sem Clausura - Fonte 2 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 1.2.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F2_mic2_branco.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco sem Clausura - Fonte 2 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 1.2.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F2_mic3_branco.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco sem Clausura - Fonte 2 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

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
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 2. Ruído Rosa - sem clausura
%% 2.1 Fonte 1
%% 2.1.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F1_mic1_rosa.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa sem Clausura - Fonte 1 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 2.1.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F1_mic2_rosa.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa sem Clausura - Fonte 1 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 2.1.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F1_mic3_rosa.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa sem Clausura - Fonte 1 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

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
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 2.2 Fonte 2
%% 2.2.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F2_mic1_rosa.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa sem Clausura - Fonte 2 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 2.2.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F2_mic2_rosa.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa sem Clausura - Fonte 2 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 2.2.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F2_mic3_rosa.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa sem Clausura - Fonte 2 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

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
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 3. Ruído Branco - com clausura
%% 3.1 Fonte 1
%% 3.1.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F1_mic1_branco_clausura.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura - Fonte 1 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 3.1.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F1_mic2_branco_clausura.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura - Fonte 1 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 3.1.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F1_mic3_branco_clausura.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura - Fonte 1 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

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
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 3.2 Fonte 2
%% 3.2.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F2_mic1_branco_clausura.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura - Fonte 2 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 3.2.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F2_mic2_branco_clausura.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura - Fonte 2 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 3.2.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F2_mic3_branco_clausura.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura - Fonte 2 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

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
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 4. Ruído Rosa - com clausura
%% 4.1 Fonte 1
%% 4.1.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F1_mic1_rosa_clausura.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura - Fonte 1 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 4.1.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F1_mic2_rosa_clausura.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura - Fonte 1 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 4.1.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F1_mic3_rosa_clausura.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura - Fonte 1 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

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
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 4.2 Fonte 2
%% 4.2.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F2_mic1_rosa_clausura.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura - Fonte 2 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 4.2.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F2_mic2_rosa_clausura.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura - Fonte 2 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 4.2.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F2_mic3_rosa_clausura.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura - Fonte 2 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

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
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 5. Ruído Branco - com clausura e com material
%% 5.1 Fonte 1
%% 5.1.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F1_mic1_branco_clausura_material.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura e com Material - Fonte 1 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 5.1.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F1_mic2_branco_clausura_material.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura e com Material - Fonte 1 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 5.1.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F1_mic3_branco_clausura_material.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura e com Material - Fonte 1 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

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
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 5.2 Fonte 2
%% 5.2.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F2_mic1_branco_clausura_material.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura e com Material - Fonte 2 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 5.2.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F2_mic2_branco_clausura_material.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura e com Material - Fonte 2 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 5.2.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F2_mic3_branco_clausura_material.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura e com Material - Fonte 2 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

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
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 6. Ruído Rosa - com clausura e com material
%% 6.1 Fonte 1
%% 6.1.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F1_mic1_rosa_clausura_material.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura e com Material - Fonte 1 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 6.1.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F1_mic2_rosa_clausura_material.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura e com Material - Fonte 1 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 6.1.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F1_mic3_rosa_clausura_material.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura e com Material - Fonte 1 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

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
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 6.2 Fonte 2
%% 6.2.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F2_mic1_rosa_clausura_material.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura e com Material - Fonte 2 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 6.2.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F2_mic2_rosa_clausura_material.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura e com Material - Fonte 2 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 6.2.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F2_mic3_rosa_clausura_material.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura e com Material - Fonte 2 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

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
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 7. Ruído Branco - com clausura, material e membrana
%% 7.1 Fonte 1
%% 7.1.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F1_mic1_branco_clausura_material_membrana.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura, Material e Membrana - Fonte 1 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 7.1.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F1_mic2_branco_clausura_material_membrana.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura, Material e Membrana - Fonte 1 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 7.1.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F1_mic3_branco_clausura_material_membrana.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura, Material e Membrana - Fonte 1 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 7.1.4 Microfones 1, 2 e 3
F1_mics_terco_branco_clausura_material_membrana = [F1_mic1_branco_clausura_material_membrana.Lp_terco_mic1(:), F1_mic2_branco_clausura_material_membrana.Lp_terco_mic2(:), F1_mic3_branco_clausura_material_membrana.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F1_mics_terco_branco_clausura_material_membrana = bar(F1_mics_terco_branco_clausura_material_membrana);
plot_F1_mics_terco_branco_clausura_material_membrana(1).FaceColor = azul;
plot_F1_mics_terco_branco_clausura_material_membrana(2).FaceColor = laranja;
plot_F1_mics_terco_branco_clausura_material_membrana(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura, Material e Membrana - Fonte 1 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 7.2 Fonte 2
%% 7.2.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F2_mic1_branco_clausura_material_membrana.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura, Material e Membrana - Fonte 2 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 7.2.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F2_mic2_branco_clausura_material_membrana.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura, Material e Membrana - Fonte 2 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 7.2.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F2_mic3_branco_clausura_material_membrana.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura, Material e Membrana - Fonte 2 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 7.2.4 Microfones 1, 2 e 3
F2_mics_terco_branco_clausura_material_membrana = [F2_mic1_branco_clausura_material_membrana.Lp_terco_mic1(:), F2_mic2_branco_clausura_material_membrana.Lp_terco_mic2(:), F2_mic3_branco_clausura_material_membrana.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F2_mics_terco_branco_clausura_material_membrana = bar(F2_mics_terco_branco_clausura_material_membrana);
plot_F2_mics_terco_branco_clausura_material_membrana(1).FaceColor = azul;
plot_F2_mics_terco_branco_clausura_material_membrana(2).FaceColor = laranja;
plot_F2_mics_terco_branco_clausura_material_membrana(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Branco com Clausura, Material e Membrana - Fonte 2 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 8. Ruído Rosa - com clausura, material e membrana
%% 8.1 Fonte 1
%% 8.1.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F1_mic1_rosa_clausura_material_membrana.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura, Material e Membrana - Fonte 1 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 8.1.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F1_mic2_rosa_clausura_material_membrana.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura, Material e Membrana - Fonte 1 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 8.1.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F1_mic3_rosa_clausura_material_membrana.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura, Material e Membrana - Fonte 1 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 8.1.4 Microfones 1, 2 e 3
F1_mics_terco_rosa_clausura_material_membrana = [F1_mic1_rosa_clausura_material_membrana.Lp_terco_mic1(:), F1_mic2_rosa_clausura_material_membrana.Lp_terco_mic2(:), F1_mic3_rosa_clausura_material_membrana.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F1_mics_terco_rosa_clausura_material_membrana = bar(F1_mics_terco_rosa_clausura_material_membrana);
plot_F1_mics_terco_rosa_clausura_material_membrana(1).FaceColor = azul;
plot_F1_mics_terco_rosa_clausura_material_membrana(2).FaceColor = laranja;
plot_F1_mics_terco_rosa_clausura_material_membrana(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura, Material e Membrana - Fonte 1 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')

%% 8.2 Fonte 2
%% 8.2.1 Microfone 1
figure('Position',[50 50 900 500]);
bar(F2_mic1_rosa_clausura_material_membrana.Lp_terco_mic1,'FaceColor',azul,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura, Material e Membrana - Fonte 2 - Mic. 1');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 8.2.2 Microfone 2
figure('Position',[50 50 900 500]);
bar(F2_mic2_rosa_clausura_material_membrana.Lp_terco_mic2,'FaceColor',laranja,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura, Material e Membrana - Fonte 2 - Mic. 2');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 8.2.3 Microfone 3
figure('Position',[50 50 900 500]);
bar(F2_mic3_rosa_clausura_material_membrana.Lp_terco_mic3,'FaceColor',verde,'FaceAlpha',1);

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura, Material e Membrana - Fonte 2 - Mic. 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)

%% 8.2.4 Microfones 1, 2 e 3
F2_mics_terco_rosa_clausura_material_membrana = [F2_mic1_rosa_clausura_material_membrana.Lp_terco_mic1(:), F2_mic2_rosa_clausura_material_membrana.Lp_terco_mic2(:), F2_mic3_rosa_clausura_material_membrana.Lp_terco_mic3(:)];

figure('Position',[50 50 900 500]);
plot_F2_mics_terco_rosa_clausura_material_membrana = bar(F2_mics_terco_rosa_clausura_material_membrana);
plot_F2_mics_terco_rosa_clausura_material_membrana(1).FaceColor = azul;
plot_F2_mics_terco_rosa_clausura_material_membrana(2).FaceColor = laranja;
plot_F2_mics_terco_rosa_clausura_material_membrana(3).FaceColor = verde;

xlabel('Frequência [Hz]');
ylabel(['NPS [dB ref. 20 ', char(181), 'Pa]'])

grid on
box on

title('Nível de Pressão Sonora - Ruído Rosa com Clausura, Material e Membrana - Fonte 2 - Mics. 1, 2 e 3');

set(gca,'XScale','linear')
set(gca,'FontSize',12)

xticks(1:length(freq.f_terco))
xticklabels(rotulos_freq(1:length(freq.f_terco)))
xtickangle(45)
legend('Mic. 1','Mic. 2','Mic. 3','Location','best')


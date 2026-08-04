%{
Cálculo do nível de potência sonora segundo a ISO 3741:2010
Método direto — sem cálculo de incerteza

Condições:
1) fonte sem clausura;
2) fonte com clausura;
3) fonte com clausura e material absorvedor.

Observações importantes:
- O cálculo de K1 é feito por posição de microfone e por banda, antes da
  média espacial energética.
- As posições F1 e F2 são tratadas como duas posições da mesma fonte e são
  combinadas energeticamente em cada microfone.
- Este script usa o ruído residual inicial, conforme a escolha realizada no
  ensaio. A ISO 3741 não determina escolher automaticamente o maior residual.
- Caso o objeto de ensaio altere significativamente o tempo de reverberação
  da sala, deve-se usar o T60 medido para cada condição.
%}

%% Limpeza
clear; clc; close all;

% Garante que funções auxiliares salvas na mesma pasta estejam no path
pasta_script = fileparts(mfilename('fullpath'));
if ~isempty(pasta_script)
    addpath(pasta_script);
end

%% 0. Configurações gerais

pasta_base = ['C:\Users\Usuário\OneDrive\Desktop\EAC_Jóshua\Artigos\' 'Clausura\codigo_alunos_medicao'];

arquivo_T60 = 'T60_cam_rev.mat';

gerar_graficos_exploratorios = true;
gerar_graficos_iso = true;

% Escolha explícita do residual utilizado no cálculo:
% 'inicial', 'final' ou 'maximo_banda'.
% A opção 'maximo_banda' é um critério adicional conservador e não é
% explicitamente prescrita pela ISO 3741.
modo_residual = 'inicial';

% Número de faces externas consideradas radiantes no modelo teórico:
% 5 = quatro paredes verticais + tampa;
% 6 = quatro paredes verticais + tampa + fundo.
% A opção com seis faces é uma análise de sensibilidade, pois o fundo está
% apoiado diretamente no piso da câmara.
numero_faces_radiantes = 5;

assert(ismember(numero_faces_radiantes, [5 6]), 'numero_faces_radiantes deve ser igual a 5 ou 6.');

% Condições de medição
condicoes = struct( 'campo',  {'sem_clausura', 'clausura', 'clausura_material'}, 'sufixo', {'', '_clausura', '_clausura_material'}, 'titulo', {'Fonte sem clausura', 'Fonte com clausura', 'Fonte com clausura e material absorvedor'} );

tipos_ruido = struct( 'campo', {'branco', 'rosa'}, 'titulo', {'Ruído branco', 'Ruído rosa'} );

% Cores
cores_mics = [0.00 0.32 0.60; 0.90 0.45 0.10; 0.20 0.55 0.35];

%% 1. Carregamento dos dados

% Frequências de 1/3 de oitava
dados_freq = load(fullfile(pasta_base, 'figuras_F1_branco', 'f_terco.mat'));

assert(isfield(dados_freq, 'f_terco'), 'O arquivo f_terco.mat não contém a variável f_terco.');

f_terco = dados_freq.f_terco(:);

% Nominal one-third-octave frequencies corresponding to f_terco
freq_nominal_Hz = [12.5 16 20 25 31.5 40 50 63 80 100 125 160 200 250 315 400 500 630 800 1000 1250 1600 2000 2500 3150 4000 5000 6300 8000 10000 12500 16000].';

rotulos_freq = {'12,5','16','20','25','31,5','40','50','63','80','100', '125','160','200','250','315','400','500','630','800','1 k', '1,25 k','1,6 k','2 k','2,5 k','3,15 k','4 k','5 k','6,3 k', '8 k','10 k','12,5 k','16 k'};

assert(numel(freq_nominal_Hz) == numel(f_terco), 'As frequências nominais e f_terco possuem tamanhos diferentes.');

assert(numel(rotulos_freq) == numel(f_terco), 'Os rótulos e f_terco possuem tamanhos diferentes.');

% Carrega ruído branco e rosa, para as três condições e duas posições F1/F2.
% Cada matriz possui dimensão: número de bandas x 3 microfones.
dados = struct();

for ir = 1:numel(tipos_ruido)
    tipo = tipos_ruido(ir).campo;

    for ic = 1:numel(condicoes)
        condicao = condicoes(ic).campo;

        for ip = 1:2
            campo_posicao = sprintf('F%d', ip);
            pasta_medicao = fullfile(pasta_base, sprintf( 'figuras_F%d_%s%s', ip, tipo, condicoes(ic).sufixo));

            dados.(tipo).(condicao).(campo_posicao) = carregarTresMicrofones(pasta_medicao);
        end
    end
end

% Ruído residual inicial e final
Lp_residual_inicial = carregarTresMicrofones( fullfile(pasta_base, 'figuras_residual_inicial'));

Lp_residual_final = carregarTresMicrofones( fullfile(pasta_base, 'figuras_residual_final'));

% Verificações de consistência
n_bandas = numel(f_terco);
n_mics = size(Lp_residual_inicial, 2);

assert(size(Lp_residual_inicial, 1) == n_bandas, 'O residual inicial não possui o mesmo número de bandas de f_terco.');

assert(isequal(size(Lp_residual_inicial), size(Lp_residual_final)), 'Os resíduos inicial e final possuem dimensões diferentes.');

for ic = 1:numel(condicoes)
    campo = condicoes(ic).campo;

    assert(isequal(size(dados.branco.(campo).F1), size(dados.branco.(campo).F2), size(Lp_residual_inicial)), 'Dimensões incompatíveis nos dados de ruído branco da condição %s.', condicoes(ic).titulo);
end

if n_mics < 6
    warning(['Foram carregadas apenas %d posições de microfone. Confirme ' 'se essas posições correspondem ao arranjo usado na ' 'qualificação da sala. Caso contrário, a ISO 3741 prevê seis ' 'posições discretas iniciais para uma sala não qualificada.'], n_mics);
end

%% 2. Seleção do ruído residual

switch lower(modo_residual)
    case 'inicial'
        Lp_residual_usado = Lp_residual_inicial;

    case 'final'
        Lp_residual_usado = Lp_residual_final;

    case 'maximo_banda'
        Lp_residual_usado = max(Lp_residual_inicial, Lp_residual_final);

        warning(['Foi selecionado o maior residual em cada banda e posição. ' 'Esse é um critério adicional conservador, não uma ' 'exigência explícita da ISO 3741.']);

    otherwise
        error(['modo_residual deve ser ''inicial'', ''final'' ou ' '''maximo_banda''.']);
end

Lp_residual_inicial_media = mediaEnergetica(Lp_residual_inicial, 2);
Lp_residual_final_media = mediaEnergetica(Lp_residual_final, 2);
Lp_residual_usado_media = mediaEnergetica(Lp_residual_usado, 2);

%% 3. Parâmetros da câmara e condições meteorológicas

% Condições medidas
temperatura = 13.5;  % [graus Celsius]
pressao = 101.0;     % [kPa]

% Câmara reverberante
V_cam = 207.0;       % [m^3]
S_cam = 210.68;      % [m^2]

% Valores de referência da ISO 3741
A0 = 1.0;              % [m^2]
pressao_ref = 101.325;  % [kPa]
theta0 = 314.0;         % [K]
theta1 = 296.0;         % [K]

% Velocidade do som, conforme a equação apresentada na ISO 3741
c = 20.05 * sqrt(273 + temperatura); % [m/s]

% Correções meteorológicas
C1 = -10 * log10(pressao / pressao_ref) + 5 * log10((273.15 + temperatura) / theta0);

C2 = -10 * log10(pressao / pressao_ref) + 15 * log10((273.15 + temperatura) / theta1);

%% 4. Faixa de cálculo da ISO 3741: 100 Hz a 10 kHz

idx_iso = find(freq_nominal_Hz >= 100 & freq_nominal_Hz <= 10000);

f_iso = f_terco(idx_iso);                    % exact centers for calculations
f_iso_nominal = freq_nominal_Hz(idx_iso);    % nominal centers for criteria
rotulos_iso = rotulos_freq(idx_iso);

assert(numel(idx_iso) == 21, 'Esperavam-se 21 bandas entre 100 Hz e 10 kHz.');

%% 5. Tempo de reverberação e área de absorção equivalente

if ~isfile(arquivo_T60)
    arquivo_T60_alternativo = fullfile(pasta_base, arquivo_T60);

    if isfile(arquivo_T60_alternativo)
        arquivo_T60 = arquivo_T60_alternativo;
    else
        error('O arquivo %s não foi encontrado.', arquivo_T60);
    end
end

dados_T60 = load(arquivo_T60);

assert(isfield(dados_T60, 'T60_total'), 'O arquivo de T60 não contém a variável T60_total.');

T60_total = dados_T60.T60_total(:);

if isfield(dados_T60, 'fc')
    fc_T60 = dados_T60.fc(:);
    T60_iso = alinharPorFrequencia(fc_T60, T60_total, f_iso_nominal);
elseif numel(T60_total) == numel(f_iso)
    T60_iso = T60_total;
else
    error(['Não foi possível associar T60_total às bandas de 100 Hz a ' '10 kHz. Inclua a variável fc no arquivo de T60.']);
end

assert(all(isfinite(T60_iso) & T60_iso > 0), 'Os valores de T60 devem ser finitos e maiores que zero.');

% Área de absorção equivalente por banda
A_iso = (55.26 / c) .* (V_cam ./ T60_iso); % [m^2]

% IMPORTANTE:
% O mesmo T60 está sendo usado nas três condições. Caso a fonte, a
% clausura ou outro elemento altere significativamente a reverberação da
% sala, substitua T60_iso pelo T60 medido na respectiva condição.

%% 6. Verificações geométricas básicas

% Distância entre as posições F1 e F2
d_F1_F2 = 2.948; % [m]
f_min = min(f_iso);
d_min_F1_F2 = 0.5 * c / f_min;
fprintf('Distância mínima entre F1 e F2: %.3f m.\n', d_min_F1_F2);
fprintf('Distância usada entre F1 e F2: %.3f m.\n', d_F1_F2);
if d_F1_F2 < d_min_F1_F2
    warning('A distância entre F1 e F2 é menor que o valor mínimo calculado.');
end

% Distância mínima entre a fonte e cada posição de microfone
D1 = 0.08 * ones(size(f_iso));
D1(f_iso < 5000) = 0.16;
d_min_mic_fonte = D1 .* sqrt(V_cam ./ T60_iso);

if gerar_graficos_iso
    x_iso = (1:numel(f_iso)).';

    figure('Position',[50 50 600 450]);
    plotarLinhasPadrao(x_iso,T60_iso);
    xlabel('Frequência [Hz]'); ylabel('Tempo de reverberação, {\itT}_{20} [s]'); title('Tempo de reverberação da câmara');
    grid on; box on; aplicarFormato();
    ax = gca; ax.XTick = x_iso; ax.XTickLabel = rotulos_iso; ax.XTickLabelRotation = 45; ax.XLim = [0.5 numel(x_iso)+0.5];

    figure('Position',[50 50 600 450]);
    plotarLinhasPadrao(x_iso,d_min_mic_fonte);
    xlabel('Frequência [Hz]'); ylabel('Distância mínima [m]'); title('Distância mínima requerida entre fonte e microfone');
    grid on; box on; aplicarFormato();
    ax = gca; ax.XTick = x_iso; ax.XTickLabel = rotulos_iso; ax.XTickLabelRotation = 45; ax.XLim = [0.5 numel(x_iso)+0.5];
end

%% 7. Gráficos exploratórios dos dados medidos

if gerar_graficos_exploratorios

    %% 7.1 Ruído residual inicial e final
    x_freq = (1:n_bandas).';
    figure('Position',[50 50 600 450]);
    plotarLinhasPadrao(x_freq,[Lp_residual_inicial_media,Lp_residual_final_media]);
    xlabel('Frequência [Hz]'); ylabel(['NPS [dB ref. 20 ',char(181),'Pa]']);
    legend('Residual inicial','Residual final','Location','northeast');
    grid on; box on; aplicarFormato();
    ax = gca; ax.XTick = x_freq; ax.XTickLabel = rotulos_freq; ax.XTickLabelRotation = 45; ax.XLim = [9.5 30.5]; ax.YLim = [0 80]; ax.YTick = 0:10:80;
    ax.YTickLabel = arrayfun(@(v) strrep(sprintf('%.1f',v),'.',','),ax.YTick,'UniformOutput',false);

    %% 7.2 Gráficos de cada posição de fonte e cada condição
    for ir = 1:numel(tipos_ruido)
        tipo = tipos_ruido(ir).campo;
        for ic = 1:numel(condicoes)
            campo = condicoes(ic).campo;
            for ip = 1:2
                campo_posicao = sprintf('F%d',ip);
                titulo = sprintf('%s — %s — %s',tipos_ruido(ir).titulo,condicoes(ic).titulo,campo_posicao);
                plotarMicrofones(dados.(tipo).(campo).(campo_posicao),rotulos_freq,titulo,cores_mics);
            end
        end
    end

    %% 7.3 Boxplots dos NPS de F1 e F2 nas três configurações — ruído branco
    % Cada caixa reúne seis valores por banda: F1-M1, F2-M1, F1-M2,
    % F2-M2, F1-M3 e F2-M3. A linha sobreposta é a média energética.
    mascara_plot_F1_F2 = freq_nominal_Hz >= 100 & freq_nominal_Hz <= 6300;
    rotulos_box = rotulos_freq(mascara_plot_F1_F2);
    n_box = sum(mascara_plot_F1_F2);
    x_box = 1:n_box;
    offsets = linspace(-0.25,0.25,numel(condicoes));
    marcadores = {'o','s','^'};

    figura_box = figure('Units','pixels','Position',[100 100 1500 600]);
    ax_box = axes(figura_box); hold(ax_box,'on');
    cores_condicoes = colororder(ax_box);
    if size(cores_condicoes,1) < numel(condicoes), cores_condicoes = lines(numel(condicoes)); end
    h_media_box = gobjects(numel(condicoes),1);

    for ic = 1:numel(condicoes)
        campo = condicoes(ic).campo;
        F1 = dados.branco.(campo).F1;
        F2 = dados.branco.(campo).F2;
        Y_box = zeros(n_bandas,2*n_mics);
        for im = 1:n_mics
            Y_box(:,2*im-1) = F1(:,im);
            Y_box(:,2*im) = F2(:,im);
        end
        Y_box = Y_box(mascara_plot_F1_F2,:);
        pos = x_box + offsets(ic);
        boxplot(Y_box','Positions',pos,'Widths',0.20,'Colors',cores_condicoes(ic,:),'Symbol','r+');
        Lp_box_media = mediaEnergetica(Y_box,2);
        h_media_box(ic) = plot(pos,Lp_box_media,'-','Color',cores_condicoes(ic,:),'Marker',marcadores{ic},'LineWidth',1.6,'MarkerSize',5,'MarkerFaceColor',cores_condicoes(ic,:));
    end

    grid on; box on;
    xlabel('Frequência [Hz]','FontSize',20);
    ylabel(['NPS [dB ref. 20 ',char(181),'Pa]'],'FontSize',20);
    title('Distribuição dos NPS de F1 e F2 nas três configurações — ruído branco');
    ylim([0 80]); xtickangle(45); set(gca,'FontSize',15);
    legend(h_media_box,{condicoes.titulo},'Location','southwest','FontSize',12);
    aplicarFormato();
    ax_box = gca; ax_box.XTick = x_box; ax_box.XTickLabel = rotulos_box; ax_box.XTickLabelRotation = 45; ax_box.XLim = [0.5 n_box+0.5]; ax_box.YLim = [0 80];

    %% 7.4 NPS médio das três configurações — ruído branco
    Lp_medio_configuracoes_branco = zeros(n_bandas,numel(condicoes));
    for ic = 1:numel(condicoes)
        campo = condicoes(ic).campo;
        Lp_por_mic = mediaEnergetica(cat(3,dados.branco.(campo).F1,dados.branco.(campo).F2),3);
        Lp_medio_configuracoes_branco(:,ic) = mediaEnergetica(Lp_por_mic,2);
    end
    figure('Position',[50 50 600 450]);
    plotarLinhasPadrao(x_freq,Lp_medio_configuracoes_branco);
    xlabel('Frequência [Hz]'); ylabel(['NPS médio [dB ref. 20 ',char(181),'Pa]']); title('NPS médio das três configurações — ruído branco');
    legend(condicoes(1).titulo,condicoes(2).titulo,condicoes(3).titulo,'Location','best');
    grid on; box on; aplicarFormato();
    ax = gca; ax.XTick = x_freq; ax.XTickLabel = rotulos_freq; ax.XTickLabelRotation = 45; ax.XLim = [9.5 28.5]; ax.YLim = [0 80]; ax.YTick = 0:10:80;

    %% 7.5 Comparação do critério relativo — ruído branco e rosa
    campo_material = 'clausura_material';
    Lp_branco_por_mic = mediaEnergetica(cat(3,dados.branco.(campo_material).F1,dados.branco.(campo_material).F2),3);
    Lp_rosa_por_mic = mediaEnergetica(cat(3,dados.rosa.(campo_material).F1,dados.rosa.(campo_material).F2),3);
    Lp_branco_medio = mediaEnergetica(Lp_branco_por_mic,2);
    Lp_rosa_medio = mediaEnergetica(Lp_rosa_por_mic,2);
    delta_Lp_branco = Lp_branco_medio(idx_iso) - Lp_residual_usado_media(idx_iso);
    delta_Lp_rosa = Lp_rosa_medio(idx_iso) - Lp_residual_usado_media(idx_iso);
    delta_Lp_branco_rosa = [delta_Lp_branco,delta_Lp_rosa];
    n_iso = numel(idx_iso);
    criterio_relativo = 10.*ones(n_iso,1);
    criterio_relativo(f_iso_nominal <= 200 | f_iso_nominal >= 6300) = 6;

    figure('Position',[50 50 600 450]);
    h_ruidos = plotarLinhasPadrao((1:n_iso).',delta_Lp_branco_rosa); hold on;
    x_degraus = (0.5:1:(n_iso+0.5)).';
    h_criterio = stairs(x_degraus,[criterio_relativo;criterio_relativo(end)],'k--','LineWidth',1.8);
    h_15dB = yline(15,'k:','LineWidth',1.5);
    xlabel('Frequência [Hz]'); ylabel('\Delta{\itL}_p [dB]');
    title('Fonte com clausura e absorvedor — critério relativo para ruído branco e rosa');
    legend([h_ruidos(:);h_criterio;h_15dB],{'Ruído branco','Ruído rosa','Critério relativo de 6 e 10 dB','Acima de 15 dB: {\itK}_1 = 0'},'Location','northeast');
    grid on; box on; aplicarFormato();
    ax = gca; ax.XTick = 1:n_iso; ax.XTickLabel = rotulos_iso; ax.XTickLabelRotation = 45; ax.XLim = [0.5 n_iso+0.5]; ax.YLim = [0 80];
    valores_y = unique([0:10:80,6,10,15]); ax.YTick = valores_y;
    ax.YTickLabel = arrayfun(@(v) strrep(sprintf('%.1f',v),'.',','),valores_y,'UniformOutput',false);
end

%% 8. Processamento ISO 3741 — método direto

assert(exist('processarCondicaoISO3741', 'file') == 2, ['A função processarCondicaoISO3741.m não foi encontrada no path. ' 'Salve-a na mesma pasta deste script e execute clear functions; rehash.']);

parametros = struct();
parametros.f = f_iso;
parametros.A = A_iso;
parametros.A0 = A0;
parametros.S = S_cam;
parametros.V = V_cam;
parametros.c = c;
parametros.C1 = C1;
parametros.C2 = C2;

% Critério absoluto da Tabela 2 da ISO 3741
% Faixa: 100 Hz a 10 kHz
criterio_absoluto_iso = [ 33; 30; 27; 24; 21; 18; 15; 12; 11; 11; 10; 10; 10; 10; 10; 10; 10; 10; 10; 10; 10];

assert(numel(criterio_absoluto_iso) == numel(f_iso_nominal), 'O critério absoluto deve possuir um valor para cada banda ISO.');

%% Ruído residual utilizado nesta seção

% Nesta seção será utilizado explicitamente o ruído residual inicial.
% Portanto, a variável modo_residual não altera estes cálculos.
Lp_residual_calculo = Lp_residual_inicial;

% Média espacial energética do residual inicial
Lp_residual_calculo_media = Lp_residual_inicial_media;

% Valores na faixa de 100 Hz a 10 kHz
Lp_residual_absoluto = Lp_residual_calculo_media(idx_iso);

%% Processamento das três configurações

for ic = 1:numel(condicoes)

    campo = condicoes(ic).campo;

    F1_iso = dados.branco.(campo).F1(idx_iso, :);
    F2_iso = dados.branco.(campo).F2(idx_iso, :);

    % Usa explicitamente o residual inicial em cada microfone
    residual_iso = Lp_residual_calculo(idx_iso, :);

    resultado = processarCondicaoISO3741( F1_iso, F2_iso, residual_iso, parametros);

    resultado.nome = condicoes(ic).titulo;

    %% Avaliação dos critérios de ruído de fundo

    % O critério absoluto somente é utilizado quando o critério relativo
    % de 6 dB ou 10 dB não é atendido.
    resultado.falha_criterio_relativo = ~resultado.atende_criterio_medio;

    resultado.atende_criterio_absoluto = resultado.Lp_residual_medio <= criterio_absoluto_iso;

    resultado.criterio_absoluto_aplicado = resultado.falha_criterio_relativo;

    resultado.atende_criterio_fundo = resultado.atende_criterio_medio | (resultado.criterio_absoluto_aplicado & resultado.atende_criterio_absoluto);

    resultado.falha_criterio_fundo = ~resultado.atende_criterio_fundo;

    %% Armazenamento dos resultados

    if ic == 1

        resultados = repmat( resultado, 1, numel(condicoes));

    else

        resultado = orderfields( resultado, resultados(1));

        resultados(ic) = resultado;
    end

    %% Informações no Command Window

    fprintf('\n%s\n', condicoes(ic).titulo);

    fprintf(['  Frequências que não atendem ao critério relativo ' 'de 6 dB/10 dB [Hz]: %s.\n'], listarFrequencias( rotulos_iso, resultado.falha_criterio_relativo));

    fprintf(['  Frequências com correção limitada e resultado tratado ' 'como limite superior [Hz]: %s.\n'], listarFrequencias( rotulos_iso, resultado.banda_limite_superior));

    frequencias_recuperadas = resultado.falha_criterio_relativo & resultado.atende_criterio_absoluto;

    if any(resultado.falha_criterio_relativo)

        fprintf(['  Frequências em que o critério absoluto foi ' 'aplicado e atendido [Hz]: %s.\n'], listarFrequencias( rotulos_iso, frequencias_recuperadas));

    else

        fprintf(['  O critério absoluto não precisou ser aplicado, pois ' 'o critério relativo foi atendido em todas as bandas.\n']);
    end

    if any(resultado.falha_criterio_fundo)

        fprintf(['  Frequências que não atendem nem ao critério relativo ' 'nem ao absoluto [Hz]: %s.\n'], listarFrequencias( rotulos_iso, resultado.falha_criterio_fundo));

        fprintf(['  CONCLUSÃO: os critérios de ruído de fundo da ' 'ISO 3741 NÃO foram atendidos para esta condição.\n']);

    else

        fprintf(['  CONCLUSÃO: os critérios de ruído de fundo da ' 'ISO 3741 foram atendidos para esta condição.\n']);
    end

    %% Gráfico individual de fonte e residual

    if gerar_graficos_iso
        plotarFonteResidual(resultado, rotulos_iso);
    end
end

%% Gráfico único de Delta Lp para as três configurações

if gerar_graficos_iso

    delta_Lp_configuracoes = zeros( numel(f_iso), numel(condicoes));

    for ic = 1:numel(condicoes)
        delta_Lp_configuracoes(:, ic) = resultados(ic).delta_media(:);
    end

    criterio_relativo = resultados(1).criterio_por_banda(:);

    plotarDeltaConfiguracoes( delta_Lp_configuracoes, criterio_relativo, condicoes, rotulos_iso);
end

%% Gráfico do critério absoluto

% O gráfico somente é gerado se ao menos uma condição não atender ao
% critério relativo em alguma banda.
ha_falha_relativa = any(arrayfun( @(r) any(r.falha_criterio_relativo), resultados));

if gerar_graficos_iso && ha_falha_relativa

    plotarCriterioAbsoluto( Lp_residual_absoluto, criterio_absoluto_iso, rotulos_iso);
end
%% 9. Resultados de potência sonora e níveis globais experimentais

% Garante vetores-coluna.
Lw_sem_clausura = resultados(1).Lw(:);
Lw_com_clausura = resultados(2).Lw(:);
Lw_com_clausura_material = resultados(3).Lw(:);

% Matriz: linhas = bandas; colunas = condições 1, 2 e 3.
Lw_terco = [ Lw_sem_clausura, Lw_com_clausura, Lw_com_clausura_material];

Tabela_Lw = table( f_iso, Lw_sem_clausura, Lw_com_clausura, Lw_com_clausura_material, 'VariableNames', { 'Frequencia_Hz', 'Lw_sem_clausura_dB', 'Lw_com_clausura_dB', 'Lw_com_clausura_material_dB'} );

Tabela_criterio_residual = table( f_iso, resultados(1).delta_media, resultados(1).atende_criterio_fundo, resultados(2).delta_media, resultados(2).atende_criterio_fundo, resultados(3).delta_media, resultados(3).atende_criterio_fundo, 'VariableNames', { 'Frequencia_Hz', 'DeltaLp_sem_clausura_dB', 'Atende_criterio_fundo_sem_clausura', 'DeltaLp_com_clausura_dB', 'Atende_criterio_fundo_com_clausura', 'DeltaLp_com_material_dB', 'Atende_criterio_fundo_com_material'} );

disp(Tabela_Lw);
disp(Tabela_criterio_residual);

%% 9.1 Bandas válidas comuns às três configurações

% O gráfico experimental original apresenta as bandas de 100 Hz a 6,3 kHz.
% Para que os três níveis globais sejam diretamente comparáveis, são usadas
% somente as bandas dessa faixa que atendem aos critérios de ruído de fundo
% simultaneamente nas três configurações.
mascara_faixa_grafico_experimental = f_iso_nominal >= 100 & f_iso_nominal <= 6300;

mascara_criterio_comum_experimental = resultados(1).atende_criterio_fundo(:) & resultados(2).atende_criterio_fundo(:) & resultados(3).atende_criterio_fundo(:);

mascara_global_experimental = mascara_faixa_grafico_experimental & mascara_criterio_comum_experimental;

assert(any(mascara_global_experimental), ['Nenhuma banda comum às três configurações atende aos critérios ' 'de ruído de fundo na faixa de 100 Hz a 6,3 kHz.']);

rotulos_experimentais_validos = rotulos_iso(mascara_global_experimental);

Lw_terco_experimental_valido = Lw_terco(mascara_global_experimental, :);

%% 9.2 Níveis globais experimentais não ponderados

% Equação (F.3) da ISO 3741, aplicada somente às bandas válidas comuns.
Lw_global_sem_clausura = nivelGlobalEnergetico( Lw_sem_clausura(mascara_global_experimental));

Lw_global_com_clausura = nivelGlobalEnergetico( Lw_com_clausura(mascara_global_experimental));

Lw_global_com_clausura_material = nivelGlobalEnergetico( Lw_com_clausura_material(mascara_global_experimental));

Tabela_Lw_global_experimental = table( ["Fonte sem clausura"; "Fonte com clausura"; "Fonte com clausura e absorvedor"], [Lw_global_sem_clausura; Lw_global_com_clausura; Lw_global_com_clausura_material], 'VariableNames', { 'Configuracao', 'Lw_global_nao_ponderado_dB'});

disp(Tabela_Lw_global_experimental);

fprintf(['\nBandas comuns usadas nos níveis globais experimentais ' '[Hz]: %s.\n'], listarFrequencias( rotulos_iso, mascara_global_experimental));

%% 9.3 Gráfico dos níveis de potência sonora experimentais

x_Lw = (1:numel(rotulos_experimentais_validos)).';
figure('Position',[50 50 600 450]);
h_Lw = plotarLinhasPadrao(x_Lw,Lw_terco_experimental_valido);
xlabel('Frequência [Hz]'); ylabel('{\it L}_W [dB ref. 1 pW]','Interpreter','tex');
legenda_Lw_experimental = {sprintf('Fonte ({\\itL}_{W,{\\rmglobal}} = %s dB)',formatarDecimal(Lw_global_sem_clausura)),sprintf('Fonte + clausura ({\\itL}_{W,{\\rmglobal}} = %s dB)',formatarDecimal(Lw_global_com_clausura)),sprintf('Fonte + clausura + absorvedor ({\\itL}_{W,{\\rmglobal}} = %s dB)',formatarDecimal(Lw_global_com_clausura_material))};
h_legenda = legend(h_Lw,legenda_Lw_experimental,'Location','south','Interpreter','tex');
grid on; box on; aplicarFormato();
ax = gca; ax.XTick = x_Lw; ax.XTickLabel = rotulos_experimentais_validos; ax.XTickLabelRotation = 45; ax.XLim = [0.5 numel(x_Lw)+0.5]; ax.YLim = [0 85];
h_legenda.Interpreter = 'tex'; h_legenda.FontName = ax.FontName; h_legenda.FontSize = 12.5;

%% 10. Perda por inserção de potência sonora das clausuras

% D_W = L_W(sem clausura) - L_W(com clausura)
Lw_sem_clausura = Lw_sem_clausura(:);
Lw_com_clausura = Lw_com_clausura(:);
Lw_com_clausura_material = Lw_com_clausura_material(:);
D_W_clausura = Lw_sem_clausura - Lw_com_clausura;
D_W_clausura_absorvedor = Lw_sem_clausura - Lw_com_clausura_material;
D_W_terco = [D_W_clausura,D_W_clausura_absorvedor];
Tabela_D_W = table(f_iso_nominal(:),D_W_clausura,D_W_clausura_absorvedor,'VariableNames',{'Frequencia_nominal_Hz','D_W_clausura_dB','D_W_clausura_com_absorvedor_dB'});
disp(Tabela_D_W);

%% Gráfico da perda por inserção
x_DW = (1:numel(rotulos_iso)).';
figure('Position',[50 50 600 450]);
h_DW = plotarLinhasPadrao(x_DW,D_W_terco); hold on;
yline(0,'k-','LineWidth',1.0,'HandleVisibility','off');
xlabel('Frequência [Hz]'); ylabel('Perda por inserção, {\itD}_W [dB]'); title('Perda por inserção de potência sonora das clausuras');
legend(h_DW,{'Clausura sem absorvedor','Clausura com absorvedor'},'Location','northwest');
grid on; box on; aplicarFormato();
ax = gca; ax.XTick = x_DW; ax.XTickLabel = rotulos_iso; ax.XTickLabelRotation = 45; ax.XLim = [0.5 19.5]; ax.YLim = [0 80];

%% Níveis globais experimentais
% Calculados na Seção 9 apenas com as bandas comuns às três configurações
% que atendem aos critérios de ruído de fundo e pertencem à faixa exibida.

%% 11. Modelo analítico da redução sonora da clausura
%{
Referências principais:
- Bies e Hansen, Engineering Noise Control, 4a ed.:
  * B = E*h^3/[12(1-nu^2)]                         Eq. (8.2b)
  * frequência crítica                            Eq. (8.3)
  * frequências modais de painel                  Eq. (8.22)
  * extensão de baixa frequência                  Eqs. (8.43) e (8.44)
  * lei da massa de Sharp, em terços de oitava   Eq. (8.38)
  * região de coincidência e amortecimento        Eq. (8.40)
  * transmissão equivalente por área              Eqs. (8.74) e (8.75)
  * correção acústica interna C                    Eq. (8.86)
  * redução sonora da clausura NR = TL - C         Eq. (8.94)

Hipóteses adotadas:
- número de faces radiantes selecionável entre cinco e seis;
- com cinco faces, o fundo apoiado no piso é excluído da transmissão aérea;
- com seis faces, o fundo é incluído apenas como análise de sensibilidade;
- faces tratadas separadamente como painéis simples isotrópicos;
- dimensões livres dos painéis aproximadas pelas dimensões internas;
- modelo de baixa frequência avaliado para bordas simplesmente apoiadas e
  para uma correção aproximada de quatro bordas engastadas;
- modelo simplificado adicional baseado somente na lei da massa de Sharp;
- frestas não incluídas, devido à remontagem, colagem, calafetação e
  acabamento das juntas;
- acoplamento estrutural entre faces e transmissão pelo piso não modelados;
- absorção da espuma calculada pelo modelo JCA;
- incidência difusa estimada, frequência a frequência, pela conversão
  semiempírica de London a partir do coeficiente de incidência normal;
- coeficientes em terços de oitava obtidos pela integração normalizada
  das curvas em banda estreita dentro dos limites de cada banda.
%}

%% 11.1 Faixa de comparação: 100 Hz a 6,3 kHz

idx_modelo = f_iso_nominal >= 100 & f_iso_nominal <= 6300;

f_modelo = f_iso(idx_modelo);                  % centros exatos [Hz]
f_modelo_nominal = f_iso_nominal(idx_modelo); % centros nominais [Hz]
rotulos_modelo = rotulos_iso(idx_modelo);

f_modelo = f_modelo(:);
f_modelo_nominal = f_modelo_nominal(:);

%% 11.2 Propriedades do ar usadas no modelo de TL

R_ar = 287.05; % constante específica do ar seco [J/(kg.K)]
rho0_modelo = (pressao .* 1e3) ./ (R_ar .* (temperatura + 273.15)); % [kg/m^3]

%% 11.3 Propriedades adotadas para o MDF de 9 mm

e_mdf = (0.945+0.945+0.940)*10^-2 / 3; % espessura média [m]
h_amostra_mdf = (25.0+25.1)*10^-2 / 2; % altura da amostra [m]
l_amostra_mdf = (11.4+11.2)*10^-2 / 2; % largura da amostra [m]
massa_amostra_mdf = 0.197; % massa da amostra [kg]

rho_mdf = massa_amostra_mdf ./ (l_amostra_mdf .* h_amostra_mdf .* e_mdf); % massa específica [kg/m^3]

% Propriedades dinâmicas de MDF de 9 mm, Guan et al. (2016)
E_arm_mdf = 3358.80e6; % módulo de armazenamento [Pa], que é igual ao módulo de elasticidadade
E_perda_mdf = 100.90e6; % módulo de perda [Pa]
eta_mdf = E_perda_mdf / E_arm_mdf; % fator de perda [-]

% Valor no plano do painel para MDF com densidades próximas à medida,
% Ganev et al. (2005)
nu_mdf = 0.25;

% Fontes dos valores adotados:
% - rho_mdf: calculada a partir da amostra medida;
% - E_arm_mdf: ficha técnica Laminex MDF Raw Standard, faixa 9-12 mm;
% - nu_mdf: Mirbolouk e Roohnia (2015), valor assumido para MDF comercial;
% - eta_mdf: Guan et al. (2016), MDF9: E'=3358,80 MPa e E''=100,90 MPa.

m_superficial_mdf = rho_mdf .* e_mdf; % massa superficial [kg/m^2]
B_mdf = E_arm_mdf .* e_mdf.^3 ./ (12 .* (1 - nu_mdf.^2)); % Eq. (8.2b)

%% 11.4 Geometria da clausura e da fonte

% Dimensões internas atuais: [largura, altura, comprimento], em metros.
% Substituir pelos valores finais verificados no protótipo.

% Dimensões externas aproximadas a partir das internas e da espessura do MDF.
dim_externa = [0.3410, 0.2615, 0.3005];

largura_e = dim_externa(1);
altura_e = dim_externa(2);
comprimento_e = dim_externa(3);

dim_interna = dim_externa - 2 .* e_mdf;

largura_i = dim_interna(1);
altura_i = dim_interna(2);
comprimento_i = dim_interna(3);

% Conjunto completo de seis faces. As dimensões internas são usadas como
% vãos vibrantes no cálculo de f_11 e as externas na ponderação de TL.
dim_faces_vibrantes_todas = [ largura_i,     altura_i; ...       % frontal
    largura_i,     altura_i; ...       % posterior
    comprimento_i, altura_i; ...       % lateral 1
    comprimento_i, altura_i; ...       % lateral 2
    largura_i,     comprimento_i; ...  % tampa
    largura_i,     comprimento_i];     % fundo

dim_faces_externas_todas = [ largura_e,     altura_e; largura_e,     altura_e; comprimento_e, altura_e; comprimento_e, altura_e; largura_e,     comprimento_e; largura_e,     comprimento_e];

nomes_faces_todas = [ "Frontal"; "Posterior"; "Lateral 1"; "Lateral 2"; "Tampa"; "Fundo"];

if numero_faces_radiantes == 5
    idx_faces_radiantes = 1:5;
else
    idx_faces_radiantes = 1:6;
end

dim_faces_vibrantes = dim_faces_vibrantes_todas(idx_faces_radiantes, :);

dim_faces_externas = dim_faces_externas_todas(idx_faces_radiantes, :);

nomes_faces = nomes_faces_todas(idx_faces_radiantes);

S_faces_externas = prod(dim_faces_externas, 2); % [m^2]
S_E = sum(S_faces_externas);                    % área externa radiante [m^2]

% Seis superfícies internas de MDF na configuração sem absorvedor.
dim_faces_internas_sem_abs = [ largura_i,     altura_i; largura_i,     altura_i; comprimento_i, altura_i; comprimento_i, altura_i; largura_i,     comprimento_i; ... % teto
    largura_i,     comprimento_i];    % piso

S_faces_internas_sem_abs = prod(dim_faces_internas_sem_abs, 2);
S_mdf_interno_sem_abs = sum(S_faces_internas_sem_abs);

% Fonte apoiada pela face de 10 cm x 5 cm diretamente sobre o piso.
dim_fonte = [0.10, 0.07, 0.02]; % [comprimento, largura, altura], em m
V_fonte = prod(dim_fonte);
S_fonte_total = 2 .* ( dim_fonte(1).*dim_fonte(2) + dim_fonte(1).*dim_fonte(3) + dim_fonte(2).*dim_fonte(3));
S_contato_fonte = dim_fonte(1) .* dim_fonte(2);
S_fonte_exposta = S_fonte_total - S_contato_fonte;

%% 11.5 Geometria interna com a espuma

% Espessura média medida da espuma de poliuretano.
d_espuma = 28.446e-3; % [m]

% A espuma cobre as quatro paredes verticais e o teto, mas não o piso.
% Dimensões do volume de ar livre: [largura, altura, comprimento].
dim_livre_com_abs = [ largura_i - 2.*d_espuma, altura_i - d_espuma, comprimento_i - 2.*d_espuma];

assert(all(dim_livre_com_abs > 0), 'A espessura da espuma é incompatível com as dimensões internas.');

largura_livre = dim_livre_com_abs(1);
altura_livre = dim_livre_com_abs(2);
comprimento_livre = dim_livre_com_abs(3);

% Superfícies frontais da espuma expostas ao volume livre.
dim_faces_espuma = [ largura_livre,     altura_livre; largura_livre,     altura_livre; comprimento_livre, altura_livre; comprimento_livre, altura_livre; largura_livre,     comprimento_livre]; % teto

S_faces_espuma = prod(dim_faces_espuma, 2);
S_espuma = sum(S_faces_espuma);
S_piso_mdf_com_abs = largura_livre .* comprimento_livre;

% A área de contato da fonte com o piso não fica exposta ao campo interno.
S_mdf_interno_sem_abs_exposto = S_mdf_interno_sem_abs - S_contato_fonte;
S_piso_mdf_com_abs_exposto = S_piso_mdf_com_abs - S_contato_fonte;

% Volumes geométricos. Não entram diretamente em NR = TL - C, mas são
% mantidos para documentação e futuras análises de ressonâncias da cavidade.
V_cavidade_sem_abs = prod(dim_interna);
V_ar_sem_abs = V_cavidade_sem_abs - V_fonte;

V_cavidade_livre_com_abs = prod(dim_livre_com_abs);

% Volume geométrico ocupado pela espuma.
V_espuma = V_cavidade_sem_abs - V_cavidade_livre_com_abs;

V_ar_com_abs = V_cavidade_livre_com_abs - V_fonte;

% Áreas internas totais, incluindo a superfície exposta da fonte.
S_i_sem_abs = S_mdf_interno_sem_abs_exposto + S_fonte_exposta;
S_i_com_abs = S_espuma + S_piso_mdf_com_abs_exposto + S_fonte_exposta;

%% 11.6 Coeficiente de absorção aproximado do MDF liso e pintado

% Não foi localizada uma curva específica para MDF liso de 9 mm pintado.
% Usa-se como aproximação uma superfície rígida, lisa e pintada, com os
% coeficientes publicados pela OSHA para tijolo sem esmalte pintado.
f_alpha_mdf_ref = [125 250 500 1000 2000 4000].';
alpha_mdf_ref = [0.01 0.01 0.02 0.02 0.02 0.03].'; % OSHA - Brick, unglazed, painted
% alpha_mdf_ref = [0.02 0.04 0.04 0.07 0.12 0.14].'; % OSHA original
% alpha_mdf_ref = [0.02 0.04 0.04 0.03 0.06 0.07].'; % OSHA modificado
% alpha_mdf_ref = [0.15 0.11 0.10 0.07 0.06 0.07].'; % acoustic-supplies - Wood flooring on joists
% alpha_mdf_ref = [0.04 0.04 0.07 0.06 0.06 0.07].'; % acoustic-supplies - Wood parquet on concrete

% Interpolação linear no eixo logarítmico de frequência. Fora da faixa dos
% dados, mantém-se o valor do extremo mais próximo.
alpha_mdf = interp1( log10(f_alpha_mdf_ref), alpha_mdf_ref, log10(f_modelo), 'linear', 'extrap');

alpha_mdf(f_modelo <= f_alpha_mdf_ref(1)) = alpha_mdf_ref(1);
alpha_mdf(f_modelo >= f_alpha_mdf_ref(end)) = alpha_mdf_ref(end);

% A superfície exposta da caixa de som é tratada como superfície rígida.
alpha_fonte = alpha_mdf;

%% 11.7 Absorção da espuma pelo modelo JCA

% Parâmetros macroscópicos médios da Tabela 1 do artigo.
sigma_espuma = 17.825e3;        % resistividade ao fluxo [Pa.s/m^2]
phi_espuma = 0.943;             % porosidade [-]
alfa_inf_espuma = 2.500;        % tortuosidade [-]
Lambda_espuma = 102.4e-6;       % comprimento viscoso [m]
Lambda_linha_espuma = 165.2e-6; % comprimento térmico [m]

% Condições termodinâmicas utilizadas na caracterização da espuma.
temperatura_JCA = 21.25; % [graus Celsius]
p0_JCA = 101.1e3;        % [Pa]

% Curva em banda estreita para visualização e posterior integração em
% bandas de um terço de oitava. A amostragem logarítmica fornece resolução
% aproximadamente uniforme ao longo das faixas fracionárias.
%
% A curva precisa cobrir integralmente os limites da primeira e da última
% banda utilizadas no modelo. Para bandas entre 100 Hz e 6,3 kHz, a faixa
% de 20 Hz a 10 kHz é suficiente.
freq_JCA = logspace( log10(20), log10(10000), 5000).';

%% Incidência normal em banda estreita

% Camada porosa de estrutura rígida sobre terminação rígida.
alpha_n_JCA_fina = coefAbsorcaoJCA( freq_JCA, d_espuma, sigma_espuma, phi_espuma, alfa_inf_espuma, Lambda_espuma, Lambda_linha_espuma, temperatura_JCA, p0_JCA);

%% Conversão semiempírica de London para campo difuso

% A conversão é aplicada ponto a ponto à curva de incidência normal:
%
% alpha_s = 4 * [(1-sqrt(1-alpha_n))/(1+sqrt(1-alpha_n))] *
%           [ln(2/(1-sqrt(1-alpha_n)))
%            - (1+sqrt(1-alpha_n))/2].
%
% Referência:
% LONDON, A. The Determination of Reverberant Sound Absorption
% Coefficients from Acoustic Impedance Measurements.
% J. Acoust. Soc. Am., v. 22, n. 2, p. 263-269, 1950.
% DOI: 10.1121/1.1906600.
alpha_s_JCA_fina = converterNormalParaDifusoLondon( alpha_n_JCA_fina);

%% Coeficientes médios em bandas de um terço de oitava

% Para cada banda de frequência central fc:
%
% f_inf = fc / 2^(1/6)
% f_sup = fc * 2^(1/6)
%
% alpha_b = [1/(f_sup-f_inf)] *
%           integral_{f_inf}^{f_sup} alpha(f) df.
%
% A integração é aplicada separadamente às curvas de incidência normal e
% difusa. Essa operação produz a média uniforme em frequência dentro de
% cada banda, em vez de simplesmente avaliar alpha na frequência central.
%
% Referência:
% VAN HOORICKX, C.; DIDIER, P.; REYNDERS, E. P. B.
% Prediction and uncertainty quantification of the diffuse sound
% absorption of finite absorbers. Journal of Sound and Vibration,
% v. 539, art. 117258, 2022.
% DOI: 10.1016/j.jsv.2022.117258.
alpha_n_JCA_terco = integrarCoeficienteTercoNormalizado( freq_JCA, alpha_n_JCA_fina, f_modelo);

alpha_s_JCA_terco = integrarCoeficienteTercoNormalizado( freq_JCA, alpha_s_JCA_fina, f_modelo);

%% Tabela de verificação dos coeficientes em terços de oitava

Tabela_absorcao_terco = table( f_modelo_nominal, alpha_n_JCA_terco, alpha_s_JCA_terco, 'VariableNames', { 'Frequencia_nominal_Hz', 'Alpha_JCA_normal_media_banda', 'Alpha_JCA_difusa_London_media_banda'});

disp(Tabela_absorcao_terco);

%% Gráfico teórico em banda estreita: incidência normal e difusa

figure('Position', [50 50 600 450]);

semilogx( freq_JCA, alpha_n_JCA_fina, '-', 'LineWidth', 2.0);

hold on;

semilogx( freq_JCA, alpha_s_JCA_fina, '--', 'LineWidth', 2.0);

xlabel('Frequência [Hz]');
ylabel('Coeficiente de absorção, \alpha [-]');

title(['Modelo JCA da espuma de poliuretano: ' 'incidência normal e campo difuso']);

legend( 'JCA — incidência normal', 'JCA + conversão de London — campo difuso', 'Location', 'southeast', 'Interpreter', 'tex');

xlim([20 10000]);
ylim([0 1.1]);

grid on;
box on;
aplicarFormato();

%% 11.8 Perda por transmissão: Sharp e lei da massa simplificada

n_faces = size(dim_faces_vibrantes, 1);

% Modelo Sharp--Bies com bordas simplesmente apoiadas.
TL_faces = zeros(numel(f_modelo), n_faces);
f11_faces = zeros(n_faces, 1);
fc_faces = zeros(n_faces, 1);

% Análise de sensibilidade com correção de f11 para bordas engastadas.
TL_faces_engastadas = zeros(numel(f_modelo), n_faces);
f11_faces_engastadas = zeros(n_faces, 1);
fator_engaste_faces = zeros(n_faces, 1);

for jf = 1:n_faces

    [TL_faces(:, jf), f11_faces(jf), fc_faces(jf)] = calcularTLSharpPainel( f_modelo, dim_faces_vibrantes(jf, 1), dim_faces_vibrantes(jf, 2), e_mdf, rho_mdf, E_arm_mdf, nu_mdf, eta_mdf, rho0_modelo, c);

    % Fator de correção de f11 para quatro bordas engastadas,
    % interpolado a partir dos valores apresentados por Bies e Hansen.
    fator_engaste_faces(jf) = fatorF11EngastadaBies( dim_faces_vibrantes(jf, 1), dim_faces_vibrantes(jf, 2));

    [TL_faces_engastadas(:, jf), f11_faces_engastadas(jf), ~] = calcularTLSharpPainel( f_modelo, dim_faces_vibrantes(jf, 1), dim_faces_vibrantes(jf, 2), e_mdf, rho_mdf, E_arm_mdf, nu_mdf, eta_mdf, rho0_modelo, c, fator_engaste_faces(jf));
end

% Coeficiente de transmissão equivalente ponderado pelas áreas externas:
% Eqs. (8.74) e (8.75) de Bies e Hansen.
tau_faces = 10.^(-TL_faces ./ 10);

tau_eq = sum( bsxfun(@times, tau_faces, S_faces_externas.'), 2) ./ S_E;

TL_eq = -10 .* log10(tau_eq);

% TL equivalente com a correção aproximada para bordas engastadas.
tau_faces_engastadas = 10.^(-TL_faces_engastadas ./ 10);

tau_eq_engastada = sum( bsxfun(@times, tau_faces_engastadas, S_faces_externas.'), 2) ./ S_E;

TL_eq_engastada = -10 .* log10(tau_eq_engastada);

% Modelo simplificado: somente lei da massa de Sharp para terços de oitava,
% Eq. (8.38). Não são incluídas frestas, ressonâncias, rigidez, coincidência
% ou amortecimento. Como todas as faces possuem o mesmo MDF e espessura,
% o TL individual é igual; ainda assim, a combinação por áreas é mantida
% explicitamente para conservar a estrutura geral do modelo.
TL_lei_massa = calcularTLLeiMassaSharpTerco( f_modelo, m_superficial_mdf, rho0_modelo, c);

TL_faces_lei_massa = repmat(TL_lei_massa, 1, n_faces);
tau_faces_lei_massa = 10.^(-TL_faces_lei_massa ./ 10);

tau_eq_lei_massa = sum( bsxfun(@times, tau_faces_lei_massa, S_faces_externas.'), 2) ./ S_E;

TL_eq_lei_massa = -10 .* log10(tau_eq_lei_massa);

%% Gráfico de TL

figure('Position', [50 50 800 500]);

h_faces = semilogx(f_modelo_nominal,TL_faces,'--o','LineWidth',1.0,'MarkerSize',4);

hold on;

h_eq_apoiada = semilogx( f_modelo_nominal, TL_eq, 'k-o', 'LineWidth', 2.0, 'MarkerSize', 5);

h_eq_engastada = semilogx( f_modelo_nominal, TL_eq_engastada, 'k-s', 'LineWidth', 1.5, 'MarkerSize', 5);

h_eq_massa = semilogx(f_modelo_nominal,TL_eq_lei_massa,'k-.^','LineWidth',1.8,'MarkerSize',5);

xlabel('Frequência [Hz]');
ylabel('Perda por transmissão, TL [dB]');
title(sprintf( 'Perda por transmissão considerando %d faces radiantes', numero_faces_radiantes));

legendas_tl = [ cellstr(nomes_faces); {'TL equivalente - simplesmente apoiada'}; {'TL equivalente - engastada'}; {'TL equivalente - lei da massa'}];

legend( [h_faces(:); h_eq_apoiada; h_eq_engastada; h_eq_massa], legendas_tl, 'Location', 'best');

xlim([100 6300]);
grid on;
box on;
aplicarFormato();

%% 11.9 Coeficiente médio de absorção interno

alpha_i_sem_abs = ( S_mdf_interno_sem_abs_exposto .* alpha_mdf + S_fonte_exposta .* alpha_fonte) ./ S_i_sem_abs;

% Seleção da curva JCA integrada em terços de oitava usada no modelo
% interno da clausura.
tipo_incidencia = 'difusa'; % 'normal' ou 'difusa'

switch lower(tipo_incidencia)

    case 'normal'
        alpha_espuma = alpha_n_JCA_terco;

    case 'difusa'
        alpha_espuma = alpha_s_JCA_terco;

    otherwise
        error('tipo_incidencia deve ser ''normal'' ou ''difusa''.');
end

alpha_i_com_abs = ( S_espuma .* alpha_espuma + S_piso_mdf_com_abs_exposto .* alpha_mdf + S_fonte_exposta .* alpha_fonte) ./ S_i_com_abs;

% Proteção apenas numérica contra divisão por zero.
alpha_i_sem_abs = max(alpha_i_sem_abs, eps);
alpha_i_com_abs = max(alpha_i_com_abs, eps);

%% 11.10 Correção C e redução sonora teórica

% Equação (8.86) de Bies e Hansen. A relação S_E/S_i é mantida
% explicitamente e varia quando são selecionadas cinco ou seis faces.
C_sem_abs = 10 .* log10( 0.3 + S_E .* (1 - alpha_i_sem_abs) ./ (S_i_sem_abs .* alpha_i_sem_abs));

C_com_abs = 10 .* log10( 0.3 + S_E .* (1 - alpha_i_com_abs) ./ (S_i_com_abs .* alpha_i_com_abs));

% Equação (8.94): NR = TL - C.
NR_teorica_sem_abs = TL_eq - C_sem_abs;
NR_teorica_com_abs = TL_eq - C_com_abs;

% Previsão com as frequências fundamentais corrigidas para
% quatro bordas engastadas. O termo C permanece inalterado.
NR_teorica_sem_abs_engastada = TL_eq_engastada - C_sem_abs;

NR_teorica_com_abs_engastada = TL_eq_engastada - C_com_abs;

% Previsão simplificada baseada exclusivamente na lei da massa.
NR_teorica_sem_abs_lei_massa = TL_eq_lei_massa - C_sem_abs;

NR_teorica_com_abs_lei_massa = TL_eq_lei_massa - C_com_abs;

%% 11.11 Tabelas de verificação do modelo

Tabela_faces_modelo = table( nomes_faces, dim_faces_vibrantes(:, 1), dim_faces_vibrantes(:, 2), S_faces_externas, fator_engaste_faces, f11_faces, f11_faces_engastadas, fc_faces, 'VariableNames', { 'Face', 'Dimensao_a_m', 'Dimensao_b_m', 'Area_externa_m2', 'Fator_engaste_Bies', 'f11_apoiada_Hz', 'f11_engastada_Hz', 'fc_Hz'});

Tabela_geometria_modelo = table( ["Sem absorvedor"; "Com absorvedor"], [numero_faces_radiantes; numero_faces_radiantes], [V_cavidade_sem_abs; V_cavidade_livre_com_abs], [V_ar_sem_abs; V_ar_com_abs], [0; V_espuma], [S_i_sem_abs; S_i_com_abs], [S_E; S_E], 'VariableNames', { 'Configuracao', 'Numero_faces_radiantes', 'Volume_geometrico_livre_m3', 'Volume_de_ar_descontando_fonte_m3', 'Volume_espuma_m3', 'Area_interna_total_m2', 'Area_externa_radiante_m2'});

Tabela_modelo_teorico = table( f_modelo_nominal, alpha_mdf, alpha_espuma, alpha_i_sem_abs, alpha_i_com_abs, TL_eq, TL_eq_engastada, TL_eq_lei_massa, C_sem_abs, C_com_abs, NR_teorica_sem_abs, NR_teorica_sem_abs_engastada, NR_teorica_sem_abs_lei_massa, NR_teorica_com_abs, NR_teorica_com_abs_engastada, NR_teorica_com_abs_lei_massa, 'VariableNames', { 'Frequencia_nominal_Hz', 'Alpha_MDF_pintado_aproximado', 'Alpha_espuma_selecionado', 'Alpha_interno_sem_absorvedor', 'Alpha_interno_com_absorvedor', 'TL_eq_apoiada_dB', 'TL_eq_engastada_dB', 'TL_eq_lei_massa_dB', 'C_sem_absorvedor_dB', 'C_com_absorvedor_dB', 'NR_sem_abs_apoiada_dB', 'NR_sem_abs_engastada_dB', 'NR_sem_abs_lei_massa_dB', 'NR_com_abs_apoiada_dB', 'NR_com_abs_engastada_dB', 'NR_com_abs_lei_massa_dB'});

disp(Tabela_faces_modelo);
disp(Tabela_geometria_modelo);
disp(Tabela_modelo_teorico);

figure('Position',[50 50 900 500]);
Y_NR_modelos = [NR_teorica_sem_abs,NR_teorica_sem_abs_engastada,NR_teorica_sem_abs_lei_massa,NR_teorica_com_abs,NR_teorica_com_abs_engastada,NR_teorica_com_abs_lei_massa];
h_NR_modelos = plotarLinhasPadrao((1:numel(rotulos_modelo)).',Y_NR_modelos); hold on;
yline(0,'k-','LineWidth',1.0,'HandleVisibility','off');
xlabel('Frequência [Hz]'); ylabel('Redução sonora teórica, NR [dB]');
title(sprintf('Modelos teóricos da clausura - %d faces radiantes',numero_faces_radiantes));
legend(h_NR_modelos,{'Sem absorvedor - apoiada','Sem absorvedor - engastada','Sem absorvedor - lei da massa','Com absorvedor - apoiada','Com absorvedor - engastada','Com absorvedor - lei da massa'},'Location','best');
grid on; box on; aplicarFormato();
ax = gca; ax.XTick = 1:numel(rotulos_modelo); ax.XTickLabel = rotulos_modelo; ax.XTickLabelRotation = 45; ax.XLim = [0.5 numel(rotulos_modelo)+0.5];

%% 12. Comparação entre redução teórica e experimental

D_W_exp_sem_abs = D_W_clausura(idx_modelo);
D_W_exp_com_abs = D_W_clausura_absorvedor(idx_modelo);

% Garante vetores-coluna.
D_W_exp_sem_abs = D_W_exp_sem_abs(:);
D_W_exp_com_abs = D_W_exp_com_abs(:);

Tabela_comparacao_NR = table( f_modelo_nominal, NR_teorica_sem_abs, NR_teorica_sem_abs_engastada, NR_teorica_sem_abs_lei_massa, D_W_exp_sem_abs, NR_teorica_com_abs, NR_teorica_com_abs_engastada, NR_teorica_com_abs_lei_massa, D_W_exp_com_abs, 'VariableNames', { 'Frequencia_nominal_Hz', 'NR_sem_abs_apoiada_dB', 'NR_sem_abs_engastada_dB', 'NR_sem_abs_lei_massa_dB', 'ILW_experimental_sem_abs_dB', 'NR_com_abs_apoiada_dB', 'NR_com_abs_engastada_dB', 'NR_com_abs_lei_massa_dB', 'ILW_experimental_com_abs_dB'});

disp(Tabela_comparacao_NR);

%% 12.1 Faixa exibida nos gráficos: 800 Hz a 6,3 kHz

faixa_plot_comparacao = f_modelo_nominal >= 800 & f_modelo_nominal <= 6300;

% Para a perda por inserção experimental, tanto a fonte sem clausura quanto
% a configuração com clausura precisam atender aos critérios de ruído de
% fundo. A mesma máscara é aplicada aos modelos teóricos para que os níveis
% globais apresentados em cada legenda usem exatamente as mesmas bandas.
criterio_fonte_modelo = resultados(1).atende_criterio_fundo(idx_modelo);

criterio_clausura_modelo = resultados(2).atende_criterio_fundo(idx_modelo);

criterio_clausura_material_modelo = resultados(3).atende_criterio_fundo(idx_modelo);

mascara_comparacao_sem_abs = faixa_plot_comparacao & criterio_fonte_modelo(:) & criterio_clausura_modelo(:);

mascara_comparacao_com_abs = faixa_plot_comparacao & criterio_fonte_modelo(:) & criterio_clausura_material_modelo(:);

assert(any(mascara_comparacao_sem_abs), ['Nenhuma banda entre 800 Hz e 6,3 kHz atende aos critérios de ' 'ruído de fundo para a comparação sem absorvedor.']);

assert(any(mascara_comparacao_com_abs), ['Nenhuma banda entre 800 Hz e 6,3 kHz atende aos critérios de ' 'ruído de fundo para a comparação com absorvedor.']);

%% 12.2 Níveis de potência sonora teóricos por banda

% Espectro experimental da fonte sem clausura na faixa do modelo.
Lw_fonte_modelo = Lw_sem_clausura(idx_modelo);
Lw_fonte_modelo = Lw_fonte_modelo(:);

% Níveis previstos após a aplicação da redução sonora de cada modelo.
Lw_teorico_sem_abs_lei_massa = Lw_fonte_modelo - NR_teorica_sem_abs_lei_massa;

Lw_teorico_sem_abs_engastada = Lw_fonte_modelo - NR_teorica_sem_abs_engastada;

Lw_teorico_com_abs_lei_massa = Lw_fonte_modelo - NR_teorica_com_abs_lei_massa;

Lw_teorico_com_abs_engastada = Lw_fonte_modelo - NR_teorica_com_abs_engastada;

% Níveis experimentais das duas configurações na faixa do modelo.
Lw_experimental_sem_abs_modelo = Lw_com_clausura(idx_modelo);

Lw_experimental_com_abs_modelo = Lw_com_clausura_material(idx_modelo);

%% 12.3 Níveis globais para as legendas das comparações

% Clausura sem absorvedor: 800 Hz a 6,3 kHz, somente bandas válidas.
Lw_global_teorico_sem_abs_lei_massa = nivelGlobalEnergetico( Lw_teorico_sem_abs_lei_massa( mascara_comparacao_sem_abs));

Lw_global_teorico_sem_abs_engastada = nivelGlobalEnergetico( Lw_teorico_sem_abs_engastada( mascara_comparacao_sem_abs));

Lw_global_experimental_sem_abs = nivelGlobalEnergetico( Lw_experimental_sem_abs_modelo( mascara_comparacao_sem_abs));

% Clausura com absorvedor: 800 Hz a 6,3 kHz, somente bandas válidas.
Lw_global_teorico_com_abs_lei_massa = nivelGlobalEnergetico( Lw_teorico_com_abs_lei_massa( mascara_comparacao_com_abs));

Lw_global_teorico_com_abs_engastada = nivelGlobalEnergetico( Lw_teorico_com_abs_engastada( mascara_comparacao_com_abs));

Lw_global_experimental_com_abs = nivelGlobalEnergetico( Lw_experimental_com_abs_modelo( mascara_comparacao_com_abs));

Tabela_Lw_global_comparacao = table( ["Sem absorvedor - lei da massa"; "Sem absorvedor - Sharp-Bies"; "Sem absorvedor - experimental"; "Com absorvedor - lei da massa"; "Com absorvedor - Sharp-Bies"; "Com absorvedor - experimental"], [Lw_global_teorico_sem_abs_lei_massa; Lw_global_teorico_sem_abs_engastada; Lw_global_experimental_sem_abs; Lw_global_teorico_com_abs_lei_massa; Lw_global_teorico_com_abs_engastada; Lw_global_experimental_com_abs], 'VariableNames', { 'Configuracao', 'Lw_global_800_a_6300_Hz_dB'});

disp(Tabela_Lw_global_comparacao);

fprintf(['\nBandas usadas na comparação sem absorvedor ' '[800 Hz a 6,3 kHz]: %s.\n'], listarFrequencias( rotulos_modelo, mascara_comparacao_sem_abs));

fprintf(['Bandas usadas na comparação com absorvedor ' '[800 Hz a 6,3 kHz]: %s.\n'], listarFrequencias( rotulos_modelo, mascara_comparacao_com_abs));

%% 12.4 Dados efetivamente exibidos nos gráficos

comparacao_sem_abs = [NR_teorica_sem_abs_lei_massa(mascara_comparacao_sem_abs),NR_teorica_sem_abs_engastada(mascara_comparacao_sem_abs),D_W_exp_sem_abs(mascara_comparacao_sem_abs)];
comparacao_com_abs = [NR_teorica_com_abs_lei_massa(mascara_comparacao_com_abs),NR_teorica_com_abs_engastada(mascara_comparacao_com_abs),D_W_exp_com_abs(mascara_comparacao_com_abs)];
rotulos_comparacao_sem_abs = rotulos_modelo(mascara_comparacao_sem_abs);
rotulos_comparacao_com_abs = rotulos_modelo(mascara_comparacao_com_abs);
legenda_faces = sprintf('%d faces radiantes',numero_faces_radiantes);

%% Clausura sem absorvedor
x_sem_abs = (1:numel(rotulos_comparacao_sem_abs)).';
figure('Position',[50 50 760 470]);
h_sem_abs = plotarLinhasPadrao(x_sem_abs,comparacao_sem_abs); hold on;
yline(0,'k-','LineWidth',1.0,'HandleVisibility','off');
xlabel('Frequência [Hz]'); ylabel('{\it NR} [dB]','Interpreter','tex'); title({'Clausura sem absorvedor',legenda_faces});
legenda_comparacao_sem_abs = {sprintf('Teórica - apenas lei da massa ({\\it L}_{W,{\\rm global}} = %s dB)',formatarDecimal(Lw_global_teorico_sem_abs_lei_massa)),sprintf('Teórica - Sharp-Bies ({\\it L}_{W,{\\rm global}} = %s dB)',formatarDecimal(Lw_global_teorico_sem_abs_engastada)),sprintf('Experimental - ISO 3741 ({\\it L}_{W,{\\rm global}} = %s dB)',formatarDecimal(Lw_global_experimental_sem_abs))};
h_legenda_sem_abs = legend(h_sem_abs,legenda_comparacao_sem_abs,'Location','northeast','Interpreter','tex');
grid on; box on; aplicarFormato();
ax = gca; ax.XTick = x_sem_abs; ax.XTickLabel = rotulos_comparacao_sem_abs; ax.XTickLabelRotation = 45; ax.XLim = [0.5 numel(x_sem_abs)+0.5]; ax.YLim = [0 80];
h_legenda_sem_abs.Interpreter = 'tex'; h_legenda_sem_abs.FontName = ax.FontName; h_legenda_sem_abs.FontSize = 12.5;

%% Clausura com absorvedor
x_com_abs = (1:numel(rotulos_comparacao_com_abs)).';
figure('Position',[50 50 760 470]);
h_com_abs = plotarLinhasPadrao(x_com_abs,comparacao_com_abs); hold on;
yline(0,'k-','LineWidth',1.0,'HandleVisibility','off');
xlabel('Frequência [Hz]'); ylabel('{\it NR} [dB]','Interpreter','tex'); title({'Clausura com absorvedor',legenda_faces});
legenda_comparacao_com_abs = {sprintf('Teórica - apenas lei da massa ({\\it L}_{W,{\\rm global}} = %s dB)',formatarDecimal(Lw_global_teorico_com_abs_lei_massa)),sprintf('Teórica - Sharp-Bies ({\\it L}_{W,{\\rm global}} = %s dB)',formatarDecimal(Lw_global_teorico_com_abs_engastada)),sprintf('Experimental - ISO 3741 ({\\it L}_{W,{\\rm global}} = %s dB)',formatarDecimal(Lw_global_experimental_com_abs))};
h_legenda_com_abs = legend(h_com_abs,legenda_comparacao_com_abs,'Location','northeast','Interpreter','tex');
grid on; box on; aplicarFormato();
ax = gca; ax.XTick = x_com_abs; ax.XTickLabel = rotulos_comparacao_com_abs; ax.XTickLabelRotation = 45; ax.XLim = [0.5 numel(x_com_abs)+0.5]; ax.YLim = [0 80];
h_legenda_com_abs.Interpreter = 'tex'; h_legenda_com_abs.FontName = ax.FontName; h_legenda_com_abs.FontSize = 12.5;

%% Funções locais

function L_global = nivelGlobalEnergetico(L_bandas)
%NIVELGLOBALENERGETICO
% Soma energeticamente níveis de potência sonora em decibéis.

    L_bandas = L_bandas(:);

    assert(~isempty(L_bandas), 'É necessária ao menos uma banda para calcular o nível global.');

    assert(all(isfinite(L_bandas)), 'Os níveis usados no cálculo global devem ser finitos.');

    L_global = 10 .* log10( sum(10.^(0.1 .* L_bandas)));
end


function texto = formatarDecimal(valor)
%FORMATARDECIMAL Formata um valor com uma casa decimal e vírgula.

    assert(isscalar(valor) && isfinite(valor), 'O valor a formatar deve ser um escalar finito.');

    texto = strrep( sprintf('%.1f', valor), '.', ',');
end



function [TL, f11, fc] = calcularTLSharpPainel( frequencias, a, b, h, rho_material, E, nu, eta, rho0, c, fator_f11)

%CALCULARTLSHARPPAINEL
% Calcula o TL de um painel simples isotrópico em terços de oitava.
%
% Sequência de Bies e Hansen:
% - f < 0,5 f11: Eq. (8.43), região controlada pela rigidez;
% - 0,5 f11 <= f < 1,5 f11: Eq. (8.44), primeira ressonância;
% - 1,5 f11 <= f <= 0,5 fc: Eq. (8.38), lei da massa de Sharp;
% - 0,5 fc < f < fc: interpolação linear em TL versus log10(f);
% - f >= fc: Eq. (8.40), até encontrar novamente a lei da massa.

    % Valor padrão: placa simplesmente apoiada.
    if nargin < 11 || isempty(fator_f11)
        fator_f11 = 1;
    end

    assert(isfinite(fator_f11) && fator_f11 > 0, 'O fator de correção de f11 deve ser positivo.');

    frequencias = frequencias(:);

    assert(all(frequencias > 0), 'As frequências devem ser maiores que zero.');
    assert(all([a, b, h, rho_material, E, eta, rho0, c] > 0), 'Os parâmetros físicos devem ser positivos.');
    assert(nu > -1 && nu < 0.5, 'O coeficiente de Poisson deve estar entre -1 e 0,5.');

    m = rho_material .* h;
    B = E .* h.^3 ./ (12 .* (1 - nu.^2)); % Eq. (8.2b)

    % Frequência fundamental para placa simplesmente apoiada.
    f11_apoiada = (pi ./ 2) .* sqrt(B ./ m) .* (1 ./ a.^2 + 1 ./ b.^2);

    % Correção para a condição de contorno selecionada.
    f11 = fator_f11 .* f11_apoiada;

    % Eq. (8.3).
    fc = (c.^2 ./ (2 .* pi)) .* sqrt(m ./ B);

    TL = zeros(size(frequencias));

    for k = 1:numel(frequencias)
        f = frequencias(k);

        % Eq. (8.38): lei da massa de Sharp para terços de oitava.
        TL_massa = 10 .* log10( 1 + (pi .* f .* m ./ (rho0 .* c)).^2) - 5.5;

        if f < 0.5 .* f11
            % Forma equivalente da Eq. (8.43), escrita em função de f11.
            % Para fator_f11 = 1, fornece exatamente o resultado original.
            TL(k) = 20 .* log10( pi .* m .* f11.^2 ./ (rho0 .* c .* f));

        elseif f < 1.5 .* f11
            % Eq. (8.44). O livro orienta TL = 0 quando o fator de perdas
            % é pequeno em relação a rho*c/(2*pi*f*m).
            limite_eta = rho0 .* c ./ (2 .* pi .* f .* m);

            TL_ressonancia = 20 .* log10(f11) + 20 .* log10(m) + 20 .* log10(eta) - 20 .* log10(rho0 .* c ./ pi);

            if eta <= limite_eta
                TL(k) = 0;
            else
                TL(k) = max(0, TL_ressonancia);
            end

        elseif f <= 0.5 .* fc
            TL(k) = TL_massa;

        elseif f < fc
            % Interpolação prescrita entre 0,5fc e fc em gráfico
            % TL versus log10(f).
            f_A = 0.5 .* fc;
            f_B = fc;

            TL_A = 10 .* log10( 1 + (pi .* f_A .* m ./ (rho0 .* c)).^2) - 5.5;

            TL_B = 10 .* log10( 1 + (pi .* f_B .* m ./ (rho0 .* c)).^2) + 10 .* log10( 2 .* eta .* f_B ./ (pi .* fc));

            fracao = (log10(f) - log10(f_A)) ./ (log10(f_B) - log10(f_A));

            TL(k) = TL_A + fracao .* (TL_B - TL_A);

        else
            % Eq. (8.40), usada somente até reencontrar a lei da massa.
            TL_amortecimento = 10 .* log10( 1 + (pi .* f .* m ./ (rho0 .* c)).^2) + 10 .* log10( 2 .* eta .* f ./ (pi .* fc));

            TL(k) = min(TL_amortecimento, TL_massa);
        end
    end
end


function TL = calcularTLLeiMassaSharpTerco( frequencias, massa_superficial, rho0, c)
%CALCULARTLLEIMASSASHARPTERCO
% Calcula o TL simplificado pela lei da massa de Sharp para bandas de
% terço de oitava, conforme a Eq. (8.38) de Bies e Hansen.
%
% Este modelo não representa rigidez, ressonâncias de placa, coincidência,
% amortecimento, frestas ou acoplamento estrutural.

    frequencias = frequencias(:);

    assert(all(frequencias > 0), 'As frequências devem ser maiores que zero.');

    assert(all([massa_superficial, rho0, c] > 0), 'Os parâmetros físicos devem ser positivos.');

    TL = 10 .* log10( 1 + (pi .* frequencias .* massa_superficial ./ (rho0 .* c)).^2) - 5.5;
end


function [alfa, Zs, Zc, kc, rho0, c0] = coefAbsorcaoJCA( freq, d, sigma, phi, alfa_inf, Lambda, Lambda_linha, temperatura_JCA, p0_JCA)
%COEFABSORCAOJCA Coeficiente de absorção normal pelo modelo JCA.
%
% Material poroso de estrutura rígida, camada homogênea sobre terminação
% rígida e incidência normal.
%
% Entradas:
%   freq              - frequências [Hz]
%   d                 - espessura [m]
%   sigma             - resistividade ao fluxo [Pa.s/m^2]
%   phi               - porosidade [-]
%   alfa_inf          - tortuosidade [-]
%   Lambda            - comprimento característico viscoso [m]
%   Lambda_linha      - comprimento característico térmico [m]
%   temperatura_JCA   - temperatura do ar [graus Celsius]
%   p0_JCA            - pressão atmosférica [Pa]
%
% Saídas:
%   alfa              - absorção em incidência normal [-]
%   Zs                - impedância superficial normal [Pa.s/m]
%   Zc                - impedância característica do fluido equivalente
%   kc                - número de onda complexo do fluido equivalente
%   rho0, c0          - propriedades do ar usadas no cálculo

    if nargin < 8 || isempty(temperatura_JCA)
        temperatura_JCA = 21.25;
    end

    if nargin < 9 || isempty(p0_JCA)
        p0_JCA = 101.1e3;
    end

    formato_original = size(freq);
    freq = freq(:);

    assert(all(freq > 0), 'Todas as frequências devem ser maiores que zero.');

    assert(all([ d, sigma, phi, alfa_inf, Lambda, Lambda_linha, p0_JCA] > 0), 'Os parâmetros do material poroso devem ser positivos.');

    assert(phi <= 1, 'A porosidade não pode ser maior que 1.');

    gama = 1.4;
    R_ar = 287.05;  % [J/(kg.K)]
    mu = 1.82e-5;   % viscosidade dinâmica [Pa.s]
    Pr = 0.71;      % número de Prandtl [-]

    temperatura_K = temperatura_JCA + 273.15;
    rho0 = p0_JCA ./ (R_ar .* temperatura_K);
    c0 = sqrt(gama .* R_ar .* temperatura_K);

    omega = 2 .* pi .* freq;

    % Massa específica dinâmica efetiva do fluido nos poros.
    termo_viscoso_1 = (phi .* sigma) ./ (1i .* omega .* rho0 .* alfa_inf);

    termo_viscoso_2 = (4 .* omega .* rho0 .* mu .* alfa_inf.^2) ./ (sigma.^2 .* phi.^2 .* Lambda.^2);

    rho_ef = rho0 .* alfa_inf .* (1 + termo_viscoso_1 .* sqrt(1 + 1i .* termo_viscoso_2));

    % Módulo de compressibilidade dinâmico efetivo.
    termo_termico_1 = (1i .* 8 .* mu) ./ (omega .* Pr .* Lambda_linha.^2 .* rho0);

    termo_termico_2 = (1i .* omega .* Pr .* rho0 .* Lambda_linha.^2) ./ (16 .* mu);

    funcao_termica = 1 - termo_termico_1 .* sqrt(1 + termo_termico_2);

    K_ef = (gama .* p0_JCA) ./ (gama - (gama - 1) ./ funcao_termica);

    % Propriedades do fluido equivalente macroscópico.
    rho_eq = rho_ef ./ phi;
    K_eq = K_ef ./ phi;

    Zc = sqrt(rho_eq .* K_eq);
    kc = omega .* sqrt(rho_eq ./ K_eq);

    % Impedância superficial de uma camada apoiada em parede rígida.
    Zs = -1i .* Zc .* cot(kc .* d);

    Z0 = rho0 .* c0;

    R_normal = (Zs - Z0) ./ (Zs + Z0);

    alfa = real(1 - abs(R_normal).^2);
    alfa = min(max(alfa, 0), 1);

    alfa = reshape(alfa, formato_original);
    Zs = reshape(Zs, formato_original);
    Zc = reshape(Zc, formato_original);
    kc = reshape(kc, formato_original);
end


function alpha_terco = integrarCoeficienteTercoNormalizado( freq_fina, alpha_fina, frequencias_centrais)
%INTEGRARCOEFICIENTETERCONORMALIZADO
% Obtém coeficientes médios em bandas de um terço de oitava a partir de
% uma curva em banda estreita.
%
% Os limites são:
%   f_inf = fc / 2^(1/6)
%   f_sup = fc * 2^(1/6)
%
% A média é calculada por integração em frequência linear:
%   alpha_b = integral(alpha(f) df) / (f_sup - f_inf)
%
% Isso equivale a assumir densidade espectral de potência incidente
% aproximadamente constante por hertz dentro de cada banda.

    freq_fina = freq_fina(:);
    alpha_fina = alpha_fina(:);
    formato_original = size(frequencias_centrais);
    frequencias_centrais = frequencias_centrais(:);

    assert(numel(freq_fina) == numel(alpha_fina), 'freq_fina e alpha_fina devem possuir o mesmo comprimento.');

    assert(all(diff(freq_fina) > 0), 'freq_fina deve ser estritamente crescente.');

    razao_limite = 2.^(1./6);

    alpha_terco = zeros(size(frequencias_centrais));

    for ib = 1:numel(frequencias_centrais)

        f_c = frequencias_centrais(ib);
        f_inf = f_c ./ razao_limite;
        f_sup = f_c .* razao_limite;

        assert(f_inf >= freq_fina(1) && f_sup <= freq_fina(end), ['A curva em banda estreita não cobre integralmente a banda ' 'centrada em %.3f Hz.'], f_c);

        dentro_banda = freq_fina > f_inf & freq_fina < f_sup;

        f_integracao = [ f_inf; freq_fina(dentro_banda); f_sup];

        alpha_integracao = interp1( freq_fina, alpha_fina, f_integracao, 'pchip');

        alpha_terco(ib) = trapz(f_integracao, alpha_integracao) ./ (f_sup - f_inf);
    end

    alpha_terco = min(max(real(alpha_terco), 0), 1);
    alpha_terco = reshape(alpha_terco, formato_original);
end



function Lp = carregarTresMicrofones(pasta)
% Carrega Lp_terco_mic1.mat, Lp_terco_mic2.mat e Lp_terco_mic3.mat.

    Lp = [];

    for im = 1:3
        arquivo = fullfile(pasta, sprintf('Lp_terco_mic%d.mat', im));

        if ~isfile(arquivo)
            error('Arquivo não encontrado: %s', arquivo);
        end

        conteudo = load(arquivo);
        nome_variavel = sprintf('Lp_terco_mic%d', im);

        if ~isfield(conteudo, nome_variavel)
            error('A variável %s não existe em %s.', nome_variavel, arquivo);
        end

        vetor = conteudo.(nome_variavel)(:);

        if isempty(Lp)
            Lp = zeros(numel(vetor), 3);
        elseif size(Lp, 1) ~= numel(vetor)
            error('Os microfones da pasta %s têm números de bandas diferentes.', pasta);
        end

        Lp(:, im) = vetor;
    end
end

function Lm = mediaEnergetica(L, dimensao)
% Média energética de níveis em decibéis.

    Lm = 10 .* log10(mean(10.^(L ./ 10), dimensao));
end

function valores_alinhados = alinharPorFrequencia( frequencias_origem, valores_origem, frequencias_destino)
% Alinha um vetor de valores às frequências desejadas.

    frequencias_origem = frequencias_origem(:);
    valores_origem = valores_origem(:);
    frequencias_destino = frequencias_destino(:);

    assert(numel(frequencias_origem) == numel(valores_origem), 'fc e T60_total possuem comprimentos diferentes.');

    valores_alinhados = zeros(size(frequencias_destino));

    for k = 1:numel(frequencias_destino)
        [erro, indice] = min(abs( frequencias_origem - frequencias_destino(k)));

        tolerancia = max(1e-6, 1e-3 * frequencias_destino(k));

        if erro > tolerancia
            error('Não foi encontrado T60 para a frequência %.3f Hz.', frequencias_destino(k));
        end

        valores_alinhados(k) = valores_origem(indice);
    end
end

function plotarMicrofones(Lp_mics,rotulos_freq,titulo,cores_mics)
    x = (1:numel(rotulos_freq)).';
    figure('Position',[50 50 600 450]); hold on;
    marcadores = {'o','s','^'}; h = gobjects(size(Lp_mics,2),1);
    for im = 1:size(Lp_mics,2)
        cor = cores_mics(min(im,size(cores_mics,1)),:);
        h(im) = plot(x,Lp_mics(:,im),'-','Color',cor,'Marker',marcadores{min(im,numel(marcadores))},'LineWidth',1.6,'MarkerSize',5,'MarkerFaceColor',cor);
    end
    xlabel('Frequência [Hz]'); ylabel(['NPS [dB ref. 20 ',char(181),'Pa]']); title(titulo);
    legend(h,{'Mic. 1','Mic. 2','Mic. 3'},'Location','northeast'); grid on; box on; aplicarFormato();
    ax = gca; ax.XTick = x; ax.XTickLabel = rotulos_freq; ax.XTickLabelRotation = 45; ax.XLim = [9.5 30.5]; ax.YLim = [0 80];
end

function plotarFonteResidual(resultado,rotulos)
    x = (1:numel(rotulos)).';
    figure('Position',[50 50 600 450]);
    h = plotarLinhasPadrao(x,[resultado.Lp_fonte_medio_nao_corrigido,resultado.Lp_residual_medio]);
    xlabel('Frequência [Hz]'); ylabel(['NPS [dB ref. 20 ',char(181),'Pa]']); title([resultado.nome,' — fonte e ruído residual']);
    legend(h,{'Fonte + residual, não corrigido','Ruído residual'},'Location','best'); grid on; box on; aplicarFormato();
    ax = gca; ax.XTick = x; ax.XTickLabel = rotulos; ax.XTickLabelRotation = 45; ax.XLim = [0.5 numel(x)+0.5]; ax.YLim = [0 80];
end

function plotarDeltaPorMicrofone(resultado,rotulos)
    x = (1:numel(rotulos)).';
    figure('Position',[50 50 600 450]);
    h = plotarLinhasPadrao(x,resultado.delta_por_mic);
    xlabel('Frequência [Hz]'); ylabel('\Delta{\itL}_{p,i} [dB]'); title([resultado.nome,' — diferença por microfone']);
    legend(h,{'Mic. 1','Mic. 2','Mic. 3'},'Location','best'); grid on; box on; aplicarFormato();
    ax = gca; ax.XTick = x; ax.XTickLabel = rotulos; ax.XTickLabelRotation = 45; ax.XLim = [0.5 numel(x)+0.5]; ax.YLim = [0 80];
end

function plotarCriterioMedio(resultado,rotulos)
    n = numel(resultado.delta_media); x = (1:n).';
    figure('Position',[50 50 600 450]);
    h_delta = plotarLinhasPadrao(x,resultado.delta_media); hold on;
    x_degraus = (0.5:1:(n+0.5)).';
    h_criterio = stairs(x_degraus,[resultado.criterio_por_banda;resultado.criterio_por_banda(end)],'k--','LineWidth',1.8);
    h_15 = yline(15,'k:','LineWidth',1.3);
    xlabel('Frequência [Hz]'); ylabel('\Delta{\itL}_p [dB]'); title([resultado.nome,' — critério relativo de ruído residual']);
    legend([h_delta(:);h_criterio;h_15],{'\Delta{\itL}_p medido','Critério relativo','Acima de 15 dB: {\itK}_1 = 0'},'Location','northeast');
    grid on; box on; aplicarFormato();
    ax = gca; ax.XTick = x; ax.XTickLabel = rotulos; ax.XTickLabelRotation = 45; ax.XLim = [0.5 n+0.5]; ax.YLim = [0 80];
    valores_y = unique([ax.YTick(:);6;10;15]).'; valores_y = valores_y(valores_y>=0 & valores_y<=80); ax.YTick = valores_y;
    rotulos_y = arrayfun(@(v) sprintf('%.0f',v),valores_y,'UniformOutput',false);
    for valor = [6 10 15]
        idx = find(abs(valores_y-valor)<1e-9,1); if ~isempty(idx), rotulos_y{idx} = sprintf('\\bf%d',valor); end
    end
    ax.YTickLabel = rotulos_y; ax.TickLabelInterpreter = 'tex'; ax.FontSize = 14;
end

function texto = listarFrequencias(rotulos, mascara)
% Retorna os rótulos das frequências selecionadas, sem usar números de banda.

    rotulos = rotulos(:);
    mascara = logical(mascara(:));

    assert(numel(rotulos) == numel(mascara), 'Os rótulos e a máscara de frequências possuem tamanhos diferentes.');

    if any(mascara)
        texto = strjoin(rotulos(mascara), ', ');
    else
        texto = 'nenhuma';
    end
end

function plotarCriterioAbsoluto(Lp_residual_medio,criterio_absoluto,rotulos)
    Lp_residual_medio = Lp_residual_medio(:); criterio_absoluto = criterio_absoluto(:); n = numel(rotulos); x = (1:n).';
    assert(numel(Lp_residual_medio)==n && numel(criterio_absoluto)==n,'Dados incompatíveis no gráfico do critério absoluto.');
    figure('Position',[50 50 600 450]);
    h = plotarLinhasPadrao(x,[Lp_residual_medio,criterio_absoluto]);
    xlabel('Frequência [Hz]'); ylabel(['NPS [dB ref. 20 ',char(181),'Pa]']); title('Ruído residual médio — critério absoluto da ISO 3741');
    legend(h,{'Ruído residual médio','Limite absoluto'},'Location','northeast'); grid on; box on;
    limite_superior = max([45;Lp_residual_medio;criterio_absoluto]); ylim([0,5*ceil(limite_superior/5)]); aplicarFormato();
    ax = gca; ax.XTick = x; ax.XTickLabel = rotulos; ax.XTickLabelRotation = 45; ax.XLim = [0.5 n+0.5];
end

function aplicarFormato()
% Mantém compatibilidade com a função externa arruma_fig, se disponível.
    if exist('arruma_fig','file') == 2, arruma_fig('no','% 2.1f','virgula'); end
    set(gca,'FontSize',14);
end

function plotarDeltaConfiguracoes(delta_Lp,criterio_relativo,condicoes,rotulos)
    n = size(delta_Lp,1); x = (1:n).';
    figure('Position',[50 50 600 450]);
    h_delta = plotarLinhasPadrao(x,delta_Lp); hold on;
    x_degraus = (0.5:1:(n+0.5)).';
    h_criterio = stairs(x_degraus,[criterio_relativo;criterio_relativo(end)],'k--','LineWidth',1.8);
    h_15dB = yline(15,'k:','LineWidth',1.5);
    xlabel('Frequência [Hz]'); ylabel('\Delta{\itL}_p [dB]'); title('Critério relativo de ruído residual — comparação entre configurações');
    legend([h_delta(:);h_criterio;h_15dB],{condicoes(1).titulo,condicoes(2).titulo,condicoes(3).titulo,'Critério relativo de 6 e 10 dB','Acima de 15 dB: {\itK}_1 = 0'},'Location','northeast');
    grid on; box on; aplicarFormato();
    ax = gca; ax.XTick = x; ax.XTickLabel = rotulos; ax.XTickLabelRotation = 45; ax.XLim = [0.5 n+0.5]; ax.YLim = [0 80];
    valores_y = unique([0:10:80,6,10,15]); ax.YTick = valores_y;
    ax.YTickLabel = arrayfun(@(v) strrep(sprintf('%.1f',v),'.',','),valores_y,'UniformOutput',false);
end

function h = plotarLinhasPadrao(x,Y)
% Plota séries em linhas com cores, marcadores e espessuras consistentes.
    x = x(:); if isvector(Y), Y = Y(:); end
    assert(size(Y,1)==numel(x),'O número de linhas de Y deve coincidir com x.');
    ax = gca; hold(ax,'on'); cores = colororder(ax); marcadores = {'o','s','^','d','v','>','<','p','h','x','+'};
    h = gobjects(size(Y,2),1);
    for j = 1:size(Y,2)
        cor = cores(mod(j-1,size(cores,1))+1,:); marcador = marcadores{mod(j-1,numel(marcadores))+1};
        h(j) = plot(ax,x,Y(:,j),'-','Color',cor,'Marker',marcador,'LineWidth',1.6,'MarkerSize',5,'MarkerFaceColor',cor);
    end
end

function alpha_s = converterNormalParaDifusoLondon(alpha_n)
%CONVERTERNORMALPARADIFUSOLONDON
% Conversão semiempírica de London do coeficiente de incidência normal
% para um coeficiente representativo de campo difuso.
%
% Referência:
% LONDON, A. The Determination of Reverberant Sound Absorption
% Coefficients from Acoustic Impedance Measurements.
% J. Acoust. Soc. Am., 22(2), 263-269, 1950.
% DOI: 10.1121/1.1906600.

    alpha_n = min(max(real(alpha_n), 0), 1);

    alpha_s = zeros(size(alpha_n));

    idx = alpha_n > 0;

    raiz = sqrt(1 - alpha_n(idx));
    delta = 1 - raiz;

    alpha_s(idx) = 4 .* ((1 - raiz) ./ (1 + raiz)) .* (log(2 ./ delta) - (1 + raiz) ./ 2);

    alpha_s = min(max(real(alpha_s), 0), 1);
end


function alpha_destino = interpolarAbsorcaoLog( f_origem, alpha_origem, f_destino)
% Interpolação PCHIP em escala logarítmica de frequência.

    f_origem = f_origem(:);
    alpha_origem = alpha_origem(:);
    formato_destino = size(f_destino);
    f_destino = f_destino(:);

    alpha_destino = interp1( log10(f_origem), alpha_origem, log10(f_destino), 'pchip', NaN);

    alpha_destino(f_destino < f_origem(1)) = alpha_origem(1);

    alpha_destino(f_destino > f_origem(end)) = alpha_origem(end);

    alpha_destino = min(max(real(alpha_destino), 0), 1);

    alpha_destino = reshape( alpha_destino, formato_destino);
end

function fator = fatorF11EngastadaBies(a, b)
%FATORF11ENGASTADABIES
% Fator entre a frequência fundamental de uma placa com quatro bordas
% engastadas e a frequência da mesma placa simplesmente apoiada.
%
% Valores apresentados por Bies e Hansen em função da razão de aspecto.
% Para razões intermediárias, utiliza-se interpolação linear.

    assert(all([a, b] > 0), 'As dimensões da placa devem ser positivas.');

    razao_aspecto = max(a, b) ./ min(a, b);

    razoes_tabela = [ 1.0, 1.5, 2.0, 3.0, 6.0, 8.0, 10.0];

    fatores_tabela = [ 1.83, 1.89, 1.99, 2.11, 2.23, 2.25, 2.26];

    % Evita extrapolar para além da faixa tabelada.
    razao_limitada = min(max( razao_aspecto, razoes_tabela(1)), razoes_tabela(end));

    fator = interp1( razoes_tabela, fatores_tabela, razao_limitada, 'linear');
end

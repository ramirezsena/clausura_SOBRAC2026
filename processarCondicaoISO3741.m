function resultado = processarCondicaoISO3741( ...
    Lp_F1, Lp_F2, Lp_residual, p)
%PROCESSARCONDICAOISO3741
% Executa o processamento pelo método direto da ISO 3741.
%
% Entradas:
%   Lp_F1       - níveis por banda e microfone na posição F1
%   Lp_F2       - níveis por banda e microfone na posição F2
%   Lp_residual - ruído residual por banda e microfone
%   p           - estrutura contendo os parâmetros da sala
%
% Saída:
%   resultado   - estrutura com os resultados intermediários e Lw

    assert(isequal(size(Lp_F1), ...
                   size(Lp_F2), ...
                   size(Lp_residual)), ...
        'F1, F2 e residual devem possuir as mesmas dimensões.');

    assert(isstruct(p), ...
        'O argumento p deve ser uma estrutura.');

    campos_necessarios = {'f', 'A', 'A0', 'S', ...
                          'V', 'c', 'C1', 'C2'};

    for k = 1:numel(campos_necessarios)
        assert(isfield(p, campos_necessarios{k}), ...
            'O campo p.%s não foi definido.', ...
            campos_necessarios{k});
    end

    n_mics = size(Lp_F1, 2);

    %% Média energética entre as posições F1 e F2 para cada microfone

    Lp_fonte_por_mic = mediaEnergeticaLocal( ...
        cat(3, Lp_F1, Lp_F2), 3);

    %% Diferença entre fonte ligada e ruído residual

    delta_por_mic = Lp_fonte_por_mic - Lp_residual;

    %% Correção de ruído residual K1

    [K1, criterio_por_banda, banda_limite_superior] = ...
        calcularK1Local(delta_por_mic, p.f);

    %% Correção individual antes da média espacial

    Lp_corrigido_por_mic = Lp_fonte_por_mic - K1;

    %% Média espacial energética dos níveis corrigidos

    Lp_corrigido_medio = mediaEnergeticaLocal( ...
        Lp_corrigido_por_mic, 2);

    %% Médias não corrigidas para avaliação do critério relativo

    Lp_fonte_medio_nao_corrigido = ...
        mediaEnergeticaLocal(Lp_fonte_por_mic, 2);

    Lp_residual_medio = ...
        mediaEnergeticaLocal(Lp_residual, 2);

    delta_media = ...
        Lp_fonte_medio_nao_corrigido - Lp_residual_medio;

    atende_criterio_medio = ...
        delta_media >= criterio_por_banda;

    %% Cálculo do nível de potência sonora

    f = p.f(:);
    A = p.A(:);

    assert(numel(f) == size(Lp_corrigido_medio, 1), ...
        'p.f possui número de bandas incompatível.');

    assert(numel(A) == size(Lp_corrigido_medio, 1), ...
        'p.A possui número de bandas incompatível.');

    termo_sala = ...
        10 .* log10(A ./ p.A0) ...
        + 4.34 .* (A ./ p.S) ...
        + 10 .* log10( ...
            1 + (p.S .* p.c) ./ (8 .* p.V .* f)) ...
        + p.C1 ...
        + p.C2 ...
        - 6;

    Lw = Lp_corrigido_medio + termo_sala;

    %% Estrutura de saída

    resultado = struct();

    resultado.Lp_fonte_por_mic = ...
        Lp_fonte_por_mic;

    resultado.Lp_residual_por_mic = ...
        Lp_residual;

    resultado.delta_por_mic = ...
        delta_por_mic;

    resultado.K1 = ...
        K1;

    resultado.Lp_corrigido_por_mic = ...
        Lp_corrigido_por_mic;

    resultado.Lp_fonte_medio_nao_corrigido = ...
        Lp_fonte_medio_nao_corrigido;

    resultado.Lp_residual_medio = ...
        Lp_residual_medio;

    resultado.Lp_corrigido_medio = ...
        Lp_corrigido_medio;

    resultado.delta_media = ...
        delta_media;

    resultado.criterio_por_banda = ...
        criterio_por_banda;

    resultado.atende_criterio_medio = ...
        atende_criterio_medio;

    resultado.banda_limite_superior = ...
        banda_limite_superior;

    resultado.Lw = Lw;
    resultado.n_mics = n_mics;
end


function Lm = mediaEnergeticaLocal(L, dimensao)
% Média energética de níveis expressos em decibéis.

    Lm = 10 .* log10( ...
        mean(10.^(L ./ 10), dimensao));
end


function [K1, criterio, banda_limite_superior] = ...
    calcularK1Local(delta_Lp, frequencias)
% Correção de ruído residual por banda e microfone.

    frequencias = frequencias(:);
    n_mics = size(delta_Lp, 2);

    assert(size(delta_Lp, 1) == numel(frequencias), ...
        ['delta_Lp e frequencias possuem números ' ...
         'de bandas incompatíveis.']);

    % Critério relativo:
    % 6 dB entre 100 e 200 Hz e entre 6,3 e 10 kHz;
    % 10 dB entre 250 Hz e 5 kHz.
    criterio = 10 .* ones(size(frequencias));

    faixa_6dB = ...
        frequencias <= 200 | frequencias >= 6300;

    criterio(faixa_6dB) = 6;

    criterio_matriz = repmat( ...
        criterio, 1, n_mics);

    faixa_6dB_matriz = repmat( ...
        faixa_6dB, 1, n_mics);

    K1 = zeros(size(delta_Lp));

    % Entre o critério mínimo e 15 dB:
    % aplicação da equação de correção.
    usar_equacao = ...
        delta_Lp <= 15 & ...
        delta_Lp >= criterio_matriz;

    K1(usar_equacao) = ...
        -10 .* log10( ...
        1 - 10.^(-0.1 .* delta_Lp(usar_equacao)));

    % Abaixo do critério mínimo:
    % valores-limite de correção.
    abaixo_criterio = ...
        delta_Lp < criterio_matriz;

    K1(abaixo_criterio & faixa_6dB_matriz) = 1.26;

    K1(abaixo_criterio & ~faixa_6dB_matriz) = 0.46;

    banda_limite_superior = ...
        any(abaixo_criterio, 2);
end
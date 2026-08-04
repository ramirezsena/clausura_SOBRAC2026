function [alfa, Zs, Zc, kc] = coefAbsorcaoJCA( ...
    freq, d, sigma, phi, alfa_inf, Lambda, Lambda_linha)
%COEFABSORCAOJCA Coeficiente de absorção pelo modelo JCA.
%
% Entradas:
%   freq          - frequências [Hz]
%   d             - espessura do material [m]
%   sigma         - resistividade ao fluxo [Pa.s/m^2 = N.s/m^4]
%   phi           - porosidade [-]
%   alfa_inf      - tortuosidade [-]
%   Lambda        - comprimento característico viscoso [m]
%   Lambda_linha  - comprimento característico térmico [m]
%
% Saídas:
%   alfa - coeficiente de absorção em incidência normal [-]
%   Zs   - impedância superficial [Pa.s/m]
%   Zc   - impedância característica equivalente [Pa.s/m]
%   kc   - número de onda complexo [rad/m]

    formato_original = size(freq);
    freq = freq(:);

    if any(freq <= 0)
        error('Todas as frequências devem ser maiores que zero.');
    end

    %% Condições da caracterização da espuma

    temperatura = 21.25;  % [°C]
    p0 = 101.1e3;         % [Pa]

    % Propriedades aproximadas do ar
    gama = 1.4;
    R_ar = 287.05;        % [J/(kg.K)]
    mu = 1.82e-5;         % viscosidade dinâmica [Pa.s]
    Pr = 0.71;            % número de Prandtl [-]

    temperatura_K = temperatura + 273.15;

    rho0 = p0 / (R_ar * temperatura_K);
    c0 = sqrt(gama * R_ar * temperatura_K);

    omega = 2*pi*freq;

    %% Massa específica dinâmica efetiva

    A = (phi*sigma) ./ ...
        (1i*omega*rho0*alfa_inf);

    B = (4*omega*rho0*mu*alfa_inf^2) ./ ...
        (sigma^2*phi^2*Lambda^2);

    rho_ef = rho0*alfa_inf .* ...
        (1 + A .* sqrt(1 + 1i*B));

    %% Módulo de compressibilidade efetivo

    C = (1i*8*mu) ./ ...
        (omega*Pr*Lambda_linha^2*rho0);

    D = (1i*omega*Pr*rho0*Lambda_linha^2) ./ ...
        (16*mu);

    G = 1 - C .* sqrt(1 + D);

    K_ef = (gama*p0) ./ ...
        (gama - (gama - 1)./G);

    %% Propriedades equivalentes macroscópicas

    rho_eq = rho_ef / phi;
    K_eq = K_ef / phi;

    Zc = sqrt(rho_eq .* K_eq);
    kc = omega .* sqrt(rho_eq ./ K_eq);

    %% Camada sobre terminação rígida

    Zs = -1i .* Zc .* cot(kc*d);

    coef_reflexao = (Zs - rho0*c0) ./ ...
                    (Zs + rho0*c0);

    alfa = real(1 - abs(coef_reflexao).^2);

    %% Retorna no mesmo formato do vetor de frequências

    alfa = reshape(alfa, formato_original);
    Zs   = reshape(Zs, formato_original);
    Zc   = reshape(Zc, formato_original);
    kc   = reshape(kc, formato_original);
end
function saida = grafico3BarrasMedia(v1,v2,v3, titulo, nomeCor, limites)

    freq_terco = [12.5 16 20 25 31.5 40 50 63 80 100  ...
            125 160 200 250 315 400 500 630 800 1000  ...
            1250 1600 2000 2500 3150 4000 5000 6300  ...
            8000 10000 12500 16000];

    rotulos_freq = {'12,5','16','20','25','31,5','40','50','63','80','100', ...
                '125','160','200','250','315','400','500','630','800','1000', ...
                '1250','1600','2000','2500','3150','4000','5000','6300', ...
                '8000','10000','12500','16000'};

    indice_1000 = find(freq_terco == 1000);

    indice_inicial = indice_1000 + limites(1);
    indice_final   = indice_1000 + limites(2);

    indice_inicial = max(indice_inicial, 1);
    indice_final   = min(indice_final, length(freq_terco));

    azul_escuro = [0.00 0.25 0.50];
    azul_medio  = [0.00 0.45 0.74];
    azul_claro  = [0.40 0.75 0.95];

    azul = [azul_escuro
            azul_medio
            azul_claro];

    azul = azul';

    branco_escuro  = [0.75 0.75 0.75];
    branco_claro  = [1.00 1.00 1.00];
    branco_medio  = [0.90 0.90 0.90];
    
    branco = [branco_escuro
            branco_medio
            branco_claro];

    branco = branco';

    rosa_escuro = [0.55 0.05 0.25];
    rosa_medio  = [0.90 0.25 0.55];
    rosa_claro  = [1.00 0.65 0.78];

    rosa = [rosa_escuro
            rosa_medio
            rosa_claro];

    rosa = rosa';

    if nomeCor=="branco"
        cor = branco;

    elseif nomeCor == "rosa"
        cor = rosa;
    else
        cor = azul;
    
    end

    vetor = [v1(:),v2(:),v3(:)];

    a = 10.^(vetor(:,1)/10);
    b = 10.^(vetor(:,2)/10);
    c = 10.^(vetor(:,3)/10);
    media = 10*log10( 1/size(vetor,2) * (a + b + c) );
    
    figure('Position',[100 100 900 300]);
    plots = bar(vetor);
    plots(1).FaceColor = cor(:,1);
    plots(2).FaceColor = cor(:,2);
    plots(3).FaceColor = cor(:,3);
    
    hold on
    plot(media,'k', 'LineWidth',1.5);
    
    xlabel('Frequência [Hz]');
    ylabel('NPS [dB] - ref.: 20 \muPa');
    
    grid on
    box on
    
    title(titulo);
    
    set(gca,'XScale','linear')
    set(gca,'FontSize',12)
    
    xticks(indice_inicial:indice_final)
    xticklabels(rotulos_freq(indice_inicial:indice_final))
    xlim([indice_inicial - 0.5, indice_final + 0.5])
    ylim([0 80])

    xtickangle(90)
    legend('Mic. 1','Mic. 2','Mic. 3','Média','Location','best')

end
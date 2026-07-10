# Pós-processamento de medições de clausura acústica

Este repositório contém os scripts de pós-processamento utilizados para analisar medições acústicas realizadas em diferentes configurações de clausura. O objetivo principal é comparar os níveis de pressão sonora em bandas de terço de oitava para diferentes condições experimentais, fontes sonoras e posições de microfone.

## Descrição geral

O processamento é realizado no MATLAB, utilizando arquivos `.mat` previamente gerados a partir das medições. Os dados são analisados em bandas de terço de oitava, com gráficos de barras representando o nível de pressão sonora para cada frequência central.

As medições consideradas envolvem duas fontes sonoras, três microfones e diferentes configurações da clausura acústica.

## Condições analisadas

As condições experimentais consideradas são:

- ruído branco sem clausura;
- ruído rosa sem clausura;
- ruído branco com clausura;
- ruído rosa com clausura;
- ruído branco com clausura e material absorvedor;
- ruído rosa com clausura e material absorvedor;

As análises são realizadas separadamente para a Fonte 1 e para a Fonte 2.

## Estrutura das pastas

A organização dos dados segue a seguinte estrutura:

figuras_F1_branco/
figuras_F1_branco_clausura/
figuras_F1_branco_clausura_material/
figuras_F1_rosa/
figuras_F1_rosa_clausura/
figuras_F1_rosa_clausura_material/


figuras_F2_branco/
figuras_F2_branco_clausura/
figuras_F2_branco_clausura_material/
figuras_F2_rosa/
figuras_F2_rosa_clausura/
figuras_F2_rosa_clausura_material/


figuras_residual_inicial/
figuras_residual_final/

## Arquivos de entrada

Cada pasta de medição contém arquivos `.mat` com os níveis de pressão sonora em bandas de terço de oitava para cada microfone.

Os principais arquivos utilizados são:

Lp_terco_mic1.mat
Lp_terco_mic2.mat
Lp_terco_mic3.mat
f_terco.mat

Onde:

- `Lp_terco_mic1.mat`: nível de pressão sonora em bandas de terço de oitava para o microfone 1;
- `Lp_terco_mic2.mat`: nível de pressão sonora em bandas de terço de oitava para o microfone 2;
- `Lp_terco_mic3.mat`: nível de pressão sonora em bandas de terço de oitava para o microfone 3;
- `f_terco.mat`: frequências centrais das bandas de terço de oitava.

## Código principal

O código principal está organizado em Live Script do MATLAB.

Arquivo principal:

processamento_clausura_sobrac_.mlx

O script realiza as seguintes etapas:

1. limpeza das variáveis do ambiente;
2. carregamento dos arquivos de medição;
3. definição das cores utilizadas nos gráficos;
4. geração dos gráficos individuais por microfone;
5. geração dos gráficos comparativos entre os microfones;
6. organização dos resultados por fonte sonora e condição experimental.

## Saídas geradas

O código gera gráficos de barras com os níveis de pressão sonora em bandas de terço de oitava.

As principais saídas são:

- gráficos individuais para cada microfone;
- gráficos comparativos entre os microfones 1, 2 e 3;
- comparação entre Fonte 1 e Fonte 2;
- comparação entre diferentes configurações da clausura acústica.

Os gráficos apresentam:

- eixo x: frequência central da banda de terço de oitava, em Hz;
- eixo y: nível de pressão sonora, em dB;
- referência de pressão sonora: 20 µPa.

## Observações sobre os caminhos dos arquivos

Os caminhos dos arquivos no código estão definidos de forma absoluta, no formato:

C:\Users\Ramirez\Documents\MATLAB\...

Portanto, para executar o código em outro computador, é necessário ajustar os caminhos de carregamento dos arquivos `.mat`.

## Frequências centrais utilizadas

Os gráficos utilizam os rótulos nominais das bandas de terço de oitava:

12,5 Hz
16 Hz
20 Hz
25 Hz
31,5 Hz
40 Hz
50 Hz
63 Hz
80 Hz
100 Hz
125 Hz
160 Hz
200 Hz
250 Hz
315 Hz
400 Hz
500 Hz
630 Hz
800 Hz
1000 Hz
1250 Hz
1600 Hz
2000 Hz
2500 Hz
3150 Hz
4000 Hz
5000 Hz
6300 Hz
8000 Hz
10000 Hz
12500 Hz
16000 Hz
20000 Hz

## Requisitos

Para executar o processamento, é necessário:

- MATLAB;
- arquivos `.mat` das medições;
- Live Editor do MATLAB para abrir o arquivo `.mlx`.

## Objetivo da análise

A análise busca verificar a variação do nível de pressão sonora em função da frequência para diferentes configurações de tratamento da clausura. Dessa forma, é possível observar o efeito da clausura e do material absorvente medida nos microfones.

## Autor

Projeto desenvolvido para análise de medições acústicas relacionadas ao desempenho de uma clausura sonora.

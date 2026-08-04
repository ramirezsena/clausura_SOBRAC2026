# Códigos MATLAB — Clausura Acústica SOBRAC 2026

Este repositório reúne os códigos MATLAB utilizados no processamento das medições e nos cálculos apresentados no artigo sobre a clausura acústica.

## Objetivo

Os códigos permitem:

- processar níveis de pressão sonora em bandas de 1/3 de oitava;
- aplicar as correções de ruído residual e calcular níveis de potência sonora conforme a ISO 3741;
- calcular a perda por inserção da clausura;
- estimar a perda por transmissão pelas formulações de Sharp–Bies e pela lei da massa;
- calcular a absorção da espuma pelo modelo Johnson–Champoux–Allard (JCA);
- converter a absorção em incidência normal para uma estimativa de campo difuso pelo método de London;
- gerar tabelas e gráficos usados na análise do artigo.

## Arquivos principais

### `PRINCIPAL.m`

Script principal do projeto. Reúne o fluxo completo de cálculo, desde o carregamento das medições até a comparação entre os resultados experimentais e teóricos.

É o arquivo que deve ser executado para reproduzir os resultados do artigo.

### `processarCondicaoISO3741.m`

Processa uma configuração de medição conforme o método direto da ISO 3741. Calcula, entre outros resultados:

- correção de ruído residual;
- média energética entre microfones e posições da fonte;
- nível de potência sonora por banda;
- verificação dos critérios de ruído de fundo.

### `coefAbsorcaoJCA.m`

Calcula o coeficiente de absorção em incidência normal de uma camada porosa de estrutura rígida pelo modelo JCA.

A função utiliza propriedades como resistividade ao fluxo, porosidade, tortuosidade e comprimentos característicos viscoso e térmico.

### `modos_plots_3D.m`

Código auxiliar para visualização ou análise de modos em gráficos tridimensionais.

### `T60_cam_rev.mat`

Arquivo contendo os tempos de reverberação da câmara usados no cálculo da área de absorção equivalente.

## Como executar

1. Baixe ou clone o repositório.
2. Abra a pasta do projeto no MATLAB.
3. Mantenha os arquivos `.m` e `T60_cam_rev.mat` na mesma pasta, ou adicione essa pasta ao *path* do MATLAB.
4. Abra `PRINCIPAL.m`.
5. Altere a variável `pasta_base` para o local onde estão armazenados os dados das medições.
6. Confirme que as pastas e os arquivos `.mat` das medições mantêm os nomes esperados pelo código.
7. Execute `PRINCIPAL.m`.

Exemplo de ajuste:

```matlab
pasta_base = 'C:\caminho\para\os\dados';
```

## Estrutura esperada dos dados

O script principal carrega arquivos de níveis sonoros para:

- posições de fonte `F1` e `F2`;
- ruído branco e ruído rosa;
- fonte sem clausura;
- fonte com clausura;
- fonte com clausura e material absorvedor;
- ruído residual inicial e final.

Cada pasta de medição deve conter:

```text
Lp_terco_mic1.mat
Lp_terco_mic2.mat
Lp_terco_mic3.mat
```

Os nomes das variáveis internas devem acompanhar os nomes dos arquivos, por exemplo:

```matlab
Lp_terco_mic1
```

## Principais resultados

Ao final da execução, o código apresenta no *Command Window* e em figuras:

- critérios relativo e absoluto de ruído residual;
- níveis de potência sonora por banda;
- níveis globais não ponderados;
- perda por inserção da clausura;
- coeficientes de absorção da espuma;
- perda por transmissão das faces;
- redução sonora teórica;
- comparação entre modelos teóricos e resultados experimentais.

## Observações

- Os parâmetros geométricos, propriedades do MDF, características da espuma e condições meteorológicas estão definidos em `PRINCIPAL.m` e devem ser conferidos antes da execução.
- A faixa principal de comparação do artigo é de 100 Hz a 6,3 kHz, respeitando os critérios de ruído residual adotados.
- A quantidade de faces radiantes pode ser selecionada no início do código por meio da variável `numero_faces_radiantes`.
- Algumas rotinas de formatação utilizam a função externa `arruma_fig`. Caso ela não esteja disponível, o código mantém uma formatação básica dos gráficos.

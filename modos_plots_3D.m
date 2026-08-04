clc; clear; close all;

%% Constantes e dimensões da sala
c0 = 340;
Lx = 0.3221; 
Ly = 0.2426; 
Lz = 0.2816;

% Índices dos modos
nx = 1; 
ny = 4; 
nz = 1;

% Frequência modal
fn = (c0/2) * sqrt((nx/Lx)^2 + (ny/Ly)^2 + (nz/Lz)^2);

% Malha de pontos
x = linspace(0, Lx, 80);
y = linspace(0, Ly, 60);
z = linspace(0, Lz, 50);
[X, Y, Z] = meshgrid(x, y, z);

% Campo de pressão modal
P = abs(cos((nx*pi*X)/Lx) .* cos((ny*pi*Y)/Ly) .* cos((nz*pi*Z)/Lz));

% Figura
figure('Color','w');
scatter3(X(:), Y(:), Z(:), 5, P(:), 'filled');
hold on;

% Eixos e proporções
daspect([1 1 1]);
axis tight;
view(3);
xlabel('x [m]', 'Interpreter','latex');
ylabel('y [m]', 'Interpreter','latex');
zlabel('z [m]', 'Interpreter','latex');

% Título
title({['$f_n = ', num2str(fn, '%.2f'), '\ \mathrm{Hz}$'], ...
       ['$n_x = ', num2str(nx), ',\ n_y = ', num2str(ny), ',\ n_z = ', num2str(nz), '$']}, ...
       'Interpreter','latex','FontSize',12);

% Barra de cor
colormap('gray');
clim([0 1]);
cbar = colorbar;
cbar.Ticks = 0:0.1:1.0;
cbar.TickLabels = compose('%.1f', 0:0.1:1.0);
ylabel(cbar, '$|\Psi_n(x,y,z)|$', 'Interpreter', 'latex', 'FontSize', 12);

% Marcação dos limites
xticks([0 Lx]);
yticks([0 Ly]);
zticks([0 Lz]);

% === Linhas pretas contínuas nas 12 arestas ===
lw = 2; % largura da linha

% Coordenadas dos 8 vértices
v = [0   0   0;
     Lx  0   0;
     Lx Ly  0;
     0  Ly  0;
     0   0  Lz;
     Lx  0  Lz;
     Lx Ly  Lz;
     0  Ly  Lz];

% Arestas (pares de índices dos vértices que se conectam)
edges = [1 2; 2 3; 3 4; 4 1; % base
         5 6; 6 7; 7 8; 8 5; % topo
         1 5; 2 6; 3 7; 4 8]; % verticais

% Plotando as linhas pretas contínuas nas arestas
for i = 1:size(edges,1)
    idx1 = edges(i,1);
    idx2 = edges(i,2);
    plot3([v(idx1,1) v(idx2,1)], ...
          [v(idx1,2) v(idx2,2)], ...
          [v(idx1,3) v(idx2,3)], ...
          'k-', 'LineWidth', lw);
end

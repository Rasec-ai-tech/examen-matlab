clear all;
clc;

% --- Paramètres du problème ---
L = 1;              % Longueur du domaine spatial
T_max = 1;          % Temps final
dx = 0.1;           % Pas spatial
dt = 0.01;          % Pas temporel
beta = 0.86;        % Paramètre beta

        % --- Initialisation des grilles ---
x = 0:dx:L;
t = 0:dt:T_max;

% --- Calcul des nombres de points et du paramètre r ---
Nx = length(x);
Nt = length(t);
alpha = -(beta - 1); % Coefficient de diffusion
r = alpha * dt / (dx^2);

fprintf('Coefficient de diffusion alpha = %f\n', alpha);
fprintf('Paramètre r = %f\n', r);
if r <= 0.5
    fprintf('Condition de stabilité r <= 0.5 satisfaite. Le schéma est stable.\n');
else
    fprintf('Condition de stabilité r <= 0.5 NON satisfaite. Le schéma pourrait être instable.\n');
end

% Initialisation de la solution
U = zeros(Nt,Nx);

% --- Condition initiale ---
U(1,:) = cos(2 * pi * x').^2;

% --- Boucle temporelle (Méthode explicite d'Euler) ---
for n = 1:Nt-1
    for i = 2:Nx-1
        U(n+1,i) = U(n,i) + r*(U(n,i+1) - 2*U(n,i) + U(n,i-1));
    end
    U(n+1,1) = 2*t(n+1);
    U(n+1,Nx) = (1-2*r) * U(n,Nx) + 2*r*U(n,Nx-1) + 2*r*dx*(1-t(n));
end

% --- Affichage des résultats à différents temps ---
figure;
hold on;
grid on;
title('Solution numérique de l''équation de transport');
xlabel('Position x');
ylabel('Température u');

plot(x, U(1,:), 'k', 'DisplayName', 't = Os');
plot(x, U(21,:), 'b', 'DisplayName', 't = O.2s');
plot(x, U(41,:), 'g', 'DisplayName', 't = O.4s');
plot(x, U(61,:), 'm', 'DisplayName', 't = O.6s');
plot(x, U(81,:), 'r', 'DisplayName', 't = O.8s');
plot(x, U(101,:), 'c', 'DisplayName', 't = 1s');
legend('Location', 'bestoutside');
hold off;

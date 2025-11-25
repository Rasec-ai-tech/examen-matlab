clc;
clear;

% Initialisation directe des données
A = [10 7 8 7;
     7 5 6 5;
     8 6 10 9;
     7 5 9 10];

b = [4; 3; 3; 1];
n = 4;

% Initialisation des matrices
L = eye(n);       % Matrice identité pour L
U = zeros(n);     % Matrice nulle pour U
x = zeros(n,1);   % Vecteur solution
y = zeros(n,1);   % Vecteur intermédiaire

fprintf('\n========= ÉTAPE 1 : Factorisation LU =========\n');

for k = 1:n
    % Construction de la ligne k de U
    for j = k:n
        somme = 0;
        for s = 1:k-1
            somme = somme + L(k,s) * U(s,j);
        end
        U(k,j) = A(k,j) - somme;
    end

    % Construction de la colonne k de L
    for i = k+1:n
        somme = 0;
        for s = 1:k-1
            somme = somme + L(i,s) * U(s,k);
        end
        L(i,k) = (A(i,k) - somme) / U(k,k);
    end
end

fprintf('\nMatrice L :\n');
for i = 1:n
    for j = 1:n
        fprintf('%8.4f ', L(i,j));
    end
    fprintf('\n');
end

fprintf('\nMatrice U :\n');
for i = 1:n
    for j = 1:n
        fprintf('%8.4f ', U(i,j));
    end
    fprintf('\n');
end

fprintf('\n========= ÉTAPE 2 : Résolution de LY = b =========\n');
for k = 1:n
    somme = 0;
    for i = 1:k-1
        somme = somme + L(k,i) * y(i);
    end
    y(k) = (b(k) - somme) / L(k,k);
end

fprintf('\n========= ÉTAPE 3 : Résolution de UX = Y =========\n');
for k = n:-1:1
    somme = 0;
    for j = k+1:n
        somme = somme + U(k,j) * x(j);
    end
    x(k) = (y(k) - somme) / U(k,k);
end

fprintf('\n========= SOLUTION FINALE =========\n');
fprintf('X = [ ');
for i = 1:n
    fprintf('%.4f ', x(i));
end
fprintf(']\n');


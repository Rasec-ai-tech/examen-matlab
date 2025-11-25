% Paramètres d'intégration
a = 0;            % Borne inférieure
b = 2*pi;       % Borne supérieure

% Définition de la fonction
f = @(x) x.^3 - 2*sin(x) + 1;

% Valeur exacte pour le calcul de l'erreur
I_exact = 4*pi^4 + 2*pi;

% Plage de valeurs de n
n_values = 200:1:1000;       % De 200 à 1000 par pas de 1
erreur = zeros(size(n_values));  % Initialisation du vecteur d'erreur

% Boucle sur chaque valeur de n
for i = 1:length(n_values)
    n = n_values(i);
    h = (b - a)/n;
    x = a:h:b;
    
    % Application de la méthode des trapèzes
    sum_terms = 2 * sum(f(x(2:end-1)));
    I_trapeze = (h/2) * (f(a) + sum_terms + f(b));
    
    % Calcul de l'erreur absolue
    erreur(i) = abs(I_trapeze - I_exact);
end

% Tracé de l'erreur en fonction de n
figure;
plot(n_values, erreur, 'b-', 'LineWidth', 1.5);
xlabel('Nombre de sous-intervalles (n)');
ylabel('Erreur absolue');
title('Convergence de la méthode des trapèzes');
grid on;
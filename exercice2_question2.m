% Paramètres d'intégration
a = 0;            % Borne inférieure
b = 2*pi;       % Borne supérieure
n = 200;        % Nombre de sous-intervalles
h = (b - a)/n;  % Largeur d'un sous-intervalle

% Définition de la fonction
f = @(x) x.^3 - 2*sin(x) + 1;

% Création des points d'évaluation
x = a:h:b;  % n+1 points pour n sous-intervalles

% Calcul par la méthode des trapèzes
% Formule : (h/2) * [f(a) + 2Σf(x_i) + f(b)]
sum_terms = 2 * sum(f(x(2:end-1)));  % Somme des termes intermédiaires
I_trapeze = (h/2) * (f(a) + sum_terms + f(b));

% Affichage du résultat
fprintf('Intégration numérique par la méthode des trapèzes (n = %d):%.6f\n', ...
    n,I_trapeze);
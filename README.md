# Examen Pratique : Analyse Numérique

Ce dépôt contient les solutions numériques et théoriques pour un examen pratique portant sur l'Analyse Numérique, couvrant la résolution d'équations différentielles par différences finies, l'intégration numérique, et la résolution de systèmes linéaires par factorisation matricielle.

## Structure de l'Examen

L'examen est divisé en trois exercices principaux :

1.  Méthode Itérative (Équation de Transport)
2.  Intégration Numérique (Méthode des Trapèzes)
3.  Analyse Matricielle (Factorisation LU)


## Exercice N°1 : Méthode Itérative (Équation de Transport)

Cet exercice traite de l'approche numérique d'un modèle de transport de matériaux par la méthode de discrétisation (différences finies explicites).

Le modèle est l'équation aux dérivées partielles (EDP) suivante :
$
\begin{cases}
\frac{\partial u}{\partial t} + (\beta - 1) \frac{\partial^2 u}{\partial x^2} = 0, \quad (x, t) \in [0, 1] \times [0, 1] \\
u(0, t) = 2t \\
\frac{\partial u}{\partial x}(1, t) = 1 - t \\
u_0(x) = \cos^2(2\pi x)
\end{cases} \quad (1)
$
où $(\beta - 1) \in ]0, 1]$ est le coefficient de diffusion.

### Questions (Théorie et Mise en Œuvre)

* Questions 1 à 6 : Dérivation du schéma numérique centré, du schéma décentré pour le temps (Euler Explicite), déduction du schéma final, établissement de la condition de stabilité (CFL), et écriture matricielle du système.
* Question 7 : Application numérique (avec $\Delta t=0.01$, $\Delta x=0.1$, $\beta=0.86$) :
    * (a) Écrire un code Matlab/Octave pour afficher la solution approchée $u(x, t)$ aux temps $t = 0s, 0.2s, 0.4s, 0.6s, 0.8s, \text{ et } 1s$.
    * (b) Interprétation qualitative des résultats.


## Exercice N°2 : Intégration Numérique

Cet exercice porte sur le calcul d'une intégrale définie, à la fois analytiquement et numériquement.

L'intégrale étudiée est :
$$
I(f) = \int_{0}^{2\pi} (x^3 - 2\sin(x) + 1) \, dx.
$$

### Questions (Théorie et Code Matlab)

1.  Valeur Exacte : Déterminer la valeur exacte de $I(f)$ en utilisant la recherche de primitive.
2.  Intégration Numérique : Utiliser un code Matlab pour intégrer numériquement $I(f)$ avec la méthode des trapèzes en prenant $n = 200$ sous-intervalles.
3.  Analyse de l'Erreur : Utiliser le même code Matlab pour représenter l'évolution de l'erreur absolue mesurée en faisant varier le nombre d'intervalles $n$ de 200 à 1000.
4.  Commentaire : Commenter qualitativement l'évolution de cette erreur (convergence et ordre).

## Exercice N°3 : Analyse Matricielle (Factorisation LU)

Cet exercice se concentre sur la résolution d'un système d'équations linéaires $\mathbf{AX} = \mathbf{B}$ par la méthode de décomposition LU.

Le système à résoudre est défini par :
$$
\mathbf{A} = \begin{pmatrix}
10 & 7 & 8 & 7 \\
7 & 5 & 6 & 5 \\
8 & 6 & 10 & 9 \\
7 & 5 & 9 & 10
\end{pmatrix}, \quad \mathbf{B} = \begin{pmatrix} 4 \\ 3 \\ 3 \\ 1 \end{pmatrix}.
$$

### 1. Implémentation en MATLAB / Octave

Le fichier `exercice3_question1.m` contient le code Matlab/Octave qui implémente l'algorithme de décomposition LU, suivi des étapes de substitution avant (pour $\mathbf{LY}=\mathbf{B}$) et arrière (pour $\mathbf{UX}=\mathbf{Y}$).

#### Fichier : `exercice3_question1.m`

Ce script réalise séquentiellement :

1.  Factorisation LU : Décomposition de $\mathbf{A}$ en $\mathbf{L}$ (matrice triangulaire inférieure unitaire) et $\mathbf{U}$ (matrice triangulaire supérieure).
2.  Résolution de $\mathbf{LY}=\mathbf{B}$ : Calcul du vecteur intermédiaire $\mathbf{Y}$ par substitution avant.
3.  Résolution de $\mathbf{UX}=\mathbf{Y}$ : Calcul du vecteur solution $\mathbf{X}$ par substitution arrière.

### 2. Implémentation en Python (NumPy)

Le fichier `exercice3_question2.py` fournit une implémentation équivalente en Python utilisant la bibliothèque `NumPy` pour la manipulation des vecteurs et matrices.

#### Fichier : `exercice3_question2.py`

Ce script suit exactement les mêmes trois étapes algorithmiques que la version Matlab, confirmant les résultats de $\mathbf{L}$, $\mathbf{U}$, et du vecteur solution $\mathbf{X}$.

### Résultats Numériques Attendus (Factorisation LU)

Le code produit les matrices $\mathbf{L}$ et $\mathbf{U}$, ainsi que la solution finale $\mathbf{X}$ :

* Matrice L :
    $$
    \mathbf{L} \approx \begin{pmatrix}
    1.0000 & 0.0000 & 0.0000 & 0.0000 \\
    0.7000 & 1.0000 & 0.0000 & 0.0000 \\
    0.8000 & 0.4000 & 1.0000 & 0.0000 \\
    0.7000 & 0.2000 & 1.5000 & 1.0000
    \end{pmatrix}
    $$
* Matrice U :
    $$
    \mathbf{U} \approx \begin{pmatrix}
    10.0000 & 7.0000 & 8.0000 & 7.0000 \\
    0.0000 & 0.1000 & 0.4000 & 0.1000 \\
    0.0000 & 0.0000 & 1.8000 & 2.1000 \\
    0.0000 & 0.0000 & 0.0000 & 5.0000
    \end{pmatrix}
    $$
* Vecteur Solution X :
    $$
    \mathbf{X} \approx \begin{pmatrix}
    -4.0000 \\
    -6.0000 \\
    4.0000 \\
    -1.0000
    \end{pmatrix}
    $$

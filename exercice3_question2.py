import numpy as np

# Initialisation directe des données
A = np.array([[10, 7, 8, 7],
              [7, 5, 6, 5],
              [8, 6, 10, 9],
              [7, 5, 9, 10]], dtype=float)

b = np.array([4, 3, 3, 1], dtype=float)
n = 4

# Initialisation des matrices
L = np.eye(n)
U = np.zeros((n, n))
x = np.zeros(n)
y = np.zeros(n)

print('\n========= ÉTAPE 1 : Factorisation LU =========')
for k in range(n):
    # Construction de la ligne k de U
    for j in range(k, n):
        somme = sum(L[k, s] * U[s, j] for s in range(k))
        U[k, j] = A[k, j] - somme

    # Construction de la colonne k de L
    for i in range(k + 1, n):
        somme = sum(L[i, s] * U[s, k] for s in range(k))
        L[i, k] = (A[i, k] - somme) / U[k, k]

print('\nMatrice L :')
for i in range(n):
    print(' '.join(f'{L[i,j]:8.4f}' for j in range(n)))

print('\nMatrice U :')
for i in range(n):
    print(' '.join(f'{U[i,j]:8.4f}' for j in range(n)))

print('\n========= ÉTAPE 2 : Résolution de LY = b =========')
for k in range(n):
    somme = sum(L[k, i] * y[i] for i in range(k))
    y[k] = (b[k] - somme) / L[k, k]

print('\n========= ÉTAPE 3 : Résolution de UX = Y =========')
for k in range(n - 1, -1, -1):
    somme = sum(U[k, j] * x[j] for j in range(k + 1, n))
    x[k] = (y[k] - somme) / U[k, k]

print('\n========= SOLUTION FINALE =========')
print('X =')
for i in range(n):
    print(f'{x[i]:.4f}')

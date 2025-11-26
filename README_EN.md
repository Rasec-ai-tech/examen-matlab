# Practical Exam: Numerical Analysis

This repository contains the numerical and theoretical solutions for a practical exam focused on **Numerical Analysis**, covering the resolution of differential equations by finite differences, numerical integration, and the resolution of linear systems by matrix factorization.

## Exam Structure

The exam is divided into three main exercises:

1.  **Iterative Method (Transport Equation)**
2.  **Numerical Integration (Trapezoidal Rule)**
3.  **Matrix Analysis (LU Factorization)**

-----

## Exercise N°1: Iterative Method (Transport Equation)

This exercise deals with the numerical approach to a material transport model using the **discretization method** (explicit finite differences).

The model is the following partial differential equation (PDE):

$$
\begin{cases}
\frac{\partial u}{\partial t} + (\beta - 1) \frac{\partial^2 u}{\partial x^2} = 0, \quad (x, t) \in [0, 1] \times [0, 1] \\
u(0, t) = 2t \\
\frac{\partial u}{\partial x}(1, t) = 1 - t \\
u_0(x) = \cos^2(2\pi x)
\end{cases} \quad (1)
$$

where $(\beta - 1) \in ]0, 1]$ is the diffusion coefficient.

### Questions (Theory and Implementation)

  * **Questions 1 to 6:** Derivation of the centered numerical scheme, the forward-difference scheme for time (Explicit Euler), deduction of the final scheme, establishment of the stability condition (CFL), and matrix form of the system.
  * **Question 7:** **Numerical Application** (with $\Delta t=0.01$, $\Delta x=0.1$, $\beta=0.86$):
      * (a) Write a **Matlab/Octave** code to display the approximated solution $u(x, t)$ at times $t = 0s, 0.2s, 0.4s, 0.6s, 0.8s, \text{ and } 1s$.
      * (b) Qualitative interpretation of the obtained results.

-----

## Exercise N°2: Numerical Integration

This exercise focuses on calculating a definite integral, both analytically and numerically.

The integral studied is:

$$
I(f) = \int_{0}^{2\pi} (x^3 - 2\sin(x) + 1) \, dx.
$$

### Questions (Theory and Matlab Code)

1.  **Exact Value:** Determine the exact value of $I(f)$ by finding the antiderivative.
2.  **Numerical Integration:** Use a **Matlab** code to numerically integrate $I(f)$ with the **trapezoidal method** using $n = 200$ sub-intervals.
3.  **Error Analysis:** Use the same **Matlab** code to plot the evolution of the **absolute measured error** by varying the number of intervals $n$ from 200 to 1000.
4.  **Commentary:** Qualitatively comment on the evolution of this error (convergence and order).

-----

## Exercise N°3: Matrix Analysis (LU Factorization)

This exercise focuses on solving a system of linear equations $\mathbf{AX} = \mathbf{B}$ using the **LU decomposition method**.

The system to be solved is defined by:

$$
\mathbf{A} = \begin{pmatrix}
10 & 7 & 8 & 7 \\
7 & 5 & 6 & 5 \\
8 & 6 & 10 & 9 \\
7 & 5 & 9 & 10
\end{pmatrix}, \quad \mathbf{B} = \begin{pmatrix} 4 \\ 3 \\ 3 \\ 1 \end{pmatrix}.
$$

### 1\. MATLAB / Octave Implementation

The file `exercice3_question1.m` contains the **Matlab/Octave** code that implements the LU decomposition algorithm, followed by forward substitution (for $\mathbf{LY}=\mathbf{B}$) and backward substitution (for $\mathbf{UX}=\mathbf{Y}$).

### 2\. Python Implementation (NumPy)

The file `exercice3_question2.py` provides an equivalent implementation in **Python** using the `NumPy` library.

### Expected Numerical Results (LU Factorization)

The code produces the matrices $\mathbf{L}$ and $\mathbf{U}$, and the final solution vector $\mathbf{X}$ (see the first README for the matrix values).

-----

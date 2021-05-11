using LinearAlgebra

# Calculating numerical eigenvalues
alpha = 10.

# n = 1 center steady state
n = 1
u = (41. ^ 0.5) / 2. - 0.5
v = u

f_u = -1.
f_v = alpha*n*v^(n-1)/(v^n+1)^2
g_u = alpha*n*u^(n-1)/(u^n+1)^2
g_v = -1.

J1 = [f_u f_v; g_u g_v]

display(eigvals(J1))


# n = 2 center steady state
n = 2.
u = 2.
v = u

f_v = alpha*n*v^(n-1)/(v^n+1)^2
g_u = alpha*n*u^(n-1)/(u^n+1)^2

J2 = [f_u f_v; g_u g_v]

display(eigvals(J2))
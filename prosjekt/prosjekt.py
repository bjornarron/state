import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import dirichlet
from mpl_toolkits.mplot3d import Axes3D

def dirichlet_pdf(x, alpha):
    from scipy.special import gamma
    from functools import reduce
    import operator

    coef = gamma(np.sum(alpha)) / reduce(operator.mul, [gamma(a) for a in alpha])
    pdf = coef * np.prod([x_i ** (a - 1) for x_i, a in zip(x, alpha)])

    return pdf

data = pd.read_csv("data.csv")

a0 = 0
b0 = 0
c0 = 0
d0 = 0

w = data['operativsystem'].str.contains("Windows").sum()
m = data['operativsystem'].str.contains("Mac").sum()
l = data['operativsystem'].str.contains("Linux").sum()
f = data['operativsystem'].str.contains("Foretrekker ingen").sum()

a1 = a0 + 10 #w
b1 = b0 + 10 #m
c1 = c0 + 10 #l
d1 = d0 + 10 #l

alpha = np.array([a1, b1, c1])

n_points = 100
x = np.linspace(0, 1, n_points)
z = np.linspace(0, 1, n_points)
X, Z = np.meshgrid(x, z)

Y = np.zeros((n_points, n_points))
for i in range(n_points):
    for j in range(n_points):
        prob = np.array([X[i, j], Z[i, j], 1 - X[i, j] - Z[i, j]])
        if np.all(prob >= 0) and np.all(prob <= 1):
            Y[i, j] = dirichlet_pdf(prob, alpha)

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

ax.plot_surface(X, Z, Y, cmap='viridis', alpha=0.7)

ax.set_xlabel('Windows')
ax.set_ylabel('Mac')
ax.set_zlabel('Probability Density')

ax.set_title("3D Dirichlet Distribution: Probability Density of Operating Systems")
plt.show()

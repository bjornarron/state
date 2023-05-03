import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy.stats import dirichlet
from mpl_toolkits.mplot3d import Axes3D

data = pd.read_csv("data.csv")

a0 = 0
b0 = 0
c0 = 0
d0 = 0

w = data['operativsystem'].str.contains("Windows").sum()
m = data['operativsystem'].str.contains("Mac").sum()
l = data['operativsystem'].str.contains("Linux").sum()
f = data['operativsystem'].str.contains("Foretrekker ingen").sum()
print(w)
print(m)
print(l)
print(f)
a1 = a0 + w
b1 = b0 + m
c1 = c0 + l
d1 = d0 + l

alpha = np.array([a1, b1, c1])

sample = dirichlet.rvs(alpha, size=10000)
df = pd.DataFrame(sample, columns=["Windows", "Macos", "Linux"])

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

ax.scatter(df["Windows"], df["Macos"], df["Linux"], marker='o', color='blue', alpha=0.05)
ax.scatter(1, 0, 0, marker='o', color='red', s=200)
ax.scatter(0, 1, 0, marker='o', color='red', s=200)
ax.scatter(0, 0, 1, marker='o', color='red', s=200)
ax.text(1.1, 0, 0, "Windows", color='red', fontsize=12)
ax.text(0, 1.1, 0, "Macos", color='red', fontsize=12)
ax.text(0, 0, 1.1, "Linux", color='red', fontsize=12)
ax.set_xlabel("Windows")
ax.set_ylabel("Macos")
ax.set_zlabel("Linux")
ax.set_title("Dirichlet Distribution")
ax.set_xlim(0, 1)
ax.set_ylim(0, 1)
ax.set_zlim(0, 1)

plt.show()

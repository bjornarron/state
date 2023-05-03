import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy.stats import dirichlet

data = pd.read_csv("data.csv")

a0 = 0
b0 = 0
c0 = 0
d0 = 0

w = data['operativsystem'].str.contains("Windows").sum()
m = data['operativsystem'].str.contains("Mac").sum()
l = data['operativsystem'].str.contains("Linux").sum()
f = data['operativsystem'].str.contains("Foretrekker ingen").sum()
<<<<<<< HEAD
print(w)
print(m)
print(l)
print(f)
=======

>>>>>>> 247369b237355729bc7a1d06617af3e7e68d828e
a1 = a0 + w
b1 = b0 + m
c1 = c0 + l
d1 = d0 + l

alpha = np.array([a1, b1, c1])

<<<<<<< HEAD
sample = dirichlet.rvs(alpha, size=15)
=======
sample = dirichlet.rvs(alpha, size=10000)
>>>>>>> 247369b237355729bc7a1d06617af3e7e68d828e
df = pd.DataFrame(sample, columns=["V1", "V2", "V3"])

labels = pd.DataFrame({
    "x": [1, 0, 0],
    "y": [0, 0, 1],
    "label": ["Windows", "Linux", "Mac"]
})

fig, ax = plt.subplots()

sns.kdeplot(data=df, x="V1", y="V2", ax=ax, fill=True)
ax.scatter(labels['x'], labels['y'], color='red')

ax.plot([1, 0], [0, 1], color='black')  # line from (1, 0) to (0, 1)
ax.plot([0, 0], [0, 1], color='black')  # line from (0, 0) to (0, 1)
ax.plot([1, 0], [0, 0], color='black')  # line from (1, 0) to (0, 0)

triangle_center = np.array([1/3, 1/3])
ax.scatter(triangle_center[0], triangle_center[1], color='blue')

for index, row in labels.iterrows():
    ax.text(row['x'], row['y'], row['label'], fontsize=12, color='red')
    


n_students = 1
pred_prob_windows = dirichlet.mean(alpha)[0] ** n_students

print(f"Predictive probability of 20 students preferring Windows: {pred_prob_windows:.6f}")
# Compute the 5th and 95th percentiles of the samples
lower = np.percentile(sample, 5, axis=0)
upper = np.percentile(sample, 95, axis=0)

# Display the interval estimate
print("Interval Estimate (90%):")
print("Windows: [{:.3f}, {:.3f}]".format(lower[0], upper[0]))
print("Mac: [{:.3f}, {:.3f}]".format(lower[1], upper[1]))
print("Linux: [{:.3f}, {:.3f}]".format(lower[2], upper[2]))

ax.set_title("Dirichlet Distribution")
ax.set_xlim(0, 1)
ax.set_ylim(0, 1)
plt.show()
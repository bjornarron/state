import csv
import numpy as np
import scipy.stats as stats
n = 0
linux_hours = 0
linux_hours_2 = 0

with open("data.csv", "r") as csvfile:
    reader = csv.DictReader(csvfile, delimiter=",")
    for row in reader:
        n += 1
        linux_hours += float(row["timerLinux"])
        linux_hours_2 += float(row["timerLinux"])*float(row["timerLinux"])


print("Linux hours:", linux_hours)
print("Linux hours squared:", linux_hours_2)


k_0 = 0
sum_0 = 0
v_0 = -1
C_0 = 0

k_1 = k_0 + n
sum_1 = sum_0 + linux_hours
v_1 = v_0 + n
C_1 = C_0 + linux_hours_2

m1 = sum_1/k_1
SS_1 = C_1 - k_1*m1*m1
s_1_opphyd = SS_1/(v_1)
s1= np.sqrt(s_1_opphyd)



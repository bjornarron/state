import csv
import numpy as np
n = 0
windows_hours = 0
linux_hours = 0
mac_hours = 0

windows_hours_2 = 0
linux_hours_2 = 0
mac_hours_2 = 0

with open("data.csv", "r") as csvfile:
    reader = csv.DictReader(csvfile, delimiter=",")
    for row in reader:
        n += 1
        windows_hours += float(row["timerwin"])
        linux_hours += float(row["timerLinux"])
        mac_hours += float(row["timerMac"])
        windows_hours_2 += float(row["timerwin"])*float(row["timerwin"])
        linux_hours_2 += float(row["timerLinux"])*float(row["timerLinux"])
        mac_hours_2 += float(row["timerMac"])*float(row["timerMac"])

print("Number of students:", n)
print("Windows hours:", windows_hours)
print("Linux hours:", linux_hours)
print("Mac hours:", mac_hours)
print("Windows hours squared:", windows_hours_2)
print("Linux hours squared:", linux_hours_2)
print("Mac hours squared:", mac_hours_2)


k_0 = 0
sum_0 = 0
v_0 = -1
C_0 = 0

#P1

k_1 = k_0 + n
sum_1 = sum_0 + windows_hours
v_1 = v_0 + n
C_1 = C_0 + windows_hours_2

m1 = sum_1/k_1
SS_1 = C_1 - k_1*m1**2
s_1_opphyd = SS_1/(v_1)
s_1 = np.sqrt(s_1_opphyd)

#tau


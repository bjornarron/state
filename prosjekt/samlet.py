import csv
import numpy as np
import scipy.stats as stats

n = 0
mac_n = 0
linux_n = 0
windows_n = 0
windows_hours = 0
linux_hours = 0
mac_hours = 0

windows_hours_2 = 0
linux_hours_2 = 0
mac_hours_2 = 0

with open("data.csv", "r") as csvfile:
    reader = csv.DictReader(csvfile, delimiter=",")
    for row in reader:
        timerwin = float(row["timerwin"])
        timerLinux = float(row["timerLinux"])
        timerMac = float(row["timerMac"])

        if timerwin != 0:
            windows_n += 1
            windows_hours += timerwin
            windows_hours_2 += timerwin * timerwin
        if timerLinux != 0:
            linux_n += 1
            linux_hours += timerLinux
            linux_hours_2 += timerLinux * timerLinux
        if timerMac != 0:
            mac_n += 1
            mac_hours += timerMac
            mac_hours_2 += timerMac * timerMac

print("Number of students:", n)
print("Windows hours:", windows_hours)
print("Linux hours:", linux_hours)
print("Mac hours:", mac_hours)
print("Windows hours squared:", windows_hours_2)
print("Linux hours squared:", linux_hours_2)
print("Mac hours squared:", mac_hours_2)
print("Windows n:", windows_n)
print("Linux n:", linux_n)
print("Mac n:", mac_n)

w_k_0 = 0
w_sum_0 = 0
w_v_0 = -1
w_C_0 = 0

#P1

w_k_1 = w_k_0 + windows_n
w_sum_1 = w_sum_0 + windows_hours
w_v_1 = w_v_0 + windows_n
w_C_1 = w_C_0 + windows_hours_2

#print the above:
print("Windows k_1:", w_k_1)
print("Windows sum_1:", w_sum_1)
print("Windows v_1:", w_v_1)
print("Windows C_1:", w_C_1)

w_m1 = w_sum_1/w_k_1
w_SS_1 = w_C_1 - w_k_1*w_m1**2
w_s_1_opphyd = w_SS_1/(w_v_1)
w_s_1 = np.sqrt(w_s_1_opphyd)


#print the above:
print("Windows m1:", w_m1)
print("Windows SS_1:", w_SS_1)
print("Windows s_1_opphyd:", w_s_1_opphyd)
print("Windows s_1:", w_s_1)







l_k_0 = 0
l_sum_0 = 0
l_v_0 = -1
l_C_0 = 0

l_k_1 = l_k_0 + linux_n
l_sum_1 = l_sum_0 + linux_hours
l_v_1 = l_v_0 + linux_n
l_C_1 = l_C_0 + linux_hours_2

l_m1 = l_sum_1/l_k_1
l_SS_1 = l_C_1 - l_k_1*l_m1*l_m1
l_s_1_opphyd = l_SS_1/(l_v_1)
l_s_1= np.sqrt(l_s_1_opphyd)


m_k_0 = 0
m_sum_0 = 0
m_v_0 = -1
m_C_0 = 0

m_k_1 = m_k_0 + mac_n
m_sum_1 = m_sum_0 + mac_hours
m_v_1 = m_v_0 + mac_n
m_C_1 = m_C_0 + mac_hours_2


m_m1 = m_sum_1/m_k_1
m_SS_1 = m_C_1 - m_k_1*m_m1*m_m1
m_s_1_opphyd = m_SS_1/(m_v_1)
m_s1= np.sqrt(m_s_1_opphyd)

sig = 0.05
hyp = 7

w_h_0 = stats.t.cdf(7,75,6.704,0.30306 * ((75 - 2) / 75) ** 0.5)


print(w_h_0)
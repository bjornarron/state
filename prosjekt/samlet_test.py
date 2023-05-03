import csv
import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt

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
        windows_n += 1
        windows_hours += timerwin
        windows_hours_2 += timerwin * timerwin
        linux_n += 1
        linux_hours += timerLinux
        linux_hours_2 += timerLinux * timerLinux
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
#print the above:
print("Linux k_1:", l_k_1)
print("Linux sum_1:", l_sum_1)
print("Linux v_1:", l_v_1)
print("Linux C_1:", l_C_1)

l_m1 = l_sum_1/l_k_1
l_SS_1 = l_C_1 - l_k_1*l_m1*l_m1
l_s_1_opphyd = l_SS_1/(l_v_1)
l_s1= np.sqrt(l_s_1_opphyd)
#print the above:
print("Linux m1:", l_m1)
print("Linux SS_1:", l_SS_1)
print("Linux s_1_opphyd:", l_s_1_opphyd)
print("Linux s_1:", l_s1)

#Make the above for Mac:
m_k_0 = 0
m_sum_0 = 0
m_v_0 = -1
m_C_0 = 0

m_k_1 = m_k_0 + mac_n
m_sum_1 = m_sum_0 + mac_hours
m_v_1 = m_v_0 + mac_n
m_C_1 = m_C_0 + mac_hours_2
#print the above:
print("Mac k_1:", m_k_1)
print("Mac sum_1:", m_sum_1)
print("Mac v_1:", m_v_1)
print("Mac C_1:", m_C_1)

m_m1 = m_sum_1/m_k_1
m_SS_1 = m_C_1 - m_k_1*m_m1*m_m1
m_s_1_opphyd = m_SS_1/(m_v_1)
m_s1= np.sqrt(m_s_1_opphyd)
#print the above:
print("Mac m1:", m_m1)
print("Mac SS_1:", m_SS_1)
print("Mac s_1_opphyd:", m_s_1_opphyd)
print("Mac s_1:", m_s1)


x = np.linspace(-5, 15, 1000)

pdf_windows = stats.t.pdf(x, windows_n-1, loc=w_m1, scale=w_s_1)
pdf_linux = stats.t.pdf(x, linux_n-1, loc=l_m1, scale=l_s1)
pdf_mac = stats.t.pdf(x, mac_n-1, loc=m_m1, scale=m_s1)

plt.plot(x, pdf_windows, label="Windows")
plt.plot(x, pdf_linux, label="Linux")
plt.plot(x, pdf_mac, label="Mac")
plt.grid(True)

plt.show()

library(metRology)
library(readr)
library(magrittr)

data <- read.csv("data.csv")

n <- 0
mac_n <- 0
linux_n <- 0
windows_n <- 0
windows_hours <- 0
linux_hours <- 0
mac_hours <- 0

windows_hours_2 <- 0
linux_hours_2 <- 0
mac_hours_2 <- 0

for (i in 1:nrow(data)) {
  timerwin <- as.numeric(data[i, "timerwin"])
  timerLinux <- as.numeric(data[i, "timerLinux"])
  timerMac <- as.numeric(data[i, "timerMac"])
  
  if (timerwin != 0) {
    windows_n <- windows_n + 1
    windows_hours <- windows_hours + timerwin
    windows_hours_2 <- windows_hours_2 + timerwin^2
  }
  
  if (timerLinux != 0) {
    linux_n <- linux_n + 1
    linux_hours <- linux_hours + timerLinux
    linux_hours_2 <- linux_hours_2 + timerLinux^2
  }
  
  if (timerMac != 0) {
    mac_n <- mac_n + 1
    mac_hours <- mac_hours + timerMac
    mac_hours_2 <- mac_hours_2 + timerMac^2
  }
}

cat("Number of students:", n, "\n")
cat("Windows hours:", windows_hours, "\n")
cat("Linux hours:", linux_hours, "\n")
cat("Mac hours:", mac_hours, "\n")
cat("Windows hours squared:", windows_hours_2, "\n")
cat("Linux hours squared:", linux_hours_2, "\n")
cat("Mac hours squared:", mac_hours_2, "\n")
cat("Windows n:", windows_n, "\n")
cat("Linux n:", linux_n, "\n")
cat("Mac n:", mac_n, "\n")

w_k_0 <- 0
w_sum_0 <- 0
w_v_0 <- -1
w_C_0 <- 0

# P1

w_k_1 <- w_k_0 + windows_n
w_sum_1 <- w_sum_0 + windows_hours
w_v_1 <- w_v_0 + windows_n
w_C_1 <- w_C_0 + windows_hours_2

cat("Windows k_1:", w_k_1, "\n")
cat("Windows sum_1:", w_sum_1, "\n")
cat("Windows v_1:", w_v_1, "\n")
cat("Windows C_1:", w_C_1, "\n")

w_m1 <- w_sum_1/w_k_1
w_SS_1 <- w_C_1 - w_k_1*w_m1^2
w_s_1_opphyd <- w_SS_1/(w_v_1)
w_s_1 <- sqrt(w_s_1_opphyd)

cat("Windows m1:", w_m1, "\n")
cat("Windows SS_1:", w_SS_1, "\n")
cat("Windows s_1_opphyd:", w_s_1_opphyd, "\n")
cat("Windows s_1:", w_s_1, "\n")

l_k_0 <- 0
l_sum_0 <- 0
l_v_0 <- -1
l_C_0 <- 0

l_k_1 <- l_k_0 + linux_n
l_sum_1 <- l_sum_0 + linux_hours
l_v_1 <- l_v_0 + linux_n
l_C_1 <- l_C_0 + linux_hours_2

l_m1 <- l_sum_1/l_k_1
l_SS_1 <- l_C_1 - l_k_1*l_m1*l_m1
l_s_1_opphyd <- l_SS_1/(l_v_1)
l_s_1<- sqrt(l_s_1_opphyd)


m_k_0 <- 0
m_sum_0 <- 0
m_v_0 <- -1
m_C_0 <- 0

m_k_1 <- m_k_0 + mac_n
m_sum_1 <- m_sum_0 + mac_hours
m_v_1 <- m_v_0 + mac_n
m_C_1 <- m_C_0 + mac_hours_2


m_m1 <- m_sum_1/m_k_1
m_SS_1 <- m_C_1 - m_k_1*m_m1*m_m1
m_s_1_opphyd <- m_SS_1/(m_v_1)
m_s_1<- sqrt(m_s_1_opphyd)

cat("Hypotese timer bruk over 7 timer på alle os")
sig <- 0.05
hyp <- 3

w_hyp<-pt.scaled(hyp,w_v_1,w_m1,w_s_1*(sqrt(1/w_k_1)))
l_hyp<-pt.scaled(hyp,l_v_1,l_m1,l_s_1*(sqrt(1/l_k_1)))
m_hyp<-pt.scaled(hyp,m_v_1,m_m1,m_s_1*(sqrt(1/m_k_1)))


if (w_hyp > sig){
  cat("windows: forkaster H1 for H0 fordi P(H0)<signifikans")
} else {
  cat("windows: Beholder H1 fordi P(H0)>alpha")
}

if (l_hyp > sig){
  cat("linux: forkaster H1 for H0 fordi P(H0)<signifikans")
} else {
  cat("linux: Beholder H1 fordi P(H0)>alpha")
}

if (m_hyp > sig){
  cat("mac: forkaster H1 for H0 fordi P(H0)<signifikans")
} else {
  cat("mac: Beholder H1 fordi P(H0)>alpha")
}







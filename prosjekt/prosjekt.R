library(readr)
library(ggplot2)
library(extraDistr)

data <- read_csv("data_bare_forventet.csv")

os_count <- table(data$operativsystem)
os_count_normalized <- os_count / sum(os_count)

alpha <- 1 # endre denne verdien for å påvirke konsentrasjonen av fordelingen
dirichlet_params <- alpha * os_count_normalized

samples <- 1000 # endre dette tallet for å øke eller redusere antall prøver
dirichlet_samples <- rdirichlet(samples, dirichlet_params)

# Konverter Dirichlet-prøver til et datafremme for ggplot
dirichlet_df <- data.frame(t(dirichlet_samples))
colnames(dirichlet_df) <- names(os_count)

# Forbered data for visualisering
melted_dirichlet_df <- reshape2::melt(dirichlet_df, variable.name = "OS", value.name = "Frequency")

# Visualiser Dirichlet-fordelingen
ggplot(melted_dirichlet_df, aes(x = OS, y = Frequency)) +
  geom_boxplot() +
  labs(title = "Dirichlet Distribution of Operating Systems", x = "Operating System", y = "Frequency") +
  theme_minimal()

mode_os <- names(os_count)[which.max(os_count)]
mode_os


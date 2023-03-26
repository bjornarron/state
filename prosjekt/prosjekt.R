student_data <- read.csv("data.csv")

library(ggplot2)
ggplot(student_data, aes(x = Datamskiner, y = Linje, color = OS)) +
  geom_point() +
  xlab("Antall datamaskiner") +
  ylab("Linje") +
  ggtitle("Antall datamaskiner og operativsystem etter linje") +
  scale_color_discrete(name = "Operativsystem")

ggplot(student_data, aes(x = Linje, fill = OS)) +
  geom_bar(position = "dodge") +
  xlab("Linje") +
  ylab("Antall studenter") +
  ggtitle("Antall studenter etter linje og operativsystem") +
  scale_fill_discrete(name = "Operativsystem")


library(dplyr)

student_data$count <- 1
student_data <- student_data %>%
  group_by(Datamskiner, Linje) %>%
  summarize(count = n())


#
library(scatterplot3d)

scatterplot3d(student_data$Datamskiner, student_data$Linje, student_data$count,
              xlab = "Antall datamaskiner",
              ylab = "Linje",
              zlab = "Antall",
              type = "h")

library(BayesFactor)

# Create a matrix of proportions
proportions <- t(student_data[, c("Datamskiner", "Linje")])
proportions <- proportions / rowSums(proportions)

# Fit a Dirichlet distribution to the proportions
fit <- dirichletReg(proportions)

# Plot the fitted distribution
plot(fit)




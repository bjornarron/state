data <- read.csv("data.csv")


library(ggplot2)

ggplot(data, aes(x=`Hvilket operativsystem foretrekker du?`)) + 
  geom_histogram(color="black", fill="blue", bins=5) +
  labs(title="Fordeling av operativsystemforetrekkelse", x="Operativsystem", y="Antall personer")


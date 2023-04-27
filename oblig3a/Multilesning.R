# Installer og last inn nødvendige pakker
install.packages("tidyverse")
library(tidyverse)

# Les inn data fra csv-filen
data <- read_csv("data.csv")

# Gjør om tidspunktet til et datobjekt
data$Tidsmerke <- lubridate::ymd_hms(data$Tidsmerke)

# Lag en figur som viser fordelingen av operativsystemvalg
ggplot(data, aes(x=`Hvilket operativsystem foretrekker du?`)) + 
  geom_bar() + 
  xlab("Operativsystem") + 
  ylab("Antall respondenter") + 
  ggtitle("Fordeling av operativsystemvalg")

# Lag en figur som viser gjennomsnittlig brukstid for hvert operativsystem
data %>%
  gather(key="OS", value="Tid", -Tidsmerke, -`Hvilken linje går du?`, -`Hvor mange datamaskiner har du i aktivt bruk? (Bærbar, Stasjonær, Server ...) `, -`Hvilket operativsystem foretrekker du?`) %>%
  mutate(OS = ifelse(OS == "Windows", "Windows", ifelse(OS == "Linux", "Linux", "MacOS"))) %>%
  ggplot(aes(x=OS, y=Tid, fill=OS)) + 
  geom_boxplot() + 
  xlab("Operativsystem") + 
  ylab("Tid (timer)") + 
  ggtitle("Gjennomsnittlig brukstid for hvert operativsystem")

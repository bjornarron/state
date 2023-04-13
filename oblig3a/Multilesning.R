# Install necessary packages if not already installed
if (!require(readr)) install.packages("readr")
if (!require(dplyr)) install.packages("dplyr")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(tidyr)) install.packages("tidyr")
if (!require(ggtern)) install.packages("ggtern")


# Load necessary libraries
library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)
library(ggtern)

# Import the data as a dataframe
data <- read_delim("data.csv", delim = ",", locale = readr::locale(encoding = "UTF-8"))



# Rename columns
colnames(data) <- c("Timestamp", "Line", "WindowsHours", "LinuxHours", "MacHours", "PreferredOS", "ComputersInUse")

# Convert Timestamp column to a proper datetime format
data$Timestamp <- as.POSIXct(data$Timestamp, format = "%d.%m.%Y kl. %H.%M.%S")

# Convert hours columns to numeric format
data$WindowsHours <- as.numeric(data$WindowsHours)
data$LinuxHours <- as.numeric(data$LinuxHours)
data$MacHours <- as.numeric(data$MacHours)

# Convert ComputersInUse column to numeric format
data$ComputersInUse <- as.numeric(data$ComputersInUse)


# Histogram of total hours per day for each operating system
total_hours <- data %>%
gather(OperatingSystem, Hours, WindowsHours:MacHours) %>%
group_by(OperatingSystem) %>%
summarize(TotalHours = sum(Hours))

ggplot(total_hours, aes(x = OperatingSystem, y = TotalHours, fill = OperatingSystem)) +
geom_bar(stat = "identity", width = 0.7) +
theme_minimal() +
labs(title = "Total hours per day for each operating system", x = "Operating System", y = "Total Hours") +
theme(legend.position = "none")

# Bar plot of preferred operating systems
preferred_os <- data %>%
group_by(PreferredOS) %>%
summarize(Count = n())

ggplot(preferred_os, aes(x = PreferredOS, y = Count, fill = PreferredOS)) +
geom_bar(stat = "identity", width = 0.7) +
theme_minimal() +
labs(title = "Preferred Operating System", x = "Operating System", y = "Count") +
theme(legend.position = "none")

# Boxplot of ComputersInUse per line
ggplot(data, aes(x = Line, y = ComputersInUse, fill = Line)) +
geom_boxplot() +
theme_minimal() +
labs(title = "Computers in use per line", x = "Line", y = "Computers in use") +
theme(legend.position = "none")

#Dirichlet
data_normalized <- data %>%
mutate(TotalHours = WindowsHours + LinuxHours + MacHours) %>%
mutate(NormWindows = WindowsHours / TotalHours,
       NormLinux = LinuxHours / TotalHours,
       NormMac = MacHours / TotalHours)
ggtern(data_normalized, aes(x = NormWindows, y = NormLinux, z = NormMac)) +
geom_point(alpha = 0.5) +
theme_minimal() +
labs(title = "Dirichlet plot of time allocation for each OS",
     x = "Windows", y = "Linux", z = "MacOS") +
theme(legend.position = "none")



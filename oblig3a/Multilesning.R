library(dplyr)
library(stringr)
# Vi forutsetter at alle filene ligger i en undermappe
# til der .Rproj-fila ligger, med navn 3a_nye:

seigmann_files = list.files(path = "3a_nye/")
A=str_split(seigmann_files,"_")
seigmann_df <- data.frame(matrix(unlist(A), ncol=3, byrow=TRUE))
colnames(seigmann_df) <- c("Type", "Merke", "Gruppe")
seigmann_df$Gruppe=str_split(seigmann_df$Gruppe, "\\.", simplify = TRUE)[,1]
seigmann_df$Merke=toupper(seigmann_df$Merke)
head(seigmann_df)
seigmann_df$Path=seigmann_files
Merker = unique(seigmann_df$Merke)
Merker

k=length(Merker)
inferens_df <- data.frame(merke=Merker,
                          n = rep(0,k),
                          Sx = rep(0,k),
                          Sxx = rep(0,k)
                          )


for (merke in Merker) {
  m = which(Merker==merke)
  temp_df = filter(seigmann_df,Merke==merke)
  temp2_df = filter(temp_df,Type=="Raw")
  for (path in temp2_df$Path) {
    this_df = read.csv(paste("3a_nye/",path,sep=""))
    n=dim(this_df)[1]
    Sx=sum(this_df[,1])
    Sxx=sum(this_df[,1]^2)
    Sxx = Sxx + 0.5^2/12  # Fordi nøyaktighet på 5mm
    inferens_df$n[m] = inferens_df$n[m] + n 
    inferens_df$Sx[m] = inferens_df$Sx[m] + Sx
    inferens_df$Sxx[m] = inferens_df$Sxx[m] + Sxx
  }
  temp3_df = filter(temp_df,Type=="Table")
  for (path in temp3_df$Path) {
    this_df = read.csv(paste("3a_nye/",path,sep=""))
    n=sum(this_df$Antall)
    Sx=sum(this_df$Antall*this_df$Midtpunkt)
    Sxx=sum(this_df$Antall*this_df$Midtpunkt^2)
    SxB=sum(this_df$Antall*this_df$Bredde^2)/12
    Sxx = Sxx + SxB
    inferens_df$n[m] = inferens_df$n[m] + n 
    inferens_df$Sx[m] = inferens_df$Sx[m] + Sx
    inferens_df$Sxx[m] = inferens_df$Sxx[m] + Sxx
  }
}

inferens_df
# Nå har dere alt dere trenger for å utføre inferensen.
# Alle dataene er lest inn og oppsummert!

#Loading binaries
library(dplyr)
library(tidyr)
library(ggplot2)


#Database Loading operation
if(!exists("storm.data")) {
  #downloading operation
  if(!file.exists("StormData.csv.bz2")){
    print("Downloading Storm database file....")
    download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2",destfile="StormData.csv.bz2", method="curl")
    print("Storm database file is downloaded!")
  } else {print("Storm database file is already downloaded!")}
  print("Loading storm database...")
  storm.data <- read.csv(bzfile("StormData.csv.bz2"),header = TRUE) 
  print("Storm database loaded!")
} else {print("Database already exists!")}


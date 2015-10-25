# Author: Matteo Qualizza


setwd("/Users/Dropbox/R/ExData_Plotting1")

library(httr) 

direction <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data <- "data"
if(!file.exists(data)){
	dir.create(data)
} 
grafic <- "grafic" 
if(!file.exists(grafic)){
	dir.create(grafic)
}
archive <- paste(getwd(), "/data/household_power_consumption.zip", sep = "")
if(!file.exists(archive)){
	download.file(direction, archive, method="curl", mode="wb")
}
archive <- paste(getwd(), "/data/household_power_consumption.txt", sep = "")
if(!file.exists(archive)){
	unzip(archive, list = FALSE, overwrite = FALSE, exdir = data)
}

remainder_data <- paste(getwd(), "/data/remainder_data.rds", sep = "")
if(!file.exists(remainder_data)){
	data <- "data/household_power_consumption.txt"
	load-data <- read.table(data, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
	load-data$Time <- strptime(paste(load-data$Date, load-data$Time), "%d/%m/%Y %H:%M:%S")
	load-data$Date <- as.Date(load-data$Date, "%d/%m/%Y")
	fechas <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
	load-data <- subset(load-data, Date %in% fechas)
	remainder_data <- paste(getwd(), "/", "data", "/", "remainder_data", ".rds", sep="")
	saveRDS(load-data, remainder_data)
} else {
	data <- "data/remainder_data.rds"
	load-data <- readRDS(data)
}


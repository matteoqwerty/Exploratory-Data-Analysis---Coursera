# Author: Matteo Qualizza


setwd("/Users/Dropbox/R/ExData_Plotting1")

source("load_data.R")

plot1 <- paste(getwd(), "/grafic/plot1.png", sep = "")
if(!file.exists(plot1)){
	png("grafic/plot1.png", width = 480, height = 480)
	hist(cargardatos$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
	dev.off()
} else {
	hist(cargardatos$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
}



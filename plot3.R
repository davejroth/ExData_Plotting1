# setwd("C:/R/datasciencecoursera/ExploratoryAnalysis/week1")
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
consumptionFile <- read.csv("household_power_consumption.txt", colClasses = classes, sep=";", na.strings="?")
consumptionFile$Date <- as.Date(consumptionFile$Date, "%d/%m/%Y")
filteredFile <- subset(consumptionFile, consumptionFile$Date == as.Date("2007-02-01") | consumptionFile$Date == as.Date("2007-02-02"))

png('plot3.png')

with(completeFile, plot(datetime, completeFile$Sub_metering_1, type="n", ylab="Energy Sub Metering", xlab=""))
with(completeFile, lines(datetime, completeFile$Sub_metering_1, ylab="Energy Sub Metering", xlab="", col="black"))
with(completeFile, lines(datetime, completeFile$Sub_metering_2, ylab="Energy Sub Metering", xlab="", col="red"))
with(completeFile, lines(datetime, completeFile$Sub_metering_3, ylab="Energy Sub Metering", xlab="", col="blue"))
legend("topright", lty="solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

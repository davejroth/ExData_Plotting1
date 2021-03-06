# setwd("C:/R/datasciencecoursera/ExploratoryAnalysis/week1")
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
consumptionFile <- read.csv("household_power_consumption.txt", colClasses = classes, sep=";", na.strings="?")
consumptionFile$Date <- as.Date(consumptionFile$Date, "%d/%m/%Y")
filteredFile <- subset(consumptionFile, consumptionFile$Date == as.Date("2007-02-01") | consumptionFile$Date == as.Date("2007-02-02"))
png('plot1.png')
with(filteredFile, hist(Global_active_power, main="Global Active Power", col="Red", xlab="Global Active Power"))
dev.off()

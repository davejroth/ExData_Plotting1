# setwd("C:/R/datasciencecoursera/ExploratoryAnalysis/week1")
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
consumptionFile <- read.csv("household_power_consumption.txt", colClasses = classes, sep=";", na.strings="?")
consumptionFile$Date <- as.Date(consumptionFile$Date, "%d/%m/%Y")
filteredFile <- subset(consumptionFile, consumptionFile$Date == as.Date("2007-02-01") | consumptionFile$Date == as.Date("2007-02-02"))

png('plot4.png')
par(mfrow = c(2,2))

#graph 1
with(completeFile, plot(datetime, Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab=""))
with(completeFile, lines(datetime, Global_active_power))

#graph 2
with(completeFile, plot(datetime, Voltage, type="n", ylab="Voltage", xlab=""))
with(completeFile, lines(datetime, Voltage))

#graph 3
with(completeFile, plot(datetime, completeFile$Sub_metering_1, type="n", ylab="Energy Sub Metering", xlab=""))
with(completeFile, lines(datetime, completeFile$Sub_metering_1, ylab="Energy Sub Metering", xlab="", col="black"))
with(completeFile, lines(datetime, completeFile$Sub_metering_2, ylab="Energy Sub Metering", xlab="", col="red"))
with(completeFile, lines(datetime, completeFile$Sub_metering_3, ylab="Energy Sub Metering", xlab="", col="blue"))
legend("topright", lty="solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#graph 4
with(completeFile, plot(datetime, Global_reactive_power, type="n", ylab="Global_reactive_power", xlab=""))
with(completeFile, lines(datetime, Global_reactive_power))

dev.off()

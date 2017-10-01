#This code reads the data, subsets according to date, and plots a line graph of 3 separate subsets of data.

dataFile <- "./household_power_consumption.txt"
housingData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- housingData[housingData$Date %in% c("1/2/2007","2/2/2007") ,]

dateData <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subData1 <- as.numeric(subSetData$Sub_metering_1)
subData2 <- as.numeric(subSetData$Sub_metering_2)
subData3 <- as.numeric(subSetData$Sub_metering_3)

plot(dateData, subData1, type="l", ylab="Energy Submetering", xlab="")
lines(dateData, subData2, type = "l", col = "red")
lines(dateData, subData3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()

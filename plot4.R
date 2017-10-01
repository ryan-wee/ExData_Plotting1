#This code reads the data, subsets according to date, and subplots 4 different plots in a 2x2 matrix. 

dataFile <- "./household_power_consumption.txt"
housingData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- housingData[housingData$Date %in% c("1/2/2007","2/2/2007") ,]

#Set global plot pars
png("plot4.png",width=480, height=480)
par(mfrow = c(2,2))


#Plot 1
globalActivePower <- as.numeric(subSetData$Global_active_power)
dateData <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(dateData, globalActivePower, type="l", xlab="", ylab="Global Active Power")


#Plot 2
plot(dateData, as.numeric(subSetData$Voltage), ylab = "Voltage", xlab = "datetime", type = "l")

#Plot 3

subData1 <- as.numeric(subSetData$Sub_metering_1)
subData2 <- as.numeric(subSetData$Sub_metering_2)
subData3 <- as.numeric(subSetData$Sub_metering_3)

plot(dateData, subData1, type="l", ylab="Energy Submetering", xlab="")
lines(dateData, subData2, type = "l", col = "red")
lines(dateData, subData3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2, lty =,  bty = "n")

#Plot 4
reacPower <- as.numeric(subSetData$Global_reactive_power)
plot(dateData, reacPower, ylab = "Global_reactive_power", xlab = "datetime", type = "l")


dev.off()



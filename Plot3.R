##Plot 3

Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
UseData <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]
UseTime <- strptime(paste(UseData$Date, UseData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
FinalUseData <- cbind(UseTime, UseData)

with(FinalUseData, {
	plot(Sub_metering_1 ~ UseTime, type="l", 
		ylab="Global Active Power (kilowatts)", xlab = "")
	lines(Sub_metering_2 ~ UseTime, col="red")
	lines(Sub_metering_3 ~ UseTime, col="blue")
	})
legend("topright", lwd=c(1,1,1), col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png", width=480, height=480)
dev.off()

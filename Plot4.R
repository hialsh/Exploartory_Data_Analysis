##Plot 4

Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
UseData <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]
UseTime <- strptime(paste(UseData$Date, UseData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
FinalUseData <- cbind(UseTime, UseData)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(FinalUseData, {
	plot(Global_active_power ~ UseTime, type="l", 
		ylab="Global Active Power", xlab = "")
	plot(Voltage ~ UseTime, type="l",
		ylab="Voltage", xlab = "")
	plot(Sub_metering_1 ~ UseTime, type="l",
		ylab="Enerby sub metering", xlab="")
	lines(Sub_metering_2 ~ UseTime, col="red")
	lines(Sub_metering_3 ~ UseTime, col="blue")
	legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
		legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	plot(Global_reactive_power ~ UseTime, type="l")
	})
		
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()

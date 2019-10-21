##Plot 2

Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
UseData <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]
UseTime <- strptime(paste(UseData$Date, UseData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
FinalUseData <- cbind(UseTime, UseData)

plot(FinalUseData$UseTime, FinalUseData$Global_active_power, col="black", xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()

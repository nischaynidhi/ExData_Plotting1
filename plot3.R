FileName <- "/Users/nischaynidhi/Desktop/coursera/household_power_consumption.txt"
data_access <- read.table(FileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data_access[data_access$Date %in% c("1/2/2007","2/2/2007") ,]
DateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
SubMetering1 <- as.numeric(subData$Sub_metering_1)
SubMetering2 <- as.numeric(subData$Sub_metering_2)
SubMetering3 <- as.numeric(subData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(DateTime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(DateTime, SubMetering2, type="l", col="red")
lines(DateTime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

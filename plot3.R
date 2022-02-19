dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data_access <- read.table(FileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data_access[data_access$Date %in% c("1/2/2007","2/2/2007") ,]
DateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
SubMetering1 <- as.numeric(subData$Sub_metering_1)
SubMetering2 <- as.numeric(subData$Sub_metering_2)
SubMetering3 <- as.numeric(subData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(subpower_con$Time,subpower_con$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subpower_con,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subpower_con,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subpower_con,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")
dev.off()

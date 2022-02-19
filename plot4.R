dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data_access <- read.table(FileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data_access[data_access$Date %in% c("1/2/2007","2/2/2007") ,]
DateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
globalReactivePower <- as.numeric(subData$Global_reactive_power)
Voltage <- as.numeric(subData$Voltage)
SubMetering1 <- as.numeric(subData$Sub_metering_1)
SubMetering2 <- as.numeric(subData$Sub_metering_2)
SubMetering3 <- as.numeric(subData$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
 plot(subpower_con$Time,as.numeric(as.character(subpower_con$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpower_con$Time,as.numeric(as.character(subpower_con$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpower_con$Time,subpower_con$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subpower_con,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subpower_con,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subpower_con,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpower_con$Time,as.numeric(as.character(subpower_con$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

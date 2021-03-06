png(file = "plot3.png")

data <- as.data.frame(read.table("household_power_consumption.txt",
                                 header = TRUE, sep = ";", na.strings = "?"))
data2 <- data[data$Date == "1/2/2007" , ]
data3 <- data[data$Date == "2/2/2007" , ]
dataused <- rbind(data2, data3)

dataused$DateTime <- paste(dataused$Date, dataused$Time)
dataused$DateTime <- strptime(dataused$DateTime, "%d/%m/%Y %H:%M:%S")

plot(dataused$DateTime, dataused$Sub_metering_1,
     type = "n", xlab = "", ylab = "Energy sub metering")
lines(dataused$DateTime, dataused$Sub_metering_1, type = "l", col="black")
lines(dataused$DateTime, dataused$Sub_metering_2, type = "l", col="red")
lines(dataused$DateTime, dataused$Sub_metering_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), col=c("black", "red", "blue"), pt.cex=1, cex=0.8)
dev.off()
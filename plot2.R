png(file = "plot2.png")

data <- as.data.frame(read.table("household_power_consumption.txt",
                                 header = TRUE, sep = ";", na.strings = "?"))
data2 <- data[data$Date == "1/2/2007" , ]
data3 <- data[data$Date == "2/2/2007" , ]
dataused <- rbind(data2, data3)

dataused$DateTime <- paste(dataused$Date, dataused$Time)
dataused$DateTime <- strptime(dataused$DateTime, "%d/%m/%Y %H:%M:%S")

plot(dataused$DateTime, dataused$Global_active_power, type = "l",
     lwd = 1, xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
png(file = "plot1.png")

data <- as.data.frame(read.table("household_power_consumption.txt",
                                 header = TRUE, sep = ";", na.strings = "?"))
data2 <- data[data$Date == "1/2/2007" , ]
data3 <- data[data$Date == "2/2/2007" , ]
dataused <- rbind(data2, data3)

hist(dataused$Global_active_power,main = "Global Active Power",
     col = "orangered", xlab = "Global Active Power (kilowatts)")

dev.off()
# load and prepare data
data <- read.delim("household_power_consumption.txt", sep = ';')
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
data[, "Sub_metering_1"] <- as.numeric(data[, "Sub_metering_1"])
data[, "Sub_metering_2"] <- as.numeric(data[, "Sub_metering_2"])
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- mutate(data, 
               time = as.POSIXct(paste(data$Date, data$Time, sep = " ")))

# indicate device, plot data and save .png file
png(filename = "plot3.png", width = 480, height = 480)
plot(data$time, data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(data$time, data$Sub_metering_2, type = "l", col = "red")
lines(data$time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

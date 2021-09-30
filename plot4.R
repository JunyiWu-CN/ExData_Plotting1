# load and prepare data
data <- read.delim("household_power_consumption.txt", sep = ';')
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
data[, "Sub_metering_1"] <- as.numeric(data[, "Sub_metering_1"])
data[, "Sub_metering_2"] <- as.numeric(data[, "Sub_metering_2"])
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- mutate(data, 
               time = as.POSIXct(paste(data$Date, data$Time, sep = " ")))
data[, "Global_active_power"] = as.numeric(data[, "Global_active_power"])
data[, "Voltage"] = as.numeric(data[, "Voltage"])
data[, "Global_reactive_power"] = as.numeric(data[, "Global_reactive_power"])

# indicate device, plot data and save .png file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

## plot1
plot(data$time, data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global active power")

## plot2
plot(data$time, data$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

## plot3
plot(data$time, data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(data$time, data$Sub_metering_2, type = "l", col = "red")
lines(data$time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot4
plot(data$time, data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

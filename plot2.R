# load and prepare data
data <- read.delim("household_power_consumption.txt", sep = ';')
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
data[, "Global_active_power"] = as.numeric(data[, "Global_active_power"])
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- mutate(data, 
               time = as.POSIXct(paste(data$Date, data$Time, sep=" ")))

# indicate device, plot data and save .png file
png(filename = "plot2.png", width = 480, height = 480)
plot(data[, "time"], data[, "Global_active_power"], 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power(kilowatts)")
dev.off()

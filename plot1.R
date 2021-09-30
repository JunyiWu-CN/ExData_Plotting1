# load and prepare data
data <- read.delim("household_power_consumption.txt", sep = ';')
data <- data[data[1] == "1/2/2007" | data[1] == "2/2/2007", ]
data[,"Global_active_power"] = as.numeric(data[,"Global_active_power"])

# indicate device, plot data, generate .png file
png(filename = "plot1.png", width = 480, height = 480)
hist(data[,"Global_active_power"], 
     xlab = "Global Active Power(kilowatts)", col = "red", 
     main = "Global Active Power")
dev.off()

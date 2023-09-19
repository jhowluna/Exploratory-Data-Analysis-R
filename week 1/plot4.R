setwd('D:/Workspace/R/Exploratory-Data-Analysis-R/week 1')
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, 
                   na.strings="?")


datetime <- paste(data$Date, data$Time)
data <- cbind(datetime, data)
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- subset(data,(Date >= "2007-02-01") & (Date <= "2007-02-02"))

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data$datetime, data$Voltage,type = 'line', xlab = "datetime", ylab = "Voltage")

plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$datetime, data$Global_reactive_power,type = 'l', xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

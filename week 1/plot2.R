setwd('D:/Workspace/R/Exploratory-Data-Analysis-R/week 1')
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, 
                   na.strings="?")


datetime <- paste(data$Date, data$Time)
data <- cbind(datetime, data)
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- subset(data,(Date >= "2007-02-01") & (Date <= "2007-02-02"))

png("plot2.png", width = 480, height = 480)

plot(data$datetime, data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
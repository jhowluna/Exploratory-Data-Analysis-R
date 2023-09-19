setwd('D:/Workspace/R/Exploratory-Data-Analysis-R/week 1')
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, 
                   na.strings="?")


datetime <- paste(data$Date, data$Time)
data <- cbind(datetime, data)

data$Date <- as.Date(data$Date,"%d/%m/%Y")
#subset(data$Date >= "2007-02-01")
data <- subset(data,(Date >= "2007-02-01") & (Date <= "2007-02-02"))

png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power")

dev.off()

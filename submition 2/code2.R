library("data.table")
library(dplyr)

setwd('D:/Workspace/R/Exploratory-Data-Analysis-R/submition 2')
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")


NEI$Emissions <- as.numeric(NEI$Emissions)
newNEI <- subset(NEI,fips=="24510")

total = newNEI %>% group_by(year) %>%
  summarise(total_NEI = sum(Emissions))

png(filename='plot2.png')
barplot(total$total_NEI
        , names = total$year
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years")

dev.off()

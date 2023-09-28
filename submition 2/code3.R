library("data.table")
library(dplyr)
library(ggplot2)

setwd('D:/Workspace/R/Exploratory-Data-Analysis-R/submition 2')
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")


NEI$Emissions <- as.numeric(NEI$Emissions)
newNEI <- subset(NEI,fips=="24510")
png("plot3.png")

ggplot(newNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
dev.off()

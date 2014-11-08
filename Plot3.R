## Set the working directory
setwd("C:/Skrishna/Coursera/ExploratoryDataAnalysis/Project1")

## read the full dataset
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## set the date dmy format
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the date range
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## freeup the memory.
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Draw the Plot
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy Submetering", xlab="")
  
  lines(Sub_metering_2~Datetime,col='Red')
  
  lines(Sub_metering_3~Datetime,col='Blue')
  
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()


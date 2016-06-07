##get the relative path of the data file from workspace
path <- "./assignment_data/eda-week1/household_power_consumption.txt"
##read the data into dataTable variable
dataTable <- read.table(path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##subset the data variable for values with "1/2/2007" AND "2/2/2007"
filteredData <- dataTable[dataTable$Date %in% c("1/2/2007","2/2/2007") ,]

##subsetting columns needed for the plot
dateandtime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(filteredData$Sub_metering_1)
subMetering2 <- as.numeric(filteredData$Sub_metering_2)
subMetering3 <- as.numeric(filteredData$Sub_metering_3)

##getting png graphic device
png("plot3.png", width=480, height=480)
##Plotting the chart
plot(dateandtime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateandtime, subMetering2, type="l", col="red")
lines(dateandtime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
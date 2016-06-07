##get the relative path of the data file from workspace
path <- "./assignment_data/eda-week1/household_power_consumption.txt"
##read the data into dataTable variable
dataTable <- read.table(path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##subset the data variable for values with "1/2/2007" AND "2/2/2007"
filteredData <- dataTable[dataTable$Date %in% c("1/2/2007","2/2/2007") ,]

##subsetting columns needed for the plot
dateandtime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActPower <- as.numeric(filteredData$Global_active_power)
globalReactPower <- as.numeric(filteredData$Global_reactive_power)
voltage <- as.numeric(filteredData$Voltage)
subMetering1 <- as.numeric(filteredData$Sub_metering_1)
subMetering2 <- as.numeric(filteredData$Sub_metering_2)
subMetering3 <- as.numeric(filteredData$Sub_metering_3)

##getting png graphic device
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
##Plotting the chart
plot(dateandtime, globalActPower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dateandtime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateandtime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateandtime, subMetering2, type="l", col="red")
lines(dateandtime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dateandtime, globalReactPower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
##get the relative path of the data file from workspace
path <- "./assignment_data/eda-week1/household_power_consumption.txt"
##read the data into dataTable variable
dataTable <- read.table(path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##subset the data variable for values with "1/2/2007" AND "2/2/2007"
filteredData <- dataTable[dataTable$Date %in% c("1/2/2007","2/2/2007") ,]

##subsetting date and time vector from the filteredData
dateandtime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActPower <- as.numeric(filteredData$Global_active_power)
##getting png graphic device
png("plot2.png", width=480, height=480)
##Plotting the chart
plot(dateandtime, globalActPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
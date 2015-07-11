#References: rdpeng/ExData_Plotting1, https://github.com/TomLous

## load data and discard all rows but those of days 1/2/2007 and 2/2/2007
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";",dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# build datatimes vector
datetimes <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plot data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# copy to file in png format
dev.off()
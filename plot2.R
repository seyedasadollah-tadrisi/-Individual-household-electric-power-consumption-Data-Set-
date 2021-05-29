# Time Series of Global Active Power

# Read Data
power <- read.table('household_power_consumption.txt', sep=";", header=TRUE, na.strings='?')
subpower <- subset(power, Date=='1/2/2007' | Date=='2/2/2007')

subpower$Datetime <- strptime(paste(subpower$Date, subpower$Time), "%d/%m/%Y %H:%M:%S")


# create plot2.png
png("plot2.png", height=480, width=480)
with(subpower, plot(Datetime, Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()
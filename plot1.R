# Histogram of Global Active Power

# Read Data
power <- read.table('household_power_consumption.txt', sep=";", header=TRUE, na.strings='?')
subpower <- subset(power, Date=='1/2/2007' | Date=='2/2/2007')

# create plot1.png
png("plot1.png", height=480, width=480)
with(subpower, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))

dev.off()
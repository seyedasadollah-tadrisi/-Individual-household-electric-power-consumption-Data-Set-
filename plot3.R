# Time Series of Global Active Power submeter

# Read Data
power <- read.table('household_power_consumption.txt', sep=";", header=TRUE, na.strings='?')
subpower <- subset(power, Date=='1/2/2007' | Date=='2/2/2007')

subpower$Datetime <- strptime(paste(subpower$Date, subpower$Time), "%d/%m/%Y %H:%M:%S")


# create plot3.png
png("plot3.png", height=480, width=480)
plot(subpower$Datetime,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subpower,lines(Datetime,Sub_metering_1))
with(subpower,lines(Datetime,Sub_metering_2, col="red"))
with(subpower,lines(Datetime,Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
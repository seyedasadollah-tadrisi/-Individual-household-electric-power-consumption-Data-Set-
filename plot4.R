# 4 plots

# Read Data
power <- read.table('household_power_consumption.txt', sep=";", header=TRUE, na.strings='?')
subpower <- subset(power, Date=='1/2/2007' | Date=='2/2/2007')

subpower$Datetime <- strptime(paste(subpower$Date, subpower$Time), "%d/%m/%Y %H:%M:%S")


# create plot4.png
png("plot4.png", height=480, width=480)

par(mfrow=c(2,2))

with(subpower, plot(Datetime, Global_active_power, type="l",  xlab="",ylab="Global Active Power"))

with(subpower, plot(Datetime, Voltage, type="l",xlab="datetime",ylab="Voltage"))

plot(subpower$Datetime,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subpower,lines(Datetime,Sub_metering_1))
with(subpower,lines(Datetime,Sub_metering_2, col="red"))
with(subpower,lines(Datetime,Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(subpower, plot(Datetime, Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power"))

dev.off()

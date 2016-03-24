# read .txt file "household_power_consumption" from working directory
power <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

# Get date-time format
power$DateTime <- paste(power$Date,power$Time)
power$DateTime <- as.POSIXlt(power$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Get Subset for this exercise
powersub <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]



# save as .png
png(file = "plot4.png")

#plot 4 graphs, 2x2
par(mfrow=c(2,2))

# Graph 1
plot( powersub$DateTime, powersub$Global_active_power, type="n",
	ylab="Global Active Power", 
	xlab="", 
	ylim = c(0, 7.5),
	yaxt='n'
)
lines(powersub$DateTime, powersub$Global_active_power, yaxt='n')
axis(side=2, at=c(0,2,4,6), labels=c(0,2,4,6))

# Graph 2
plot( powersub$DateTime, powersub$Voltage, type="n",
	ylab="Voltage", 
	xlab="datetime", 
	ylim = c(233, 247),
	yaxt='n'
)
lines(powersub$DateTime, powersub$Voltage, yaxt='n')
axis(side=2, at=c(236, 240, 244), labels = FALSE)
axis(side=2, 
	at=c(234, 238, 242, 246), 
	labels=c(234, 238, 242, 246)
)

# Graph 3
plot( powersub$DateTime, powersub$Sub_metering_1, type="n",
	ylab = "Energy sub metering",
	xlab = "",
	ylim = c(0,40),
	yaxt='n'
)
lines(powersub$DateTime, powersub$Sub_metering_1, col="black", yaxt='n')
lines(powersub$DateTime, powersub$Sub_metering_2, col="red", yaxt='n')
lines(powersub$DateTime, powersub$Sub_metering_3, col="blue", yaxt='n')
axis(side=2, at=c(0,10,20,30), labels=c(0,10,20,30))
legend('topright', 
	c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	col=c("black", "red", "blue"),
	lty=c(1,1,1),
	bty="n"
)

# Graph 4
plot( powersub$DateTime, powersub$Global_reactive_power, type="n",
	ylab="Global_reactive_power", 
	xlab="datetime", 
	ylim = c(0.0, 0.5),
	yaxt='n'
)
lines(powersub$DateTime, powersub$Global_reactive_power, yaxt='n')
axis(side=2, 
	at=seq(0,.5,.1)
)

dev.off()


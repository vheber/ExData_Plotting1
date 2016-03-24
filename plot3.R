# read .txt file "household_power_consumption" from working directory
power <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

# Get date-time format
power$DateTime <- paste(power$Date,power$Time)
power$DateTime <- as.POSIXlt(power$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Get Subset for this exercise
powersub <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

# save as .png
png(file = "plot3.png")

# plot line graph
plot( powersub$DateTime, powersub$Sub_metering_1, type="n",
	ylab = "Energy sub metering",
	xlab = "",
	ylim = c(0,40),
	yaxt='n'
)

# add a line for each sub-metering
lines(powersub$DateTime, 
	powersub$Sub_metering_1, 
	col="black", 
	yaxt='n',
)
lines(powersub$DateTime, 
	powersub$Sub_metering_2, 
	col="red", 
	yaxt='n',
)
lines(powersub$DateTime, 
	powersub$Sub_metering_3, 
	col="blue", 
	yaxt='n',
)

# add y axis tick-marks and labels
axis(side=2, at=c(0,10,20,30), labels=c(0,10,20,30))

# add legend in top right corner
legend('topright', 
	c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	col=c("black", "red", "blue"),
	lty=c(1,1,1)
)

dev.off()


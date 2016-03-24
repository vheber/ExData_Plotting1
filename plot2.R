# read .txt file "household_power_consumption" from working directory
power <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

# Get date-time format
power$DateTime <- paste(power$Date,power$Time)
power$DateTime <- as.POSIXlt(power$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Get Subset for this exercise
powersub <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

# save as .png
png(file = "plot2.png")

# plot line graph
plot( powersub$DateTime, powersub$Global_active_power, type="n",
	ylab="Global Active Power (kilowatts)", 
	xlab="",
	ylim = c(0, 7.5),
)

lines(powersub$DateTime, powersub$Global_active_power, 
	yaxt='n',
)

axis(side=2, at=c(0,2,4,6), labels=c(0,2,4,6))

dev.off()


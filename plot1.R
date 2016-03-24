# read .txt file "household_power_consumption" from working directory
power <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
power$DateTime <- as.POSIXlt(paste(power$Date,power$Time), format = "%d/%m/%Y %H:%M:%S")

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

powersub <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]


png(file = "plot1.png")
hist(powersub$Global_active_power, 
	col = "red", 
	breaks = 11, 
	main="Global Active Power", 
	xlab="Global Active Power (kilowatts)", 
	xlim = c(0, 9), 
	ylim = c(0, 1200),
	xaxt='n'#,
	#cex.lab = .75,
	#cex.main = .9,
	#cex.axis = .75
)

axis(side=1, at=c(0,2,4,6), labels=c(0,2,4,6))#, cex.axis = .75)
dev.off()


# read file data as table
dt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset of data with only two dates
sdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]


#read Global Active Power and 3 submetering values as numeric
globalActivePower <- as.numeric(sdt$Global_active_power)
subMetering1      <- as.numeric(sdt$Sub_metering_1)
subMetering2      <- as.numeric(sdt$Sub_metering_2)
subMetering3      <- as.numeric(sdt$Sub_metering_3)

# create two more variables from plot 3
globalReactivePower <- as.numeric(sdt$Global_reactive_power)
voltage <- as.numeric(sdt$Voltage)

#concat date and time fields
dtTime <- strptime(paste(sdt$Date, sdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#open a png file to be edited
png("plot4.png", width=480, height=480)

# set a plot area with two rows and two columns
par(mfrow = c(2, 2)) 

#create first plot
plot(dtTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#create second plot for voltage
plot(dtTime, voltage, type="l", xlab="datetime", ylab="Voltage")

# create third plot with theree measures against global active power
plot(dtTime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(dtTime, subMetering2, type="l", col="red")
lines(dtTime, subMetering3, type="l", col="blue")

#create legend for third plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#create fourth plot
plot(dtTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#close file
dev.off()
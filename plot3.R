# read file data as table
dt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset of data with only two dates
sdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]


#read Global Active Power and 3 submetering values as numeric
globalActivePower <- as.numeric(sdt$Global_active_power)
subMetering1      <- as.numeric(sdt$Sub_metering_1)
subMetering2      <- as.numeric(sdt$Sub_metering_2)
subMetering3      <- as.numeric(sdt$Sub_metering_3)

#concat date and time fields
dtTime <- strptime(paste(sdt$Date, sdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#open a png file to be edited
png("plot3.png", width=480, height=480)

# create a plot with theree measures against global active power
plot(dtTime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(dtTime, subMetering2, type="l", col="red")
lines(dtTime, subMetering3, type="l", col="blue")

#create legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#close file
dev.off()
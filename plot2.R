# read file data as table
dt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset of data with only two dates
sdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]


#read Global Active Power as numeric
globalActivePower <- as.numeric(sdt$Global_active_power)

#concat date and time fields
dtTime <- strptime(paste(sdt$Date, sdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create a png to be edited
png("plot2.png", width=480, height=480)

# create histogram
plot(dtTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#close file
dev.off()
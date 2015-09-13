# read file data as table
dt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset of data with only two dates
sdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

#read Global Active Power as numeric
globalActivePower <- as.numeric(sdt$Global_active_power)

#create a png to be edited
png("plot1.png", width=480, height=480)

# create histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#close file
dev.off()

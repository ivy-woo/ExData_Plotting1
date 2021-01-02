#read in data
x <- read.table("household_power_consumption.txt", sep=";", header=T)
#subset data from 01 to 02 Feb 2007
x <- x[grep("^(1|2)/2/2007",x$Date),]

#convert numeric data from chr to num class
x[,3:8] <- lapply(x[,3:8], as.numeric)

#create new column with date time information and POSIXct format
x$DateTime <- paste(x$Date,x$Time)
x$DateTime <- as.POSIXct(x$DateTime, format="%d/%m/%Y %H:%M:%S")

#create plot
png("plot_3.png", width=480, height=480, units="px")
plot(x$DateTime, x$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(x$DateTime, x$Sub_metering_2, col="red")
lines(x$DateTime, x$Sub_metering_3, col="blue")
legend("topright", legend=names(x)[7:9], lty=1, col=c("black","red","blue"))
dev.off()
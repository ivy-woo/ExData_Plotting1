#read in data
x <- read.table("household_power_consumption.txt", sep=";", header=T)
#subset data on 01 and 02 Feb 2007
x <- x[grep("^(1|2)/2/2007",x$Date),]

#convert numeric data from chr to num class
x[,3:8] <- lapply(x[,3:8], as.numeric)

#create new column with date time information and POSIXct format
x$DateTime <- paste(x$Date,x$Time)
x$DateTime <- as.POSIXct(x$DateTime, format="%d/%m/%Y %H:%M:%S")


#create plot
png("plot_4.png", width=480, height=480, units="px")
par(mfcol=c(2,2))

plot(x$DateTime,x$Global_active_power, type="l", 
     ylab="Global Active Power", xlab="")

plot(x$DateTime, x$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(x$DateTime, x$Sub_metering_2, col="red")
lines(x$DateTime, x$Sub_metering_3, col="blue")
legend("topright", legend=names(x)[7:9], lty=1, col=c("black","red","blue"), bty="n")

plot(x$DateTime, x$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(x$DateTime, x$Global_reactive_power, type="l", 
     ylab=names(x)[4], xlab="datetime")

dev.off()
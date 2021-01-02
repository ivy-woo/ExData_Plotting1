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
png("plot_2.png", width=480, height=480, units="px")
plot(x$DateTime,x$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

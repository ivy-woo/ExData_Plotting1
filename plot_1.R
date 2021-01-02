#read in data
x <- read.table("household_power_consumption.txt", sep=";", header=T)
#subset data from 01 to 02 Feb 2007
x <- x[grep("^(1|2)/2/2007",x$Date),]

#convert numeric data from chr to num class
x[,3:8] <- lapply(x[,3:8], as.numeric)

#create plot
png("plot_1.png", width=480, height=480, units="px")
hist(x$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()

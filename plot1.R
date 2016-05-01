setwd("C:/Users/shanna_ricketts/Dropbox/Coursera")
energy <- read.table("household_power_consumption.txt",sep = ";", header = T)
x <- energy[energy$Date %in% c("1/2/2007","2/2/2007") ,]
x$power<-as.numeric(levels(x$Global_active_power))[x$Global_active_power]

## Graph 1
png(file = "plot1.png")
hist(x$power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()




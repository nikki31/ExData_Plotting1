setwd("C:/Users/shanna_ricketts/Dropbox/Coursera")
energy <- read.table("household_power_consumption.txt",sep = ";", header = T)
x <- energy[energy$Date %in% c("1/2/2007","2/2/2007") ,]
x$power<-as.numeric(levels(x$Global_active_power))[x$Global_active_power]
x$date<-strptime(paste(x$Date, x$Time, sep = " "), "%d/%m/%Y %H:%M:%S" )


## Graph 2
png(file = "plot2.png")
with(x, plot(date, power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)"))
dev.off()



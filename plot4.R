setwd("C:/Users/shanna_ricketts/Dropbox/Coursera")
energy <- read.table("household_power_consumption.txt",sep = ";", header = T)
x <- energy[energy$Date %in% c("1/2/2007","2/2/2007") ,]
x$power<-as.numeric(levels(x$Global_active_power))[x$Global_active_power]
x$date<-strptime(paste(x$Date, x$Time, sep = " "), "%d/%m/%Y %H:%M:%S" )
x$sub1<-as.numeric(levels(x$Sub_metering_1))[x$Sub_metering_1]
x$sub2<-as.numeric(levels(x$Sub_metering_2))[x$Sub_metering_2]
x$sub3<-x$Sub_metering_3 ## already numeric
x$volt<-as.numeric(levels(x$Voltage))[x$Voltage]
x$react<-as.numeric(levels(x$Global_reactive_power))[x$Global_reactive_power]


## Graph 4
png(file = "plot4.png")
par(mfrow = c(2,2))
## top left chart
with(x, plot(date, power, type = "l", xlab = " ", ylab = "Global Active Power"))

## top right chart
with(x, plot(date, volt, type = "l", xlab = "datetime", ylab = "Voltage"))

## bottom left chart
with(x, plot(date, sub1, type = "l", xlab = " ", ylab = "Energy sub metering", col = "black"))
lines(x$date, x$sub2, type = "l", xlab = " ", ylab = "Energy sub metering", col = "red")
lines(x$date, x$sub3, type = "l", xlab = " ", ylab = "Energy sub metering", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")

## bottom right chart
with(x, plot(date, react, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()


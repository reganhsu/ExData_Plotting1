initial <- read.table("household_power_consumption.txt",nrows=100,sep=";",header=TRUE)
classes <- sapply(initial,class)

# initial$Date <- as.Date(initial$Date,"%d/%m/%Y")
# initial$Time <- as.POSIXct(paste(initial$Date,initial$Time),format="%Y-%m-%d %H:%M:%S")

tabAll <- read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses = classes, comment.char="?",fill=TRUE)
tabAll$Date <- as.Date(tabAll$Date,"%d/%m/%Y")
# tabAll$Time <- as.POSIXct(paste(tabAll$Date,tabAll$Time),format="%Y-%m-%d %H:%M:%S")

d <- subset(tabAll,Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
# d$Date <- as.Date(d$Date,"%d/%m/%Y")
d$Time <- as.POSIXct(paste(d$Date,d$Time),format="%Y-%m-%d %H:%M:%S")

png(file = "plot4.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
par(mfrow = c(2,2))
plot(d$Time,d$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(d$Time,d$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(d$Time,d$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(d$Time,d$Sub_metering_2,type="l",col="red")
lines(d$Time,d$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
plot(d$Time,d$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()
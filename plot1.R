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

png(file = "plot1.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
hist(d$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
#load headers
headers <- as.character(fread("household_power_consumption.txt",header=FALSE,
                              nrows=1))
#load data from 2007-02-01 & 2007-02-02
data <- fread("household_power_consumption.txt",header=FALSE,nrows=2880,
              skip=66637)
#set header names
oldnames <- names(data)
setnames(data,oldnames,headers)
#convert Date & Time columns
data$Time <- as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#make plot
png(file = "plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#plot1
plot(data$Time,data$Global_active_power,type="l",xlab="",
     ylab="Global Active Power")
#plot2
plot(data$Time,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
#plot3
plot(data$Time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(data$Time,data$Sub_metering_1,col="black")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col = c("black","red","blue"), bty="n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#plot4
plot(data$Time,data$Global_reactive_power,type="l",xlab="datetime",
     ylab="Global_reactive_power")
dev.off()


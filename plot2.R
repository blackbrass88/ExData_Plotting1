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
png(file = "plot2.png", width=480, height=480)
plot(data$Time,data$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()


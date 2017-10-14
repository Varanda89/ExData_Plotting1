library(lubridate)
library(dplyr)

DFrame<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
Date_Time<-dmy_hms(paste(DFrame$Date,DFrame$Time,sep=" "))
restriction<-year(Date_Time)==2007&month(Date_Time)==2&{day(Date_Time)==1|day(Date_Time)==2}
DFrame<-DFrame[restriction,]
Date_Time<-Date_Time[restriction]
DFrame<-cbind(DFrame,Date_Time)
rm(Date_Time)
rm(restriction)


##Plot3
png(filename="plot3.png", width=480, height=480, units="px")
with(DFrame,plot(Date_Time,Sub_metering_1, ylab="Energy sub metering",xlab=" ", type="n"))
with(DFrame,lines(Date_Time,Sub_metering_1))
with(DFrame,lines(Date_Time,Sub_metering_2, col="red"))
with(DFrame,lines(Date_Time,Sub_metering_3, col="blue"))
legend("topright", col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()


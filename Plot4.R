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

##Plot4
png(filename="plot4.png", width=480, height=480, units="px")
par(mfcol=c(2,2))

with(DFrame,plot(Date_Time,Global_active_power, ylab="Global Active Power (kilowatts)", xlab=" ", type="n"))
with(DFrame,lines(Date_Time,Global_active_power))

with(DFrame,plot(Date_Time,Sub_metering_1, ylab="Energy sub metering",xlab=" ", type="n"))
with(DFrame,lines(Date_Time,Sub_metering_1))
with(DFrame,lines(Date_Time,Sub_metering_2, col="red"))
with(DFrame,lines(Date_Time,Sub_metering_3, col="blue"))
legend("topright", col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), fill="transparent", border = "transparent")

with(DFrame,plot(Date_Time,Voltage, ylab="Voltage", xlab="datetime", type="n"))
with(DFrame,lines(Date_Time,Voltage))

with(DFrame,plot(Date_Time,Global_reactive_power, xlab="datetime", type="n"))
with(DFrame,lines(Date_Time,Global_reactive_power))


dev.off()

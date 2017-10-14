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


##Plot 1
png(filename="plot1.png", width=480, height=480, units="px")
with(DFrame,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()

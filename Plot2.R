library(dplyr)
library(lubridate)
electricity<-read.csv("household_power_consumption.txt",header = TRUE, sep=";")
electricity$Date<-paste(electricity$Date,electricity$Time)
electricity<-mutate(electricity,Date=as.POSIXct(Date,format="%d/%m/%Y %H:%M:%OS"))
electricity <- subset( electricity, select = -Time )
small_electricity<-filter(electricity,year(electricity$Date)==2007 & month(electricity$Date)==02 & (day(electricity$Date)==01|  day(electricity$Date)==02))
small_electricity$Global_active_power <- sub(",",".",small_electricity$Global_active_power)
small_electricity$Global_active_power<-as.numeric(small_electricity$Global_active_power)
png(filename="Plot2.png",width = 480, height = 480)
par(pty="s")
plot(small_electricity$Date,small_electricity$Global_active_power,type = 'l',ylab= "Global Active Power (kilowatts)",xlab = '')
dev.off()
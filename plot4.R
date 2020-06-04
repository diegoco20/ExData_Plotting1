#Loading Libraries
library(dplyr)
library(lubridate)

#Reading Data
mydata=tbl_df(read.table(dir()[3], sep=";", head=T, na.strings = c("?", "")))
# Converting Date variable in Date class 

mydata$Date=dmy(mydata$Date)

#Filtering Data by date
mydata_filtered=filter(mydata, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))
rm(mydata)

# Pasting date and time in one variable
mydata_filtered$Data_time= paste(mydata_filtered$Date, mydata_filtered$Time)
mydata_filtered$Data_time= ymd_hms(mydata_filtered$Data_time)

#Ploting 
names(mydata_filtered)
png(file="plot4.png", width=480, height = 480)
par(mfrow=c(2,2), mar=c(2, 2, 2, 2))
with(mydata_filtered, plot(Data_time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(mydata_filtered, plot(Data_time, Voltage, type="l", xlab="datetime"))
with(mydata_filtered, plot(Data_time, Sub_metering_1, type= "l", xlab="", ylab="Energy sub metering "))
with(mydata_filtered, lines(Data_time, Sub_metering_2, type= "l", col="red"))
with(mydata_filtered, lines(Data_time, Sub_metering_3, type= "l", col="blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(mydata_filtered, plot(Data_time, Global_reactive_power, type="l", xlab="datetime"))
dev.off()

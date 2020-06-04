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
png(file="plot2.png", width= 480, height= 480)
with(mydata_filtered,
     plot(Data_time, Global_active_power, type = "l",xlab="", ylab= "Global Active Power (kilowatts)"))
dev.off()

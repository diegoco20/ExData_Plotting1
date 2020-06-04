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

#Creating Histogram 
png(file = "plot1.png", width = 480, height = 480)
with(mydata_filtered, 
     hist(Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()

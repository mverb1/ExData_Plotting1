
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
# retrieve the file, specify the characteristics and read it in csv format
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
# convert the data format
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)   

with(data1, {
    plot(Sub_metering_1 ~ Datetime, type = "l", xlab = "", 
         ylab = "Energy sub metering")
    lines(Sub_metering_2 ~ Datetime, col = "red")
    lines(Sub_metering_3 ~ Datetime, col = "blue")
}) # create the plot

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# add legend on the top right corner
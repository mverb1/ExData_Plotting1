
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
# retrieve the file, specify the characteristics and read it in csv format
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
# convert the data format
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)   

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
# set margins to accomodate 4 graphs

with(data1, {
    plot(Global_active_power ~ Datetime, type = "l", xlab = "", 
         ylab = "Global Active Power")
    plot(Voltage ~ Datetime, type = "l", xlab = "datetime", 
         ylab = "Voltage")
    plot(Sub_metering_1 ~ Datetime, type = "l", xlab = "", 
         ylab = "Energy sub metering")
    lines(Sub_metering_2 ~ Datetime, col = "red")
    lines(Sub_metering_3 ~ Datetime, col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ Datetime, type = "l", xlab = "datetime", 
         ylab = "Global_reactive_power")
}) # create the plot

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


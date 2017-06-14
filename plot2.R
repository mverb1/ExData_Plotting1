
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
# retrieve the file, specify the characteristics and read it in csv format
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
# convert the data format
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)   

with(data1, {
    plot(Global_active_power ~ Datetime, type = "l", xlab = "", 
         ylab = "Global Active Power (kilowatts)")
})
# create the plot

dev.copy(png, file = "plot2.png", height = 480, width = 280)
# save png plot in 480x480 pixel format    
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# retrieve the file, specify the characteristics and read it in csv format

data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
# create a subset of the data which only includes data fom Feb 1-2, 2007

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

hist(data1$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "red", breaks = 12, main = "Global Active Power")

png("plot1.png", width=480, height=480)
dev.off()
# produce the graph in png format
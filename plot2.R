## Preparing the data
data1 <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

data2 <- subset(data1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data1)

## Converting
datetime <- paste(as.Date(data2$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)

## Making Plot 2
plot(data2$Global_active_power~data2$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
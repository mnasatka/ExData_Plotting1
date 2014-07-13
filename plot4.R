## Read household data
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=TRUE, sep=';',na.strings='?', colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
datetime <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2))

with(dat, {
  plot(datetime, Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
  plot(datetime, Voltage, type="l",ylab="Voltage")
  plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(datetime, Sub_metering_2, type='l', col="red")
  lines(datetime, Sub_metering_3, type='l', col="blue")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lwd=1, col = c("black","blue", "red"), pt.cex=1, cex=0.3)
  plot(datetime, Global_reactive_power, type="l")
})
dev.copy(png, file = "plot4.png")
dev.off() 
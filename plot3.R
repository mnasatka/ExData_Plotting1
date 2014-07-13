## Read household data
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=TRUE, sep=';',na.strings='?', colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
datetime <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

with(dat, {
  plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(datetime, Sub_metering_2, type='l', col="red")
  lines(datetime, Sub_metering_3, type='l', col="blue")
})
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col = c("black","blue", "red"))
dev.copy(png, file = "plot3.png")
dev.off()
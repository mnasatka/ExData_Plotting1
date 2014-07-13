## Read household data
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=TRUE, sep=';',na.strings='?', colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
datetime <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
par(mfrow = c(1, 1))
with(dat, {
  plot(datetime, Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
})
dev.copy(png, file = "plot2.png")
dev.off() 
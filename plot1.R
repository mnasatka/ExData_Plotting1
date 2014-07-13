## Read household data
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=TRUE, sep=';',na.strings='?', colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
par(mfrow = c(1, 1))
hist(dat$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off() 
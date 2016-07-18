# plot4.R

# read subset of data
# dates 2007-02-01 and 2007-02-02 (172800 seconds in 2 days)
elec<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
elec$Date<-as.Date(elec$Date, format="%d/%m/%Y")
elec$Datetime<-as.POSIXct(paste(elec$Date,elec$Time))
eles <- subset(elec, subset = (Datetime >= "2007-02-01" & Datetime < "2007-02-03"))
# make data numeric
eles$Global_active_power <-as.numeric(eles$Global_active_power)
eles$Global_reactive_power <-as.numeric(eles$Global_reactive_power)
eles$Voltage <-as.numeric(eles$Voltage)
eles$Sub_metering_1 <-as.numeric(eles$Sub_metering_1)
eles$Sub_metering_2 <-as.numeric(eles$Sub_metering_2)
eles$Sub_metering_3 <-as.numeric(eles$Sub_metering_3)

# create plot4
par(mfrow=c(2,2),mar=c(4,4,1,1))
with(eles,plot(Datetime,Global_active_power, ylab="Global Active Power (kilowatts)", type="l"))
with(eles,plot(Voltage ~ Datetime, xlab="datetime", ylab="Voltage", type="l"))
with(eles,{plot(Datetime, Sub_metering_1, xlab="", ylab="Energy sub metering (kilowatts)", type="l")
      lines(Datetime, Sub_metering_2, col="red")
      lines(Datetime, Sub_metering_3, col="blue")})
legend("topright",col=c("black","red","blue"), bty="n", lwd=2, legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.5)
with(eles,plot(Datetime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l"))
# save as png 480x480 pixels
dev.copy(png,'plot4.png')
dev.off()
# plot2.R

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


# create plot2
with(eles,plot(Datetime,Global_active_power, type="l", xlab= "datetime", ylab="Global Active Power (kilowatts)"))
# save as png 480x480 pixels
dev.copy(png,'plot2.png')
dev.off()

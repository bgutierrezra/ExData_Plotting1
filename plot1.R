
# Set working directory where household_power_consumption.txt resides
setwd("~/CX Knowledge Management pa/2015 Courses/DST Exploratory data analysis/Assignment 1")


# read data
column.classes<-c(rep("character", 2), rep("numeric", 7))
power.data<-read.table("household_power_consumption.txt", header=TRUE,
                        sep=';', na.strings="?",colClasses=column.classes)


# subset 
power.data<-power.data[power.data$Date=="1/2/2007" | power.data$Date=="2/2/2007",]


# create histogram in png device

png(filename = "plot1.png", width=480, height=480)
hist(power.data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

# close device
dev.off()



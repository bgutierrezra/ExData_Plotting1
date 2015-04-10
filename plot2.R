
# Set working directory where household_power_consumption.txt resides
setwd("~/CX Knowledge Management pa/2015 Courses/DST Exploratory data analysis/Assignment 1")



# read data
column.classes<-c(rep("character", 2), rep("numeric", 7))

power.data<-read.table("household_power_consumption.txt", header=TRUE,
                       sep=';', na.strings="?",colClasses=column.classes)

# subset
power.data<-power.data[power.data$Date=="1/2/2007" | power.data$Date=="2/2/2007",]

# create auxiliary variable for plotting purposes with the right date format
power.data$DateTime<- with(power.data, paste(Date, Time))

power.data$DateTime<-strptime(power.data$DateTime, "%d/%m/%Y %H:%M:%S")


# create line plot
png(filename = "plot2.png", width=480, height=480)

plot(power.data$DateTime, power.data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close device
dev.off()




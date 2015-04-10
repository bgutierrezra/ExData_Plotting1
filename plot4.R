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



# open png device                           
png(filename = "plot4.png", width=480, height=480)


# create 2 x 2 plotting grid
par(mfrow=c(2,2))


# Create FIRST PLOT
plot(power.data$DateTime, power.data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")


# Create SECOND PLOT
plot(power.data$DateTime, power.data$Voltage, type="l", xlab='datetime', ylab="Voltage")


# Create THIRD PLOT
# plot submetering 1
plot(power.data$DateTime, power.data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

# include additional lines to the same plot for Submetering 2 and 3
lines(power.data$DateTime,power.data$Sub_metering_2,col="red")
lines(power.data$DateTime,power.data$Sub_metering_3,col="blue") 

# include legend
legend("topright", col=c("black", "red", "blue"), 
       lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Create FOURTH PLOT
plot(power.data$DateTime, power.data$Global_reactive_power, type="l", xlab='datetime', ylab="Global_reactive_power")


# close device
dev.off()


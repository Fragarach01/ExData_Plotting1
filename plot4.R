## Read in the data 

data <- read.table("Exploratory Data Analysis Quiz Data/household_power_consumption.txt",
                   sep = ";", header = T)


## Change Date column class to Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")


## Isolate the data for the required dates 
data2 <- data[data$Date == as.Date("01/02/2007", "%d/%m/%Y") | data$Date == as.Date("02/02/2007", "%d/%m/%Y"), ]


## Create unified DateTime variable to plot the time series
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S")


## Create a png file for the plot
png(file = "ExData_Plotting1/plot4.png", width = 480, height = 480)


## Create the plots
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

with(subset(data2), plot(DateTime, Global_active_power, col = "black", ylab = "Global Active Power", xlab = "", type = "l"))

with(subset(data2), plot(DateTime, Voltage, col = "black", ylab = "Voltage", xlab = "datetime", 
type = "l"))

with(subset(data2), {
	plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
	points(DateTime, Sub_metering_2, type = "l", col = "red")
	points(DateTime, Sub_metering_3, type = "l", col = "blue")
	legend("topright", lty = 1, col = c("black", "red", "blue"),
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = 16, box.col = 			"white")
})

with(subset(data2), plot(DateTime, Global_reactive_power, col = "black", ylab = "Global_reactive_power", xlab = "datetime", type = "l"))


## Close the PNG Device
dev.off()

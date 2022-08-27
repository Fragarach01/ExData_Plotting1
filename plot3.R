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
png(file = "ExData_Plotting1/plot3.png", width = 480, height = 480)


## Create the plot
with(data2, plot(DateTime, Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering"))
with(subset(data2), points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(subset(data2), points(DateTime, Sub_metering_3, type = "l", col = "blue"))


## Create the legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Close the PNG device
dev.off()


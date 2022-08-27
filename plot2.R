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
png(file = "ExData_Plotting1/plot2.png", width = 480, height = 480)


## Create the plot 
with(data2, plot(DateTime, Global_active_power, col = "black", ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))


## Close the PNG device
dev.off()
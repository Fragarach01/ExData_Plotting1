## Read in the data 

data <- read.table("Exploratory Data Analysis Quiz Data/household_power_consumption.txt",
                   sep = ";", header = T)


## Change Date column class to Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")


## Isolate the data for the required dates 
data2 <- data[data$Date == as.Date("01/02/2007", "%d/%m/%Y") | data$Date == as.Date("02/02/2007", "%d/%m/%Y"), ]


## Create a png file for the plot
png(file = "ExData_Plotting1/plot1.png", width = 480, height = 480)


## Create the histogram
hist(as.numeric(data2$Global_active_power), breaks = 12,
     col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")


## Close the PNG device
dev.off()

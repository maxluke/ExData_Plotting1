# Read data into R
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Subset data to include only days of interest
datagood <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Create a new dataframe with a new Date_time variable
DateTime <- paste(datagood$Date, datagood$Time)
Date_time <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
datagood["Date_time"] <- NA
datagood$Date_time <- Date_time
newdatagood <- datagood[,c(10, 3, 4, 5, 6, 7, 8, 9)]

# Open a PNG file device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# Create sub metering line graph
with(newdatagood, plot(Date_time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", pch = ""))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(newdatagood$Date_time, newdatagood$Sub_metering_1)
lines(newdatagood$Date_time, newdatagood$Sub_metering_2, col = "red")
lines(newdatagood$Date_time, newdatagood$Sub_metering_3, col = "blue")

# Close the file device
dev.off()

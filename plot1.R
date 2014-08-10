# Read data into R
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Subset data to include only days of interest
datagood <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Open a PNG file device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Create histogram
hist(datagood$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Close the file device
dev.off()
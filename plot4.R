# Read the data
file <- "household_power_consumption.txt"
data_full <- read.table(file, header = TRUE, sep = ";", na.strings = "?")

# Convert Date column into Date class objects
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

# Subset data for dates Feb 1, 2007 to Feb 2, 2007
data <- subset(data_full, Date == "2007-02-01" | Date == "2007-02-02")

# Make "datetime" variable of POSIXct class in order to graph
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# Make Plot 4 (4 line graphs). Start by opening the PNG graphics device to account for scaling issues.
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

# Plot 4.1
with(data, plot(datetime, Global_active_power, type = "l",
                xlab = "", ylab = "Global Active Power (kilowatts)"))
# Plot 4.2
with(data, plot(datetime, Voltage, type = "l",
                xlab = "datetime", ylab = "Voltage"))
# Plot 4.3
with(data, plot(datetime, Sub_metering_1, type = "l", 
                xlab = "", ylab = "Energy sub metering"))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n")
# Plot 4.4
with(data, plot(datetime, Global_reactive_power, type = "l",
                xlab = "datetime"))
dev.off()